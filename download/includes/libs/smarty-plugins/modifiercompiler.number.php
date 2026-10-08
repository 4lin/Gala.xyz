<?php
// Original 2Moons plugin by Jan-Otto Kröpke.
// Preserve the game's resource-number formatting independently of Smarty releases.
function smarty_modifiercompiler_number($params, $compiler)
{
    return 'pretty_number('.$params[0].')';
}
