%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@ECHO OFF&PUSHD %~DP0 &TITLE NGP2F����
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
    echo Ŀ��Ŀ¼�����ڡ�  
    goto :eof  
)  
net session >nul 2>&1  
if %errorLevel% neq 0 (  
    echo ���Թ���ԱȨ�����д˽ű���  
    pause  
    exit /b  
)   
if not exist "%oldPath%" (  
    mkdir "%oldPath%"  
)  
xcopy /E /I "%loce%" "%oldPath%"   
if %errorlevel% neq 0 (  
    cls 
    echo ����ʧ�ܡ�  
    echo %oldPath%
    timeout /t 3
    goto :eof  
)  
echo �ѳɹ����ݵ� %oldPath%    
if not exist "%downloadedFilePath%" (  
    echo �޷��������°汾��Ϣ�ļ���  
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
echo [��⵽�°汾]��%remoteVersion%                        ;
echo [��ǰ�汾]��%localVersion%                            ;
echo                                              ;
echo ==============================================
echo "  _   _   ____  ____  ____   _____         ";
echo " | \ | | / ___||  _ \|___ \ |  ___|        ";
echo " |  \| || |  _ | |_) | __) || |_           ";
echo " | |\  || |_| ||  __/ / __/ |  _|          ";
echo " |_| \_| \____||_|   |_____||_|            ";
echo ==============================================
)else  

    echo �Ƿ�Ҫ���ز���װ�°汾��  
    echo 1. ��  yes
    echo 2. ��  no
    echo.  
    set /p choice="������ѡ�1/2��: "  
    if "!choice!"=="1" (   
        echo ���������°汾...   
        powershell curl -o "%newZipFile%" "%newFileUrl%"
        if not exist "%newZipFile%" (  
            echo �°汾�ļ�����ʧ�ܡ�  
            pause  
            goto :eof  
        )  
        echo �°汾�����ص���ʱĿ¼�����ڽ�ѹ... 
            echo 7-Zip��װ:�밲װ7-Zip,�������Դ�7zip��װָ������װ��������
            echo �밴ָ����װ��7zip����ִ�и��������װ·��D�̸�Ŀ¼
            powershell curl -o "%newZip%" "%FROzip%"
            start /wait "" "%newZip%" 
            pause  
        echo �°汾�����ص���ʱĿ¼�����ڽ�ѹ...  
        "%sevenZipPath%" x "%newZipFile%" -o"!scriptPath!" -aoa  
        echo �°汾�ѽ�ѹ�����ǵ� %targetDir%  
        echo �ɰ汾�ļ��ѱ��ݵ� %oldPath%  
        pause  
        del "%newZipFile%"  
        del "%newZip%"
    ) else (    
        echo ��ȡ�����غͰ�װ�°汾��  
        pause  
    )  
) else (  
    echo ���Ѿ�ӵ�����µİ汾��  
    timeout /t 3
    pause  
)  
endlocal  
pause