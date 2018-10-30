<?php
ini_set('display_errors',1);
error_reporting(E_ALL);
$filename="list-migrate-clean.txt";
$myfile = fopen("list-migrate-clean.txt", "r") or die(error_get_last());
$counter = 0;
$filecount=0;
$max = 10;
echo "begin";
while(!feof($myfile))
{
 if($counter ==0) {
    $writefile = fopen("listmigratephase-".$filecount.".txt","w") or die('cannot open write file');
  $filecount++;
 }
  if($counter <$max) {
   $data =fgets($myfile);
     fwrite($writefile,$data);
        echo "writing..";
  }

 $counter++;
  if ($counter == $max ) $counter =0;
}
fclose($myfile);

?>
