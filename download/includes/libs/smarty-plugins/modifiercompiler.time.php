<?php
// Original 2Moons plugin by Jan-Otto Kröpke.
// Preserve the game's duration formatting independently of Smarty releases.
function smarty_modifiercompiler_time($params, $compiler)
{
    return 'pretty_time('.$params[0].')';
}
