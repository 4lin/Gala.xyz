<?php
// Check legacy mysqli overrides without changing persistent game data.
chdir(dirname(__DIR__));
error_reporting(E_ALL);
set_error_handler(function ($severity, $message, $file, $line) {
    if (error_reporting() & $severity) {
        throw new ErrorException($message, 0, $severity, $file, $line);
    }
});
require 'includes/classes/Database_BC.class.php';
$db = new Database_BC();
try {
    $result = $db->query('SELECT 1 AS value');
    if (!($result instanceof mysqli_result) || $result->fetch_assoc()['value'] != 1) {
        throw new Exception('SELECT must return a result set');
    }
    $result->free();
    if ($db->query('SET @gala_bc_test = 1') !== true) {
        throw new Exception('Statements without result sets must return true');
    }
    if ($db->multi_query('SELECT 1; SELECT 2') !== true) {
        throw new Exception('Multi-query must return true');
    }
    if ($db->countquery('SELECT @gala_bc_test') != 1 || $db->get_sql() !== 5) {
        throw new Exception('Multi-query results were not drained or counted correctly');
    }
    echo 'PASS: class loading, SELECT, boolean result, multi-query draining and query count'.PHP_EOL;
} finally {
    $db->close();
    restore_error_handler();
}
