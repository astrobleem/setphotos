$files = Get-ChildItem c:\temp\*.jpg
foreach ($file in $files) 
{
$emp = $file.name -replace ".{4}$"
echo $emp



$photo = [byte[]](Get-Content "$file" -Encoding byte)            


$user = get-aduser -filter 'employeeid -eq $emp' -properties thumbnailPhoto
$gn = $user.name

if ($user.ThumbnailPhoto) { echo "$gn : Already has Photo" } 
else {
echo "Setting photo for $gn"
Set-ADUser $user -Replace @{thumbnailPhoto=$photo}
}


}
