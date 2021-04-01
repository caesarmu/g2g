@ECHO OFF
SET BinHome=%~dp0
SET PATH=%PATH%;%BinHome%;%BinHome%ash

SET ingeo=%1
SET ingeoext=%~x1
SET ingeobase=%~n1
SET outgeo=%2
SET outgeoext=%~x2
SET outgeobase=%~n2

IF "%ingeo%%outgeoext%" == ".gjf.xyz" (busybox64.exe sh -c "cd %cd:\=/%; gjf2xyz %ingeo% %outgeo%"  && goto END )
IF "%ingeo%%outgeo%" == ".gjf" (busybox64.exe sh -c "cd %cd:\=/%; gjf2xyz %ingeo% %ingeobase%.xyz"  && goto END )
IF "%ingeoext%%outgeoext%" == ".vasp.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%%outgeo%" == ".vasp" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% %ingeobase%.pw"  && goto END )
IF "%ingeo%%outgeoext%" == "POSCAR.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% %outgeo%"  && goto END )
IF "%ingeo%%outgeo%" == "POSCAR" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% vasp2qe.pw"  && goto END )
IF "%ingeo%%outgeoext%" == "CONTCAR.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% %outgeo%"  && goto END )
IF "%ingeo%%outgeo%" == "CONTCAR" (busybox64.exe sh -c "cd %cd:\=/%; v2pw %ingeo% vasp2qe.pw"  && goto END )
IF "%ingeoext%%outgeoext%" == ".out.xsf" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%%outgeo%" == ".out" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%%outgeoext%" == ".pw.xsf" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%%outgeo%" == ".pw" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%%outgeoext%" == ".in.xsf" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%%outgeo%" == ".in" (busybox64.exe sh -c "cd %cd:\=/%; pw2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%%outgeoext%" == ".cif.pw" (obabel.exe %ingeo% -Og2g4wtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2pw g2g4wtmp.vasp %outgeo%" && goto END )
IF "%ingeoext%%outgeo%" == ".cif" (obabel.exe %ingeo% -Og2g4wtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2pw g2g4wtmp.vasp %ingeobase%.pw" && goto END )
IF "%ingeoext%%outgeoext%" == ".xsf.pw" (obabel.exe %ingeo% -Og2g4wtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2pw g2g4wtmp.vasp %outgeo%" && goto END )
IF "%ingeoext%%outgeo%" == ".xsf" (obabel.exe %ingeo% -Og2g4wtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2pw g2g4wtmp.vasp %ingeobase%.pw" && goto END )

:END
DEL /Q g2g4wtmp.*
REM EXIT 


