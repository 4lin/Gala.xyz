{include file="overall_header.tpl"}

<table width="60%">
    <tr>
		<td>{$info_information}</td>
    </tr>
    <tr>
		<td>
<pre class="left">-- {$LNG.info_server_heading} --
{$LNG.info_server_software}: {$info}
{$LNG.info_php_version}: {$vPHP} ({$vAPI})
{$LNG.info_json_available}: {$json}
{$LNG.info_bcmath_available}: {$bcmath}
{$LNG.info_curl_available}: {$curl}
{$LNG.info_safe_mode}: {$safemode}
{$LNG.info_memory_limit}: {$memory}
{$LNG.info_mysql_client}: {$vMySQLc}
{$LNG.info_mysql_server}: {$vMySQLs}
{$LNG.info_error_log}: {$errorlog} ({$errorloglines}, {$log_errors})
{$LNG.info_timezone}: {$php_tz} / {$conf_tz} / {$user_tz}
Suhosin: {$suhosin}
{$LNG.info_db_version}: {$dbVersion}

-- {$LNG.info_game_heading} --
{$LNG.info_game_version}: 2Moons {$vGame}
{$LNG.info_game_address}: http://{$root}/
{$LNG.info_game_path}: http://{$gameroot}/index.php

{$LNG.info_browser}: {$browser}</pre>
		</td>
    </tr>
</table>
{include file="overall_footer.tpl"}