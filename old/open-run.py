import os  
import subprocess  
def get_script_directory():  
    return os.path.dirname(os.path.abspath(__file__))  
def start_n2n_edge():    
    script_dir = get_script_directory()    
    edge_path = os.path.join(script_dir, "edge")    
    args = [  
        edge_path,  
        "-a", "DHCP",  
        "-c", "Nangua",  
        "-k", "V34oswnpfNZlIXhy",  
        "-l", "ng.tidc.asia:9000",  
        "-r",  
        "-v",  
        "-f"  
    ]  
    try:  
        subprocess.run(args, check=True)  
    except subprocess.CalledProcessError as e:  
        print(f"N2N Edge 启动失败: {e}")  
start_n2n_edge()
