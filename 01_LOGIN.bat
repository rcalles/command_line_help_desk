@ echo off

set root=%~dp0
set lists=%root%Lists\
set Helpdeskers=%Lists%Helpdeskers.txt
set Settings=%lists%Settings.txt

setlocal EnableDelayedExpansion

for /f %%d in (%Settings%) do (
	set domain=%%d
	)

echo[
echo		***************************************************************
echo		*    In order to be able to preform some of the operations    *
echo		*    You must provide a Domain-controller authentication      *
echo		***************************************************************
echo[


set counter=0
for /f %%h in (%Helpdeskers%) do (
	set /a counter+=1
	echo 	!counter! - %%h
	set list[!counter!]=%%h
	)
	echo 	.  - Exit

rem for /l %%i in (1,1,%counter%) do @(
rem 	echo !List[%%i]!
rem 	)

echo[

set /p superuser=		Select your Domain-controller user: 

if %superuser%==. exit

runas /user:!List[%superuser%]!@%domain% "%root%02_MAIN.bat" 

exit
