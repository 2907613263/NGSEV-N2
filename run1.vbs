Set objShell = CreateObject("WScript.Shell")  
Set objArgs = WScript.Arguments  
Set fso = CreateObject("Scripting.FileSystemObject")    
strScriptFullPath = WScript.ScriptFullName   
strScriptDirectory = fso.GetParentFolderName(strScriptFullPath)  
strScriptPath = Left(strScriptFullPath, InStrRev(strScriptFullPath, "\") - 1)  
strTargetSubFolder = fso.BuildPath(strScriptDirectory, "config\1")   
If Not fso.FolderExists(strTargetSubFolder) Then  
    fso.CreateFolder(strTargetSubFolder)  
    WScript.Echo "Ŀ�����ļ����Ѵ�����" & strTargetSubFolder  
End If  
On Error Resume Next 
If objArgs.Count > 0 Then  
    strFilePath = objArgs(0)  
    strFileName = fso.GetFileName(strFilePath)  
    strTargetFilePath = fso.BuildPath(strTargetSubFolder, strFileName)  
    If fso.FileExists(strFilePath) Then  
        fso.CopyFile strFilePath, strTargetFilePath, True 
        WScript.Echo "�ļ��ѳɹ����Ƶ���" & strTargetFilePath  
    Else  
        WScript.Echo "Դ�ļ������ڣ�" & strFilePath  
    End If   
Else      
    strBatchFileName = "����.bat"  
    strBatchPath = strScriptPath & "\" & strBatchFileName   
    If fso.FileExists(strBatchPath) Then  
        objShell.Run strBatchPath, 1, False ' �����������ļ�  
    Else  
        WScript.Echo "�������ļ������ڣ�" & strBatchPath  
    End If  
End If   
If Err.Number <> 0 Then    
    WScript.Echo "��������: " & Err.Description & " �� " & Err.Source & " �� " & Err.Line & " ��"  
    Err.Clear  
End If  
  

On Error GoTo 0
' �ó�������Ϊ��ҽ_�Ϲϣ�������������ϵ����QQ:2907613263,������ζ������עԭ����
