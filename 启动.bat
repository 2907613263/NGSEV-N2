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
    echo 请输入IP地址:  
    echo 请不要输入与局域网ip相同网段和ip
    set /p "ip=请输入IP地址(例如: 192.168.2.1): "  
    echo !ip! > "%ipFilePath%" 
)  
title 虚拟局域网IP:!ip!

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
echo    	作者：良医-南瓜    
echo 	联系QQ：2907613263  
echo ==============================================
echo 请选择一个选项：  
echo 1. 安装NPCNG到初级运行环境 
echo 2. 免费节点链接
echo 3. 更新客户端和备份
echo 4. 检测中继服务器延迟  
echo 5. HELP帮助指南  
echo 6. 安装虚拟网卡
echo 7. 用云配置链接
echo 8. 关于程序
echo 9. 用户协议
echo 10.修改虚拟局域网IP
echo -使用前请详细阅读HELP帮助指南中的内容-
echo !!使用前请看用户协议，使用则默认同意协议内容!!
echo ==============================================
echo.  
echo 设置的虚拟局域网: !ip!
  
set /p user_input="请输入序号："  
if "%user_input%"=="1" (  
    cd "%loce%"
    start "" "%python%"
    echo 回车继续下一步（可能会出现多次安装不上py运行库的问题，请多次尝试）
    pause
    start "" "great.py"
) else if "%user_input%"=="2" (  
    echo 开始运行相关操作...  
    cd "%loce%"
    cmd /k call edge -a !ip! -c Nangua -A1 -l ng.tidc.asia:9090
    goto menu
) else if "%user_input%"=="3" (  
    echo 检测程序更新....~
    cd /d "%scriptPath%" 
    start "" cmd /k call great.bat
) else if "%user_input%"=="4" (  
    echo 开始PING中继服务器延迟......  
    start "" ping /n 10 ng.tdc.asia:9090 >nul  
) else if "%user_input%"=="5" (
cls
echo 请选择一个选项：
echo ==============================================
echo 如果第一次使用，请注意你和你的朋友需加入同一个
echo 节点下使用否则无法访问。目前还未支持软件内查看
echo 好友的虚拟IP，需要手动输入ip进入游戏。
echo 如果运行时无法正常使用，可能没有载入或损害HMM
echo ==============================================
echo 我会用心打造这个联机程序的，因为提供云服务器的
echo 缘故,为提供更好的服务，服务器会有快速保障通道。
echo 日后可能会收取一定费用作为服务器的补贴！
echo ==============================================
echo 如果运行过更新，且正常运行后
echo 前版本备份在C:\Program Files\nps\old
) else if "%user_input%"=="6" (  
    echo 安装虚拟网卡  
    cd "%loce%"
    start "" "tap-windows-9.24.2-I601-Win10.exe"
) else if "%user_input%"=="7" ( 
        echo 正在检验有效期... 
        echo 加载程序...
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
echo 该程序作者为良医_南瓜，如果想二创请联
echo 系作者QQ:2907613263,无论如何都必须标
echo 注原作者信息,如果遇到主程序错误，请尝
echo 试手动运行根目录中的great.bat进行最新
echo 文件修复。或者重新安装！
echo ==============================================
echo "  _   _   ____  ____  ____   _____        ";
echo " | \ | | / ___||  _ \|___ \ |  ___|       ";
echo " |  \| || |  _ | |_) | __) || |_          ";
echo " | |\  || |_| ||  __/ / __/ |  _|         ";
echo " |_| \_| \____||_|   |_____||_|           ";
echo "                                          ";
echo ==============================================
)else if "%user_input%"=="9" (
    start "" "%loce%\用户协议.pdf"
    echo 已执行打开用户协议PDF文件指令
)else if "%user_input%"=="10" (  
    if not exist "%configDir%" mkdir "%configDir%"  
    if not exist "%ipFilePath%" type nul > "%ipFilePath%"  
    :updateIP  
    set /p "newIP=请输入新的IP地址: "  
    echo !newIP! > "%ipFilePath%"  
    echo IP地址已更新为: !newIP!  
)  

pause
goto menu
endlocal  

