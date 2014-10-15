@echo off

echo %pcount%
set test=!player[%pcount%]!
echo %test%
del temp.txt

setlocal ENABLEDELAYEDEXPANSION
findstr "Current" "%~dp0data"\%test%.txt>>temp.txt
SET _current=testing_%test%: 
set content=
for /F "delims=" %%i in (temp.txt) do set content=!content! %%i
SET _result=%content:*: =%
cls
echo Result: %_result%
SET _remove=%_result:*: =%
cls
echo Remove: %_remove%
set _current=%_current%%_result%
echo %_current%>>"%~dp0data"\customdecks.txt
cls
echo Current: %_current%

:OTEST1
SET _yfort=Death Factory (2)
SET NEXTOFFENSE=OTEST2
GOTO DTEST1

:OTEST2
SET _yfort=Inspiring Altar (2)
SET NEXTOFFENSE=OTEST3
GOTO DTEST1

:OTEST3
SET _yfort=Death Factory, Inspiring Altar
SET NEXTOFFENSE=OTEST4
GOTO DTEST1

:OTEST4
SET _yfort=Corrosive Spore (2)
SET NEXTOFFENSE=OTEST5
GOTO DTEST1

:OTEST5
SET _yfort=Corrosive Spore, Mortar Tower
SET NEXTOFFENSE=OTEST6
GOTO DTEST1

:OTEST6
SET _yfort=Corrosive Spore, Lightning Cannon
SET NEXTOFFENSE=OTEST7
GOTO DTEST1

:OTEST7
SET _yfort=Corrosive Spore, Death Factory
SET NEXTOFFENSE=OTEST8
GOTO DTEST1

:OTEST8
SET _yfort=Mortar Tower (2)
SET NEXTOFFENSE=OTEST9
GOTO DTEST1

:OTEST9
SET _yfort=Lightning Cannon (2)
SET NEXTOFFENSE=OTEST10
GOTO DTEST1

:OTEST10
SET _yfort=Sky Fortress (2)
SET NEXTOFFENSE=INCREMENT
GOTO DTEST1


:DTEST1
SET _efort=Illuminary Blockade
SET NEXTDEFENSE=DTEST2
GOTO OPTIMIZE

:DTEST2
set _efort=Foreboding Archway
SET NEXTDEFENSE=DTEST3
GOTO OPTIMIZE

:DTEST3
set _efort=Forcefield
SET NEXTDEFENSE=DTEST4
GOTO OPTIMIZE

:DTEST4
set _efort=Tesla Coil
SET NEXTDEFENSE=CORE
GOTO OPTIMIZE

:CORE
SET NEXTDEFENSE=%NEXTOFFENSE%
GOTO OPTCORE

:OPTIMIZE
set cyfort=%_yfort:, = and %
Echo testing: %test% %cyfort% vs. %_efort%
CALL tuo "testing_%test%" "%_enemy%" gw -t %_threads% yf "%_yfort%" ef "%_efort%" -o="%~dp0data"\%test%.txt climb %_climb%>>temp.txt
	set _temp=
	for /F "delims=" %%t in ('findstr "Optimized" temp.txt') do set _temp=!_temp!%%t	
	set cdeck1=%_temp:*: =%
	set cdeck2=%cdeck1:: =, %
	echo %Date% and %Time%,%test%,No Effect,%cyfort%,%_efort%,%cdeck2%>>"Guild War".txt
	del temp.txt
GOTO %NEXTDEFENSE%

:OPTCORE
set cyfort=%_yfort:, = and %
Echo testing: %test% %cyfort% vs. Core
CALL tuo "testing_%test%" "%_enemy%" gw -t %_threads% yf "%_yfort%" -o="%~dp0data"\%test%.txt climb %_climb%>>temp.txt
	set _temp=
	for /F "delims=" %%t in ('findstr "Optimized" temp.txt') do set _temp=!_temp!%%t
	set cdeck1=%_temp:*: =%
	set cdeck2=%cdeck1:: =, %
	echo %Date% and %Time%,%test%,No Effect,%cyfort%,Core Attack,%cdeck2%>>"Guild War".txt
	del temp.txt
GOTO %NEXTDEFENSE%


:INCREMENT
cd %_dmembers%
exit /b