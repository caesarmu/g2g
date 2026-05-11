Option Explicit

Dim objShell, objFSO, currentDirectory, dataPath,OldPath,NewPath 

' 创建Shell和FileSystemObject对象
Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 获取当前目录
currentDirectory = objFSO.GetAbsolutePathName(".")

OldPath=objShell.Environment("User")("PATH")
NewPath = OldPath & ";" & currentDirectory
objShell.Environment("User")("PATH") = NewPath

' 检查当前目录是否包含"avogadro"
If InStr(1, currentDirectory, "avogadro", vbTextCompare) > 0 Or InStr(1, currentDirectory, "quantumVITAS", vbTextCompare) > 0  Or InStr(1, currentDirectory, "g2g", vbTextCompare) > 0 Then
    ' 构建data文件夹路径
    dataPath = objFSO.BuildPath(currentDirectory, "data")
    
    ' 检查data文件夹是否存在
    If objFSO.FolderExists(dataPath) Then
        ' 设置环境变量
        objShell.Environment("USER")("BABEL_DATA") = dataPath
        WScript.Echo "环境变量 BABEL_DATA 已设置为: " & dataPath
    Else
        WScript.Echo "错误: data文件夹不存在于当前目录下"  
    End If
Else
    WScript.Echo "当前目录不包含avogadro字符串"   
End If

' 清理对象
Set objFSO = Nothing
Set objShell = Nothing
