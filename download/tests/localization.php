<?php
$root = isset($argv[1]) ? $argv[1] : dirname(__DIR__);
$stage = isset($argv[2]) ? $argv[2] : '';
$langs = array('en','es','fr','de','pl','pt','ru','tr');
function flattenCatalog($array,$prefix='') {
    $result=array();
    foreach($array as $key=>$value) {
        $path=$prefix === '' ? (string)$key : $prefix.'.'.$key;
        if(is_array($value)) $result += flattenCatalog($value,$path);
        elseif(is_string($value)) $result[$path]=$value;
    }
    return $result;
}
$catalogs=array();
$sections=array();
foreach($langs as $lang) {
    $combined=array();
    foreach(array('L18N','INGAME','TECH','FLEET','PUBLIC','ADMIN','INSTALL','FAQ','BANNER','CUSTOM') as $section) {
        $path='language/'.$lang.'/'.$section.'.php';
        $file=$stage && file_exists($stage.'/'.$path) ? $stage.'/'.$path : $root.'/'.$path;
        $LNG=array();
        ob_start(); require $file; ob_end_clean();
        $sections[$lang][$section]=flattenCatalog($LNG);
        $combined=array_replace_recursive($combined,$LNG);
    }
    $catalogs[$lang]=flattenCatalog($combined);
}
$union=array();
foreach($catalogs['en'] as $key=>$value) $union[$key]=true;
$errors=0;
foreach($langs as $lang) {
    foreach($union as $key=>$unused) if(!isset($catalogs[$lang][$key]) || (trim($catalogs[$lang][$key]) === '' && !in_array($key,array('gl_short_enemy','gl_short_friend','gl_short_member','sys_colo_arrival')))) { echo "MISSING $lang $key\n"; $errors++; }
}
foreach($catalogs['en'] as $key=>$source) {
    preg_match_all('/%(?:\d+\$)?[+\-0-9.]*[bcdeEfFgGosuxX]/',$source,$matches);
    $expected=$matches[0]; sort($expected);
    foreach(array('es','fr','de','pl','pt','ru','tr') as $lang) {
        if(!isset($catalogs[$lang][$key])) continue;
        preg_match_all('/%(?:\d+\$)?[+\-0-9.]*[bcdeEfFgGosuxX]/',$catalogs[$lang][$key],$matches);
        $actual=$matches[0]; sort($actual);
        if($actual !== $expected) { echo 'PLACEHOLDER '.$lang.' '.$key.' EN='.json_encode($expected).' ACTUAL='.json_encode($actual)."\n"; $errors++; }
    }
}
echo 'Catalog leaves: '.json_encode(array_map('count',$catalogs))."; issues: $errors\n";


$seen=array();
$iterator=new RecursiveIteratorIterator(new RecursiveDirectoryIterator($root.'/styles/templates'));
foreach($iterator as $file) {
 if(!$file->isFile() || substr($file->getFilename(),-4)!=='.tpl') continue;
 preg_match_all('/\$LNG\.([a-zA-Z_][a-zA-Z_0-9]*)/',file_get_contents($file->getPathname()),$matches);
 foreach($matches[1] as $key) {
  if(isset($catalogs['en'][$key])) continue;
  foreach($catalogs['en'] as $known=>$value) if(strpos($known,$key.'.')===0) continue 2;
  $seen[$key][]=$file->getFilename();
 }
}
foreach($seen as $key=>$files) echo $key.' '.implode(',',array_unique($files))."\n";
echo count($seen)." missing static template keys\n";
$phpMissing=array();
foreach(array('game','adm','login') as $area) {
 $iterator=new RecursiveIteratorIterator(new RecursiveDirectoryIterator($root.'/includes/pages/'.$area));
 foreach($iterator as $file) {
  if(!$file->isFile()||substr($file->getFilename(),-4)!=='.php') continue;
  if(strpos($file->getFilename(),'class.Show')===0) continue; // Unused controllers from the older router.
  preg_match_all('/\$LNG\[\s*[\'"]([a-zA-Z_][a-zA-Z_0-9]*)[\'"]\s*\]/',file_get_contents($file->getPathname()),$matches);
  foreach($matches[1] as $key) {
   if(isset($catalogs['en'][$key])) continue;
   foreach($catalogs['en'] as $known=>$value) if(strpos($known,$key.'.')===0) continue 2;
   $phpMissing[$key][]=$file->getFilename();
  }
 }
}
foreach($phpMissing as $key=>$files) echo $key.' '.implode(',',array_unique($files))."\n";
echo count($phpMissing)." missing static controller keys\n";

exit(($errors || count($seen) || count($phpMissing)) ? 1 : 0);

