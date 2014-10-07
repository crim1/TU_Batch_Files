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
SET _remove=%_result:*: =%cls
echo Remove: %_remove%
set _current=%_current%%_result%
echo %_current%>>"%~dp0data"\customdecks.txt
cls
echo Current: %_current%

:OPTIMIZE
Echo testing: %test%
CALL tuo "testing_%test%" "%_enemy%" gw ordered -t %_threads% -e "%Background%" -o="%~dp0data"\%test%.txt climb %_climb%>>temp.txt
	set _temp=
	for /F "delims=" %%t in ('findstr "Optimized" temp.txt') do set _temp=!_temp!%%t	
	set cdeck1=%_temp:*: =%
	set cdeck2=%cdeck1:: =, %
	echo %Date% and %Time%,%test%,%Background%,%cdeck2%>>"Brawl Results".txt
	del temp.txt
GOTO %NEXTDEFENSE%

:INCREMENT
cd %_dmembers%
exit /b