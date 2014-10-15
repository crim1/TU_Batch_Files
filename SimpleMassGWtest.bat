@echo off

set _home=%~dp0
set _dmembers=%~dp0data/members

echo Date and Time, Player, Effect, Your Fortress, Enemy Fortress, Win rate, Commander, Card 1, Card 2, Card 3, Card 4, Card 5, Card 6, Card 7, Card 8, Card 9, Card 10>>"Guild War".txt

Set /p mNum=Set the member file number (1 - 4):
REM set /p _climb=Set the climb (recommended not more than 1000 unless running overnight): 
set _climb=5000
Echo.
REM set /p _enemy=Set the enemy set or deck: 
set _enemy=220K
Echo.
set /p _threads=Set the amount of Threads to run with: 
Echo.
::ECHO Temporarily, this version does not look for a battle ground effect.
cls
ECHO Select a Battle Ground Effect
Echo 1. None
Echo ----------------------------------------
Echo 2. Protect all X
Echo 3. Metamorphosis (all units are Progen)
Echo 4. Enfeeble all X
Echo ----------------------------------------
Echo 5. Enhance all Armor X
Echo 6. Enhance all Berserk X
Echo 7. Enhance all Corrosive X
Echo 8. Enhance all Counter X
Echo 9. Enhance all Enfeeble X
Echo 10. Enhance all Evade X
Echo 11. Enhance all Heal X
Echo 12. Enhance all Inhibit X
Echo 13. Enhance all Leech X
Echo 14. Enhance all Pierce X
Echo 15. Enhance all Poison X
Echo 16. Enhance all Protect X
Echo 17. Enhance all Rally X
Echo 18. Enhance all Siege X
Echo 19. Enhance all Strike X
Echo 20. Enhance all Weaken X
Echo 21. Heal all X
Echo 22. Weaken all X
Echo 23. Rally all X
Echo 24. Reaping X (new skill for guild war on Oct 17th)
Echo ----------------------------------------
REM set /P BGE=Enter the number of the BGE you'd like to use.... 
REM pause
set BGE=24
Cls

IF %BGE%==1 (
	GOTO GUILD
	)
IF %BGE%==2 (
	set NBGE=Protect all 
	GOTO BGEVALUE
	)
IF %BGE%==3 (
	set Background=Metamorphosis
	GOTO GUILD
	)
IF %BGE%==4 (
	set NBGE=Enfeeble all 
	GOTO BGEVALUE
	)
IF %BGE%==5 (
	set NBGE=Enhance all Armor 
	GOTO BGEVALUE
	)
IF %BGE%==6 (
	set NBGE=Enhance all Berserk  
	GOTO BGEVALUE
	)
IF %BGE%==7 (
	set NBGE=Enhance all Corrosive  
	GOTO BGEVALUE
	)
IF %BGE%==8 (
	set NBGE=Enhance all Counter 
	GOTO BGEVALUE
	)
IF %BGE%==9 (
	set NBGE=Enhance all Enfeeble 
	GOTO BGEVALUE
	)
IF %BGE%==10 (
	set NBGE=Enhance all Evade 
	GOTO BGEVALUE
	)
IF %BGE%==11 (
	set NBGE=Enhance all Heal 
	GOTO BGEVALUE
	)
IF %BGE%==12 (
	set NBGE=Enhance all Inhibit 
	GOTO BGEVALUE
	)
IF %BGE%==13 (
	set NBGE=Enhance all Leech 
	GOTO BGEVALUE
	)
IF %BGE%==14 (
	set NBGE=Enhance all Pierce 
	GOTO BGEVALUE
	)
IF %BGE%==15 (
	set NBGE=Enhance all Poison 
	GOTO BGEVALUE
	)
IF %BGE%==16 (
	set NBGE=Enhance all Protect 
	GOTO BGEVALUE
	)
IF %BGE%==17 (
	set NBGE=Enhance all Rally 
	GOTO BGEVALUE
	)
IF %BGE%==18 (
	set NBGE=Enhance all Siege 
	GOTO BGEVALUE
	)
IF %BGE%==19 (
	set NBGE=Enhance all Strike 
	GOTO BGEVALUE
	)
IF %BGE%==20 (
	set NBGE=Enhance all Weaken 
	GOTO BGEVALUE
	)
IF %BGE%==21 (
	set NBGE=Heal all 
	GOTO BGEVALUE
	)
IF %BGE%==22 (
	set NBGE=Weaken all 
	GOTO BGEVALUE
	)
IF %BGE%==23 (
	set NBGE=Rally all 
	GOTO BGEVALUE
	)
IF %BGE%==24 (
	set NBGE=Reaping 
	GOTO BGEVALUE
	)

Echo.
:BGEVALUE
cls
set /p bgeVal=Enter the amount of %NBGE%....
set Background=%NBGE%%bgeVal%
:GUILD
cls

:DECKPREP
cd %_home%
del "%~dp0data"\customdecks.txt
del temp.txt
copy "%~dp0data"\SOURCE.txt "%~dp0data"\customdecks.txt
echo.>>"%~dp0data"\customdecks.txt

cd %_dmembers%

IF EXIST members%mNum%.txt (
	REM Set /p _edit=Do you want to edit the list of guild members? Enter Y or N: 
	echo made it here
	pause
	) ELSE (
	Echo Please create the members%mNum%.txt file by entering the names that match inventory file names. The notepad will now launch...
	break>members%mNum%.txt
	Start members%mNum%.txt
	)

REM if /I %_edit%==Y (
	REM start members%mNum%.txt
	REM pause
	REM )

IF %BGE% NEQ 1 (
	GOTO WITHBGE
	)

:NOBGE
::read in the members of the guild
::Using an ARRAY to read in the players. Now we get offsets :) instead of individual variables... so much cleaner
setlocal ENABLEDELAYEDEXPANSION
set pCount=0
for /F "tokens=*" %%A in (members%mNum%.txt) do (
	SET /A pcount=!pcount! + 1
    set player[!pcount!]=%%A
	echo !player[%pCount%]!
	cd %_home%
	call gwPlayerTest.bat
	cd %_dmembers%
)
EndLocal
GOTO END

:WITHBGE
::read in the members of the guild
::Using an ARRAY to read in the players. Now we get offsets :) instead of individual variables... so much cleaner
setlocal ENABLEDELAYEDEXPANSION
set pCount=0
for /F "tokens=*" %%A in (members%mNum%.txt) do (
	SET /A pcount=!pcount! + 1
    set player[!pcount!]=%%A
	echo !player[%pCount%]!
	cd %_home%
	call gwPlayerTest.BGE.bat
	cd %_dmembers%
)
EndLocal

:END