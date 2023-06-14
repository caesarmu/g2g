@ECHO OFF
SET BinHome=%~dp0

@echo off 
   SET adddos=REG ADD HKCR\Directory\Background\shell\ASHCMD\command\ /ve /t REG_SZ /d ""%BinHome%g2g_init.bat"" /f
   CALL :RunAsAdmin "/c %adddos%"
GOTO EOF

:RunAsAdmin
  SET runascmd=%1
  mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe",%runascmd%,"","runas",1)(window.close)
GOTO Return

:EOF
  EXIT

:Return
