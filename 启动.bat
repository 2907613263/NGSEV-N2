%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@ECHO OFF&PUSHD %~DP0 &TITLE NGP2F
SETLOCAL EnableDelayedExpansion 
mode con cols=46 lines=32
setlocal enabledelayedexpansion
color 9B
set "configDir=config"  
set "ipFilePath=%configDir%\ip.txt"   
set "python=%configDir%\python-3.12.2-amd64.exe"
if not exist "%configDir%" mkdir "%configDir%"  
if not exist "%ipFilePath%" type nul > "%ipFilePath%"  
set "ip="  
if exist "%ipFilePath%" (  
    for /f "delims=" %%a in ('type "%ipFilePath%"') do set "ip=%%a"  
)   
if "!ip!"=="" (  
    echo ������IP��ַ:  
    echo �벻Ҫ�����������ip��ͬ���κ�ip
    set /p "ip=������IP��ַ(����: 192.168.2.1): "  
    echo !ip! > "%ipFilePath%" 
)  
title ���������IP:!ip!

color 9B
set "inviteListUrl=http://110.42.178.244:8888/down/Ygszx1myrod5.txt"  
set "loce=%~sdp0"
set "a_input="
set "scriptPath=%~dp0"    
set "scriptPath=!scriptPath:~0,-1!"  
set "newconfig=%loce%\config\1"
set "updateUrl=http://110.42.178.244:8888/down/oQHUdMZeaW7e.exe"
set "dateUrl=C:\windows\system32\wget.exe"
:menu
cls  
echo.  
echo    	���ߣ���ҽ-�Ϲ�    
echo 	��ϵQQ��2907613263  
echo ==============================================
echo ��ѡ��һ��ѡ�  
echo 1. ��װNPCNG���������л��� 
echo 2. ��ѽڵ�����
echo 3. ���¿ͻ��˺ͱ���
echo 4. ����м̷������ӳ�  
echo 5. HELP����ָ��  
echo 6. ��װ��������
echo 7. ������������
echo 8. ���ڳ���
echo 9. �û�Э��
echo 10.�޸����������IP
echo -ʹ��ǰ����ϸ�Ķ�HELP����ָ���е�����-
echo !!ʹ��ǰ�뿴�û�Э�飬ʹ����Ĭ��ͬ��Э������!!
echo ==============================================
echo.  
echo ���õ����������: !ip!
  
set /p user_input="��������ţ�"  
if "%user_input%"=="1" (  
    cd "%loce%"
    start "" "%python%"
    echo �س�������һ�������ܻ���ֶ�ΰ�װ����py���п�����⣬���γ��ԣ�
    pause
    start "" "great.py"
) else if "%user_input%"=="2" (  
    echo ��ʼ������ز���...  
    cd "%loce%"
    cmd /k call edge -a !ip! -c Nangua -A1 -l ng.tidc.asia:9090
    goto menu
) else if "%user_input%"=="3" (  
    echo ���������....~
    cd /d "%scriptPath%" 
    start "" cmd /k call great.bat
) else if "%user_input%"=="4" (  
    echo ��ʼPING�м̷������ӳ�......  
    start "" ping /n 10 ng.tdc.asia:9090 >nul  
) else if "%user_input%"=="5" (
cls
echo ��ѡ��һ��ѡ�
echo ==============================================
echo �����һ��ʹ�ã���ע�����������������ͬһ��
echo �ڵ���ʹ�÷����޷����ʡ�Ŀǰ��δ֧������ڲ鿴
echo ���ѵ�����IP����Ҫ�ֶ�����ip������Ϸ��
echo �������ʱ�޷�����ʹ�ã�����û���������HMM
echo ==============================================
echo �һ����Ĵ��������������ģ���Ϊ�ṩ�Ʒ�������
echo Ե��,Ϊ�ṩ���õķ��񣬷��������п��ٱ���ͨ����
echo �պ���ܻ���ȡһ��������Ϊ�������Ĳ�����
echo ==============================================
echo ������й����£����������к�
echo ǰ�汾������C:\Program Files\nps\old
) else if "%user_input%"=="6" (  
    echo ��װ��������  
    cd "%loce%"
    start "" "tap-windows-9.24.2-I601-Win10.exe"
) else if "%user_input%"=="7" ( 
        echo ���ڼ�����Ч��... 
        echo ���س���...
        cd "%loce%"
        cmd /k call verify.py
) else if "%user_input%"=="8" (  
cls
echo ==============================================
echo "  _   _                                    ";
echo " | \ | |  __ _  _ __    __ _  _   _   __ _ ";
echo " |  \| | / _` || '_ \  / _` || | | | / _` |";
echo " | |\  || (_| || | | || (_| || |_| || (_| |";
echo " |_| \_| \__,_||_| |_| \__, | \__,_| \__,_|";
echo "                       |___/               ";
echo ==============================================
echo �ó�������Ϊ��ҽ_�Ϲϣ�������������
echo ϵ����QQ:2907613263,������ζ������
echo עԭ������Ϣ,�����������������볢
echo ���ֶ����и�Ŀ¼�е�great.bat��������
echo �ļ��޸����������°�װ��
echo ==============================================
echo "  _   _   ____  ____  ____   _____        ";
echo " | \ | | / ___||  _ \|___ \ |  ___|       ";
echo " |  \| || |  _ | |_) | __) || |_          ";
echo " | |\  || |_| ||  __/ / __/ |  _|         ";
echo " |_| \_| \____||_|   |_____||_|           ";
echo "                                          ";
echo ==============================================
)else if "%user_input%"=="9" (
    start "" "%loce%\�û�Э��.pdf"
    echo ��ִ�д��û�Э��PDF�ļ�ָ��
)else if "%user_input%"=="10" (  
    if not exist "%configDir%" mkdir "%configDir%"  
    if not exist "%ipFilePath%" type nul > "%ipFilePath%"  
    :updateIP  
    set /p "newIP=�������µ�IP��ַ: "  
    echo !newIP! > "%ipFilePath%"  
    echo IP��ַ�Ѹ���Ϊ: !newIP!  
)  

pause
goto menu
endlocal  

