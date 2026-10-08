<?php
// Original 2Moons plugin by Jan-Otto Kröpke.
// Preserve the existing JSON encoding used by game scripts.
function smarty_modifiercompiler_json($params, $compiler)
{
    return 'json_encode('.$params[0].')';
}
