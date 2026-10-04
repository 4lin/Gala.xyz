<?php
// Exercise the exact controller deadline expression under each account timezone.
$zones = array('Europe/Madrid', 'UTC', 'America/New_York');
$dates = array('2026-03-29T00:30:00Z', '2026-03-29T01:30:00Z', '2026-10-25T00:30:00Z', '2026-10-25T01:30:00Z', '2026-03-08T07:30:00Z', '2026-11-01T06:30:00Z');
foreach (array('Buildings', 'Research') as $page) {
    $source = file_get_contents(__DIR__.'/../includes/pages/game/Show'.$page.'Page.class.php');
    if (!preg_match("/'endtime'\\s*=>\\s*([^,\\n]+),/", $source, $match)) throw new Exception('Missing deadline expression');
    foreach ($zones as $zone) {
        date_default_timezone_set($zone);
        $USER = array('timezone' => $zone);
        foreach ($dates as $date) {
            $epoch = (new DateTimeImmutable($date))->getTimestamp();
            $BuildArray = array(0, 0, 0, $epoch);
            $actual = eval('return '.$match[1].';');
            if ($actual !== $epoch) throw new Exception($page.' epoch shifted in '.$zone);
        }
    }
}
echo "PASS: raw Buildings/Research deadlines in Madrid, UTC, New York across DST transitions\n";
