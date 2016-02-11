SET FILES=LP-Daten.ulp bom.ulp PlatzhalterErsetzen.ulp Libdesy.lib Libdesy.lib readlibs.ulp editbau.ulp nextbib.ulp tags.ulp
SET ULPP='N:\4all\public\Eagle_6+\ulp'
FOR %%d IN (%FILES%) DO (
	FOR %%i IN (%%d) DO SET DATE1=%%~ti
	FOR %%i IN (%ULPP%%%d) DO SET DATE2=%%~ti
	IF "%DATE1%"=="%DATE2%" ECHO Files have same age && GOTO END
	::FOR /F %%i IN ('DIR /B /O:D %%d %ULP%%%d') DO SET NEWEST=%%i
	::ECHO Newer file is %NEWEST%

	:END

)

::Copy "LP-Daten.ulp" "N:\4all\public\Eagle_6+\ulp\LP-Daten.ulp" 
::Copy "bom.ulp" "N:\4all\public\Eagle_6+\ulp\bom.ulp"
::Copy "PlatzhalterErsetzen.ulp" "N:\4all\public\Eagle_6+\ulp\PlatzhalterErsetzen.ulp"
::Copy "Libdesy.lib" "N:\4all\public\Eagle_6+\ulp\Libdesy.lib"
::Copy "Libdesy.lib" "N:\4all\public\Eagle_6+\ulp\Ulp-Service\Libdesy.lib"
::Copy "readlibs.ulp" "N:\4all\public\Eagle_6+\ulp\Ulp-Service\readlibs.ulp"
::Copy "editbau.ulp" "N:\4all\public\Eagle_6+\ulp\Ulp-Service\editbau.ulp"
::Copy "nextbib.ulp" "N:\4all\public\Eagle_6+\ulp\Ulp-Service\nextbib.ulp"
::Copy "tags.ulp" "N:\4all\public\Eagle_6+\ulp\Ulp-Service\tags.ulp"

pause