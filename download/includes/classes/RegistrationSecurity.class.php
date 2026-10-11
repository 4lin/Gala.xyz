<?php
/** Registration checks shared by the form and its server-side handler. */
class RegistrationSecurity
{
    const TTL = 900;
    const LIMIT = 10;

    public static function provider($config)
    {
        $value = (string)$config->capaktiv;
        return $value === '2' ? 'turnstile' : ($value === '1' ? 'recaptcha' : 'local');
    }

    public static function issue($now = null)
    {
        $now = $now === null ? time() : $now;
        if (!isset($_SESSION['registration_forms'])) $_SESSION['registration_forms'] = array();
        foreach ($_SESSION['registration_forms'] as $id => $form) {
            if ($form['issued'] + self::TTL < $now) unset($_SESSION['registration_forms'][$id]);
        }
        while (count($_SESSION['registration_forms']) >= 10) array_shift($_SESSION['registration_forms']);
        $id = bin2hex(random_bytes(16));
        $token = bin2hex(random_bytes(32));
        $_SESSION['registration_forms'][$id] = array('token'=>$token, 'issued'=>$now);
        return array('id'=>$id, 'token'=>$token);
    }

    public static function validForm($id, $token, $honeypot, $now = null)
    {
        $now = $now === null ? time() : $now;
        if (!is_string($id) || !is_string($token) || !is_string($honeypot) || $honeypot !== '') return false;
        if (!isset($_SESSION['registration_forms'][$id])) return false;
        $form = $_SESSION['registration_forms'][$id];
        return $now >= $form['issued'] && $now <= $form['issued'] + self::TTL && hash_equals($form['token'], $token);
    }

    public static function consume($id)
    {
        unset($_SESSION['registration_forms'][$id]);
    }

    public static function challenge($id)
    {
        if (!isset($_SESSION['registration_forms'][$id]) || $_SESSION['registration_forms'][$id]['issued'] + self::TTL < time()) return null;
        $alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
        $answer = '';
        for ($i=0; $i<6; $i++) $answer .= $alphabet[random_int(0, strlen($alphabet)-1)];
        $_SESSION['registration_forms'][$id]['answer'] = hash_hmac('sha256', $answer, $_SESSION['registration_forms'][$id]['token']);
        return $answer;
    }

    public static function verifyLocal($id, $answer)
    {
        if (!is_string($answer) || !isset($_SESSION['registration_forms'][$id]['answer'])) return false;
        $form = $_SESSION['registration_forms'][$id];
        unset($_SESSION['registration_forms'][$id]['answer']);
        return hash_equals($form['answer'], hash_hmac('sha256', strtoupper(trim($answer)), $form['token']));
    }

    public static function allowAttempt($directory, $ip, $universe, $now = null)
    {
        $now = $now === null ? time() : $now;
        $file = $directory.'/registration-limit-'.hash('sha256', $ip.'|'.$universe).'.json';
        $handle = @fopen($file, 'c+');
        if (!$handle || !flock($handle, LOCK_EX)) { if ($handle) fclose($handle); return false; }
        try {
            $data = json_decode(stream_get_contents($handle), true);
            if (!is_array($data) || !isset($data['start'],$data['count']) || $data['start'] + self::TTL <= $now) $data = array('start'=>$now, 'count'=>0);
            $allowed = $data['count'] < self::LIMIT;
            $data['count'] = min(self::LIMIT, $data['count']+1);
            rewind($handle); ftruncate($handle, 0);
            if (fwrite($handle, json_encode($data)) === false) return false;
            fflush($handle);
            return $allowed;
        } finally { flock($handle, LOCK_UN); fclose($handle); }
    }

    public static function validTurnstileResponse($result, $hostname)
    {
        return is_array($result) && isset($result['success'],$result['hostname'],$result['action']) &&
            $result['success'] === true && $result['action'] === 'register' &&
            strcasecmp($result['hostname'], $hostname) === 0;
    }

    public static function verifyTurnstile($token, $secret, $hostname)
    {
        if (!is_string($token) || $token === '' || strlen($token)>2048 || !is_string($secret) || $secret === '' || $hostname === '') return false;
        // Test credentials must never be accepted on a public server.
        if (preg_match('/^[123]x0{10}/', $secret) && !in_array($hostname,array('localhost','127.0.0.1','::1'),true)) return false;
        $endpoint = 'https://challenges.cloudflare.com/turnstile/v0/siteverify';
        $body = http_build_query(array('secret'=>$secret,'response'=>$token));
        $raw = false;
        if (function_exists('curl_init')) {
            $curl = curl_init($endpoint);
            curl_setopt_array($curl,array(CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>$body,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>3,CURLOPT_TIMEOUT=>8,CURLOPT_SSL_VERIFYPEER=>true,CURLOPT_SSL_VERIFYHOST=>2,CURLOPT_HTTPHEADER=>array('Content-Type: application/x-www-form-urlencoded')));
            $raw = curl_exec($curl);
            if (curl_getinfo($curl,CURLINFO_HTTP_CODE)!==200) $raw = false;
            curl_close($curl);
        } else {
            $context=stream_context_create(array('http'=>array('method'=>'POST','header'=>"Content-Type: application/x-www-form-urlencoded\r\n",'content'=>$body,'timeout'=>8,'follow_location'=>0),'ssl'=>array('verify_peer'=>true,'verify_peer_name'=>true)));
            $raw=@file_get_contents($endpoint,false,$context);
        }
        return $raw !== false && self::validTurnstileResponse(json_decode($raw,true),$hostname);
    }
}
