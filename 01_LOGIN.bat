@ echo off

set root=%~dp0

REM This batch asks for Domain-controller credentials in order to perform AD operations
REM then opens the MAIN Raw Help Desk bat

echo[
echo		***************************************************************
echo		*    In order to be able to preform some of the operations    *
echo		*    You must provide a Domain-controller authentication      *
echo		***************************************************************
echo[
				
echo 	1  - Seamus-admin
echo 	2  - Ricardo-admin
echo 	3  - ttadmin (Raphael)
echo 	.  - Exit
echo[

set /p superuser=Select your Domain-controller user: 
if %superuser%==1 runas /user:Admin-seamcg@top.ie "%root%RHDMain.bat Seamus" 
if %superuser%==2 runas /user:Admin-riccal@top.ie "%root%RHDMain.bat Ricardo" 
if %superuser%==3 runas /user:ttadmin@top.ie "%root%RHDMain.bat Raphael"
if %superuser%==4 runas /user:topadmin@top.ie "%root%RHDMain.bat topadmin"
if %superuser%==. exit

exit
