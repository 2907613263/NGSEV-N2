import os  
import sys  
from datetime import datetime, timezone 
from cryptography import x509  
from cryptography.hazmat.backends import default_backend  
from cryptography.hazmat.primitives import serialization  
from cryptography.hazmat.primitives.hashes import SHA256  
from requests import get  

def extract_cert_info(cert_path):   
    with open(cert_path, 'rb') as cert_file:   
        cert_data = cert_file.read()  
        cert = x509.load_pem_x509_certificate(cert_data, default_backend())    
        issuer = cert.issuer.get_attributes_for_oid(x509.NameOID.COMMON_NAME)[0].value  
        not_after = cert.not_valid_after  
        return issuer, not_after   
def get_issuer_from_url(url):  
    response = get(url)  
    response.raise_for_status()   
    issuer = response.text.strip()  
    return issuer  

def is_cert_valid(not_after):  
    current_time = datetime.utcnow()  
    return current_time < not_after  
  
# 主逻辑  
def main():  
    cert_filename = 'cert.crt'  
    issuer_url = 'https://fk.nanguamc.top/issuer_name.txt'  
    cert_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), cert_filename)  
    cert_issuer, not_after = extract_cert_info(cert_path)  
    print(f"证书颁发者: {cert_issuer}")  
    print(f"证书到期时间: {not_after}")   
    if is_cert_valid(not_after):  
        print("证书有效。")  
    else:  
        print("证书已过期。")  
        sys.exit(1)  # 退出脚本   
    url_issuer = get_issuer_from_url(issuer_url)  
    print(f"从URL获取的颁发者: {url_issuer}")   
    if cert_issuer == url_issuer:  
        print("证书中的颁发者与URL中的颁发者一致。")  
        os.system(f"python decrypt.py {not_after.strftime('%Y-%m-%d %H:%M:%S')}")  
    else:  
        print("颁发者信息不匹配。")  
  
if __name__ == "__main__":  
    main()
