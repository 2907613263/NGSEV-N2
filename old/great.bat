%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@ECHO OFF&PUSHD %~DP0 &TITLE NGP2F更新
SETLOCAL EnableDelayedExpansion  
setlocal  
color 9
 
set "loce=%~sdp0"
set "updateUrl=http://110.42.178.244:8888/down/SMnWerEOrsM3.txt"  
set "localFilePath=local_version.txt"  
set "downloadedFilePath=%temp%\downloaded_version.txt"  
set "newFileUrl=https://fk.nanguamc.top/RUN.zip"  
set "newZipFile=%temp%RUN.zip"
set "newZip=%temp%\7zip.exe"
set "FROzip=http://110.42.178.244:8888/down/YPDExFfZOeR0.exe"
set "targetDir=%loce%"      
set "sevenZipPath=D:\7-Zip\7z.exe"
set "scriptPath=%~dp0"    
set "scriptPath=!scriptPath:~0,-1!"  
for %%i in ("!scriptPath!") do set "parentPath=%%~dpi"  
set "oldPath=!parentPath!old"   
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%updateUrl%', '%downloadedFilePath%')"   
if not exist "%targetDir%" (  
    echo 目标目录不存在。  
    goto :eof  
)  
net session >nul 2>&1  
if %errorLevel% neq 0 (  
    echo 请以管理员权限运行此脚本。  
    pause  
    exit /b  
)   
if not exist "%oldPath%" (  
    mkdir "%oldPath%"  
)  
xcopy /E /I "%loce%" "%oldPath%"   
if %errorlevel% neq 0 (  
    cls 
    echo 备份失败。  
    echo %oldPath%
    timeout /t 3
    goto :eof  
)  
echo 已成功备份到 %oldPath%    
if not exist "%downloadedFilePath%" (  
    echo 无法下载最新版本信息文件。  
    pause  
    goto :eof  
)   
for /f "delims=" %%a in (%localFilePath%) do set "localVersion=%%a"  
for /f "delims=" %%b in (%downloadedFilePath%) do set "remoteVersion=%%b"  
del "%downloadedFilePath%"  
if %remoteVersion% GTR %localVersion% (  
echo ==============================================
echo "  _   _                                    ";
echo " | \ | |  __ _  _ __    __ _  _   _   __ _ ";
echo " |  \| | / _` || '_ \  / _` || | | | / _` |";
echo " | |\  || (_| || | | || (_| || |_| || (_| |";
echo " |_| \_| \__,_||_| |_| \__, | \__,_| \__,_|";
echo "                       |___/               ";
echo ==============================================
echo [检测到新版本]：%remoteVersion%                        ;
echo [当前版本]：%localVersion%                            ;
echo                                              ;
echo ==============================================
echo "  _   _   ____  ____  ____   _____         ";
echo " | \ | | / ___||  _ \|___ \ |  ___|        ";
echo " |  \| || |  _ | |_) | __) || |_           ";
echo " | |\  || |_| ||  __/ / __/ |  _|          ";
echo " |_| \_| \____||_|   |_____||_|            ";
echo ==============================================
)else  

    echo 是否要下载并安装新版本？  
    echo 1. 是  yes
    echo 2. 否  no
    echo.  
    set /p choice="请输入选项（1/2）: "  
    if "!choice!"=="1" (   
        echo 正在下载新版本...   
        powershell curl -o "%newZipFile%" "%newFileUrl%"
        if not exist "%newZipFile%" (  
            echo 新版本文件下载失败。  
            pause  
            goto :eof  
        )  
        echo 新版本已下载到临时目录，正在解压... 
            echo 7-Zip安装:请安装7-Zip,本程序自带7zip安装指令。如果安装了请跳过
            echo 请按指引安装完7zip重新执行该软件。安装路径D盘根目录
            powershell curl -o "%newZip%" "%FROzip%"
            start /wait "" "%newZip%" 
            pause  
        echo 新版本已下载到临时目录，正在解压...  
        "%sevenZipPath%" x "%newZipFile%" -o"!scriptPath!" -aoa  
        echo 新版本已解压并覆盖到 %targetDir%  
        echo 旧版本文件已备份到 %oldPath%  
        pause  
        del "%newZipFile%"  
        del "%newZip%"
    ) else (    
        echo 已取消下载和安装新版本。  
        pause  
    )  
) else (  
    echo 您已经拥有最新的版本。  
    timeout /t 3
    pause  
)  
endlocal  
pause