@ echo off

set root=%~dp0
set lists=%root%Lists\
set Helpdeskers=%Lists%Helpdeskers.txt
set Settings=%lists%Settings.txt

rem this should come from settings
setlocal EnableDelayedExpansion

for /f %%a in (%Settings%) do (
	set domain=%%a
	)

echo[
echo		***************************************************************
echo		*    In order to be able to preform some of the operations    *
echo		*    You must provide a Domain-controller authentication      *
echo		***************************************************************
echo[


set counter=0
for /f %%a in (%Helpdeskers%) do (
	set /a counter+=1
	echo 	!counter! - %%a
	set list[!counter!]=%%a
	)
	echo 	.  - Exit

rem for /l %%x in (1,1,%counter%) do @(
rem 	echo !List[%%x]!
rem 	)


REM This batch asks for Domain-controller credentials in order to perform AD operations
REM then opens the MAIN.bat

echo[

set /p superuser=	Select your Domain-controller user: 

runas /user:!List[%superuser%]!@%domain% "%root%02_MAIN.bat" 

if %superuser%==. exit

exit
