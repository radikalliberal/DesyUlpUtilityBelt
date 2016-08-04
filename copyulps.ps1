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
		echo "Local file $LocalSource is older, the external File has to be reviewed before overwriting"
		$ok = 0
		while ( $ok -eq 0 ) {
		$option = Read-Host "diff: d, replace:r, ignore:i`nchoose option"
		$ok = 1
		switch ($option) 
		    { 
		        'd' {	"diff"
						Start-Process -FilePath "C:\Program Files\Sublime Text 3\sublime_text.exe" -ArgumentList "$LocalSource $EagleSource"
				} 
		        'r' {	"replace"
						Copy-Item  $EagleSource -Destination $LocalSource -force
						echo "Local file $LocalSource has been replaced with $EagleSource"
				} 
		        'i' {"ignore"}
		        default {"Please use one of the three options"
						 $ok = 0
				}
		    }
	    }
	}
	if ($LocalFileDate -gt $EagleFileDate) {
		$ok = 0
		echo "$LocalSource is newer than $EagleSource"
		while ( $ok -eq 0 ) {
			$option = Read-Host "diff: d, replace:r, ignore:i`nchoose option"
			$ok = 1
			switch ($option) 
			    { 
			        'd' {	"diff"
							Start-Process -FilePath "C:\Program Files\Sublime Text 3\sublime_text.exe" -ArgumentList "$LocalSource $EagleSource"
					} 
			        'r' {	"replace"
							Copy-Item  $LocalSource -Destination $EagleSource -force
							echo "External file $EagleSource has been replaced with $LocalSource"
					} 
			        'i' {"ignore"}
			        default {"Please use one of the three options"
							 $ok = 0
					}
			    }
	    }
		
		
	}
    if ($LocalFileDate -eq $EagleFileDate) {
		echo "File $EagleSource is up-to-date"
    }
}


