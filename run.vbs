Set objShell = CreateObject("WScript.Shell")  
Set fso = CreateObject("Scripting.FileSystemObject")  
  
strScriptFullPath = WScript.ScriptFullName  
strScriptDirectory = fso.GetParentFolderName(strScriptFullPath)  
strRunDirectory = fso.BuildPath(strScriptDirectory, "RUN")  
strConfigDirectory = fso.BuildPath(strRunDirectory, "config\1")  
  
' ����Ƿ����ļ�����ק���ű���  
If WScript.Arguments.Count > 0 Then  
    ' ��ȡ��ק�ĵ�һ���ļ�·��  
    strDraggedFilePath = WScript.Arguments(0)  
      
    ' ����Ŀ���ļ�·��  
    strTargetFilePath = fso.BuildPath(strConfigDirectory, fso.GetFileName(strDraggedFilePath))  
      
    ' ���Ŀ���ļ��в����ڣ��򴴽���  
    If Not fso.FolderExists(strConfigDirectory) Then  
        fso.CreateFolder(strConfigDirectory)  
    End If  
      
    ' ���Դ�ļ����ڣ������ļ�  
    If fso.FileExists(strDraggedFilePath) Then  
        fso.CopyFile strDraggedFilePath, strTargetFilePath, True  
        WScript.Echo "�ļ��ѳɹ����Ƶ���" & strTargetFilePath  
    Else  
        WScript.Echo "��ק��Դ�ļ������ڣ�" & strDraggedFilePath  
    End If  
Else  
    ' ���û���ļ�����ק���������������ļ�  
    strBatchFileName = "����.bat"  
    strBatchPath = fso.BuildPath(strRunDirectory, strBatchFileName)  
      
    ' ����������ļ����ڣ���������  
    If fso.FileExists(strBatchPath) Then  
        objShell.Run strBatchPath, 1, False ' �����������ļ�  
        WScript.Echo "�������ļ��ѳɹ����У�" & strBatchPath  
    Else  
        WScript.Echo "�������ļ������ڣ�" & strBatchPath  
    End If  
End If