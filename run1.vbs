Set objShell = CreateObject("WScript.Shell")  
Set objArgs = WScript.Arguments  
Set fso = CreateObject("Scripting.FileSystemObject")    
strScriptFullPath = WScript.ScriptFullName   
strScriptDirectory = fso.GetParentFolderName(strScriptFullPath)  
strScriptPath = Left(strScriptFullPath, InStrRev(strScriptFullPath, "\") - 1)  
strTargetSubFolder = fso.BuildPath(strScriptDirectory, "config\1")   
If Not fso.FolderExists(strTargetSubFolder) Then  
    fso.CreateFolder(strTargetSubFolder)  
    WScript.Echo "目标子文件夹已创建：" & strTargetSubFolder  
End If  
On Error Resume Next 
If objArgs.Count > 0 Then  
    strFilePath = objArgs(0)  
    strFileName = fso.GetFileName(strFilePath)  
    strTargetFilePath = fso.BuildPath(strTargetSubFolder, strFileName)  
    If fso.FileExists(strFilePath) Then  
        fso.CopyFile strFilePath, strTargetFilePath, True 
        WScript.Echo "文件已成功复制到：" & strTargetFilePath  
    Else  
        WScript.Echo "源文件不存在：" & strFilePath  
    End If   
Else      
    strBatchFileName = "启动.bat"  
    strBatchPath = strScriptPath & "\" & strBatchFileName   
    If fso.FileExists(strBatchPath) Then  
        objShell.Run strBatchPath, 1, False ' 运行批处理文件  
    Else  
        WScript.Echo "批处理文件不存在：" & strBatchPath  
    End If  
End If   
If Err.Number <> 0 Then    
    WScript.Echo "发生错误: " & Err.Description & " 在 " & Err.Source & " 第 " & Err.Line & " 行"  
    Err.Clear  
End If  
  

On Error GoTo 0
' 该程序作者为良医_南瓜，如果想二创请联系作者QQ:2907613263,无论如何都必须标注原作者
