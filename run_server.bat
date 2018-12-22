@echo off

title Toontown Infinite Game Launcher

echo Choose your connection method!
echo.
echo #1 - Localhost
echo #2 - Dev Server
echo #3 - Custom
echo #4 - Local RemoteDB
echo #5 - Prod Server
echo.

:selection

set INPUT=-1
set /P INPUT=Selection: 

if %INPUT%==1 (
    set TTI_GAMESERVER=127.0.0.1
) else if %INPUT%==2 (
    set TTI_GAMESERVER=167.114.220.172
) else if %INPUT%==4 (
    set TTI_GAMESERVER=127.0.0.1
) else if %INPUT%==5 (
    SET TTI_GAMESERVER=lw2.ez-webz.com:7198
) else if %INPUT%==3 (
    echo.
    set /P TTI_GAMESERVER=Gameserver: 
) else (
	goto selection
)

echo.

if %INPUT%==2 (
    set /P ttiUsername="Username: "
    set /P ttiPassword="Password: "
) else if %INPUT%==4 (
    set /P ttiUsername="Username: "
    set /P ttiPassword="Password: "
) else (
    set /P TTI_PLAYCOOKIE=Username: 
)

echo.

echo ===============================
echo Starting Toontown Infinite...
echo ppython: "C:\Panda3D-1.10.0\python\ppython.exe"

if %INPUT%==2 (
    echo Username: %ttiUsername%
) else if %INPUT%==4 (
    echo Username: %ttiUsername%
) else (
    echo Username: %TTI_PLAYCOOKIE%
)

echo Gameserver: %TTI_GAMESERVER%
echo ===============================

cd ../../

:main
if %INPUT%==2 (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartRemoteDB
) else if %INPUT%==4 (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartRemoteDB
) else (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStart
)
pause

goto main
