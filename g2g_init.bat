@ECHO OFF
SET g2ghome=%~dp0
SET PATH=%g2ghome%ash;%PATH%
REM SET AVOPATH=D:\Qsync\dosbin\Avogadro\bin
REM IF NOT "%AVOPATH%x" == "x" ( SET PATH=%AVOPATH%;%PATH% )
REM SET ENV=%g2ghome%/profile.box 
busybox.exe sh