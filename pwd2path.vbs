cwd = createobject("Scripting.FileSystemObject").GetFolder(".").Path
Set WS=WScript.CreateObject("WScript.Shell")
OldPath=WS.Environment("User")("PATH")
NewPath = OldPath & ";" & cwd
WS.Environment("User")("PATH") = NewPath
WScript.Quit
