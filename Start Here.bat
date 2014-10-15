Echo OFF
set _home=%~dp0
:MENU
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~Black Lotus Optimization Batch Menu~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO ................................................................................
ECHO     PRESS 1 or 2 for sim type. PRESS 3 to go back to main menu or Q to Quit.
ECHO ................................................................................
ECHO.
ECHO 			1 - BRAWL (Ordered) Gauntlet
ECHO 			2 - Guild War Gauntlet
ECHO 			3 - SIMPLE Guild War Gauntlet - For Oct 17th
ECHO 			Q - Quit Batch
ECHO.

SET /P C=Type 1, 2, 3, or Q then press ENTER: || Set C=11

::You can find these sub menu's around line number 173 to 224
IF %C%==1 (
	CLS
	CALL "MassBWLtest.bat"
	CLS
	ECHO ~~~~~~~~~~~~~~~~~~~~~~~~ Brawl Gauntlet COMPLETE~~~~~~~~~~~~~~~~~~~~~~~~~~~
	ECHO ...............................................................................
	ECHO The BRAWL has finished.
	ECHO ...............................................................................
	pause
	GOTO BRAWL
	)
IF %C%==2 (
	CLS
	CALL "MassGWtest.bat"
	CLS
	ECHO ~~~~~~~~~~~~~~~~~~~~~~~~Guild War Gauntlet COMPLETE~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	ECHO ...............................................................................
	ECHO The Guild War Gauntlet has finished.
	ECHO ...............................................................................
	pause
	GOTO BRAWL
	)
IF %C%==3 (
	CLS
	CALL "SimpleMassGWtest.bat"
	CLS
	ECHO ~~~~~~~~~~~~~~~~~~~~~~~~Guild War Gauntlet COMPLETE~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	ECHO ...............................................................................
	ECHO The Guild War Gauntlet has finished.
	ECHO ...............................................................................
	pause
	GOTO BRAWL
	)
IF %C%==11 GOTO BRAWL
IF /I %C%==Q GOTO END

:END
echo We need to delete this it is for testing  :)~
pause