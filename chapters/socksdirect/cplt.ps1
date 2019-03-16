 param (
    [string]$filename
 )
 echo $filename
 $file = Get-ChildItem $filename
Set-Location $file.DirectoryName
gnuplot -shell-escape $file.FullName