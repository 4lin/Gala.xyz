<?php
// Original procedural neutral assets. GPL-3.0; no source pixels are copied.
function neutralImage($sourceFile,$target,$path) {
 $extension=strtolower(pathinfo($target,PATHINFO_EXTENSION));
 if($extension==='svg'){file_put_contents($target,'<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120"><rect width="120" height="120" rx="12" fill="#102438"/><circle cx="60" cy="60" r="31" fill="#316b8b"/><ellipse cx="60" cy="60" rx="49" ry="12" fill="none" stroke="#9dddeb" stroke-width="3" transform="rotate(-25 60 60)"/></svg>');return;}
 $size=@getimagesize($sourceFile);$w=$size?max(1,min(2048,$size[0])):64;$h=$size?max(1,min(2048,$size[1])):64;
 $image=imagecreatetruecolor($w,$h);$base=imagecolorallocate($image,10,24,38);imagefill($image,0,0,$base);
 if($w<=4||$h<=4){imagecolortransparent($image,$base);}else{
  $hash=hexdec(substr(hash('sha256',$path),0,4));$color=imagecolorallocate($image,35+$hash%50,90+$hash%65,130+$hash%65);$line=imagecolorallocate($image,137,205,228);
  $diameter=max(4,(int)(min($w,$h)*.48));imagefilledellipse($image,(int)($w/2),(int)($h/2),$diameter,$diameter,$color);
  imageellipse($image,(int)($w/2),(int)($h/2),min($w-2,(int)($diameter*1.7)),max(3,(int)($diameter*.45)),$line);
  if($w>=160&&$h>=60)imagestring($image,3,12,12,'GALA.XYZ',$line);
 }
 if($extension==='jpg'||$extension==='jpeg')imagejpeg($image,$target,80);
 elseif($extension==='gif')imagegif($image,$target);
 elseif($extension==='webp'&&function_exists('imagewebp'))imagewebp($image,$target,80);
 elseif($extension==='ico'){ob_start();imagepng($image);$png=ob_get_clean();file_put_contents($target,pack('vvv',0,1,1).pack('CCCCvvVV',$w<256?$w:0,$h<256?$h:0,0,0,1,32,strlen($png),22).$png);}
 else imagepng($image,$target,9);
 imagedestroy($image);
}

// Include this file and call neutralImage(sourcePath, outputPath, relativePath).
// Source files are read only for dimensions; their pixels are never loaded.
