Set objShell = CreateObject("WScript.Shell")  
Set fso = CreateObject("Scripting.FileSystemObject")  
  
strScriptFullPath = WScript.ScriptFullName  
strScriptDirectory = fso.GetParentFolderName(strScriptFullPath)  
strRunDirectory = fso.BuildPath(strScriptDirectory, "RUN")  
strConfigDirectory = fso.BuildPath(strRunDirectory, "config\1")  
  
' 检查是否有文件被拖拽到脚本上  
If WScript.Arguments.Count > 0 Then  
    ' 获取拖拽的第一个文件路径  
    strDraggedFilePath = WScript.Arguments(0)  
      
    ' 构建目标文件路径  
    strTargetFilePath = fso.BuildPath(strConfigDirectory, fso.GetFileName(strDraggedFilePath))  
      
    ' 如果目标文件夹不存在，则创建它  
    If Not fso.FolderExists(strConfigDirectory) Then  
        fso.CreateFolder(strConfigDirectory)  
    End If  
      
    ' 如果源文件存在，则复制文件  
    If fso.FileExists(strDraggedFilePath) Then  
        fso.CopyFile strDraggedFilePath, strTargetFilePath, True  
        WScript.Echo "文件已成功复制到：" & strTargetFilePath  
    Else  
        WScript.Echo "拖拽的源文件不存在：" & strDraggedFilePath  
    End If  
Else  
    ' 如果没有文件被拖拽，则运行批处理文件  
    strBatchFileName = "启动.bat"  
    strBatchPath = fso.BuildPath(strRunDirectory, strBatchFileName)  
      
    ' 如果批处理文件存在，则运行它  
    If fso.FileExists(strBatchPath) Then  
        objShell.Run strBatchPath, 1, False ' 运行批处理文件  
        WScript.Echo "批处理文件已成功运行：" & strBatchPath  
    Else  
        WScript.Echo "批处理文件不存在：" & strBatchPath  
    End If  
End If