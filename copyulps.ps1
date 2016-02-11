$LocalBaseDir = "N:\scholzj\sze\DesyUlpUtilityBelt\"
$EagleBaseDir = "N:\4all\public\Eagle_6+\ulp\"

$files = @("Libdesy.lib","bom.ulp","Ulp-Service\editbau.ulp","Ulp-Service\readlibs.ulp","Ulp-Service\nextbib.ulp","Ulp-Service\tags.ulp","Ulp-Service\uebersicht.ulp")

foreach ($item in $files) {

$LocalSource = $LocalBaseDir + $item
$EagleSource = $EagleBaseDir + $item

$LocalFileDate = (ls $LocalSource).LastWriteTime
$EagleFileDate = (ls $EagleSource).LastWriteTime

#echo "$LocalSource :$LocalFileDate"
#echo "$EagleSource :$EagleFileDate"

	if ($LocalFileDate -lt $EagleFileDate) {
		Copy-Item  $EagleSource -Destination $LocalSource -force
		echo "Local file$LocalSource was older and has been replaces with $EagleSource"
	}
	if ($LocalFileDate -gt $EagleFileDate) {
		Copy-Item  $LocalSource -Destination $EagleSource -force
		echo "External file $EagleSource was older and has been replaces with $LocalSource"
	}
}


