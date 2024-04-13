import subprocess  
import sys  
import os  
  
def check_pip_installed():  
    try:  
        import pip  
        return True  
    except ImportError:  
        return False  
  
def install_pip():  
    python_exe = sys.executable  
    get_pip_url = "https://bootstrap.pypa.io/get-pip.py"  
    install_command = [python_exe, get_pip_url, '--user']  
    subprocess.check_call(install_command)  
  
def check_and_install_package(package_name):  
    try:  
        output = subprocess.check_output([sys.executable, "-m", "pip", "show", package_name], stderr=subprocess.STDOUT)  
        print(f"{package_name} 已安装。")  
    except subprocess.CalledProcessError:  
        print(f"{package_name} 未安装。现在开始安装...")  
        subprocess.check_call([sys.executable, "-m", "pip", "install", package_name])  
  
# 主程序  
if __name__ == "__main__":  
    if not check_pip_installed():  
        print("pip 未安装。现在开始安装pip...")  
        install_pip()  
  
    check_and_install_package("requests")  
    check_and_install_package("cryptography")  
    check_and_install_package("pyOpenSSL") 
    check_and_install_package("pycryptodome")
    check_and_install_package("BeautifulSoup4")

print("所有必需的包已安装完成。")