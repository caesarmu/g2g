@ECHO OFF
SET BinHome=%~dp0
SET PATH=%PATH%;%BinHome%;%BinHome%ash

SET ingeo=%1
SET ingeoext=%~x1
SET ingeobase=%~n1
SET outgeo=%2
SET outgeoext=%~x2
SET outgeobase=%~n2
SET taskpara=%3
SET otherpara=%4 %5 %6

IF "%ingeo%0%outgeoext%" == ".gjf0.xyz" (busybox64.exe sh -c "cd %cd:\=/%; gjf2xyz %ingeo% %outgeo%"  && goto END )
IF "%ingeo%0%outgeo%" == ".gjf0" (busybox64.exe sh -c "cd %cd:\=/%; gjf2xyz %ingeo% %ingeobase%.xyz"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".vasp0.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2qe %ingeo% %outgeo%"  && goto END )
IF "%ingeo%0%outgeoext%" == "POSCAR0.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2qe %ingeo% %outgeo%"  && goto END )
IF "%ingeo%0%outgeoext%" == "CONTCAR0.pw" (busybox64.exe sh -c "cd %cd:\=/%; v2qe %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%0%outgeo%" == ".vasp0" (busybox64.exe sh -c "cd %cd:\=/%; v2qe %ingeo% %ingeobase%.pw"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".out0.xsf" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".out0.cif" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% g2gtmp.xsf 2>/dev/null && obabel.exe g2gtmp.xsf -O%outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".out0.pw" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% g2gtmp.xsf && obabel.exe g2gtmp.xsf -ovasp -Og2gtmp.vasp && v2qe g2gtmp.vasp %outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".out0.vasp" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% g2gtmp.xsf && obabel.exe g2gtmp.xsf -ovasp %outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".out0.xyz" (busybox64.exe sh -c "cd %cd:\=/%; qe2xyz %ingeo% %outgeo% %taskpara%"  && goto END )
IF "%ingeoext%0%outgeo%" == ".out0" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%0%outgeoext%" == ".pw0.xsf" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".pw0.cif" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% g2gtmp.xsf && obabel.exe g2gtmp.xsf -O%outgeo%"  && goto END )
IF "%ingeoext%0%outgeo%" == ".pw0" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%0%outgeoext%" == ".in0.xsf" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %outgeo%"  && goto END )
IF "%ingeoext%0%outgeoext%" == ".in0.cif" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% g2gtmp.xsf && obabel.exe g2gtmp.xsf -O%outgeo%"  && goto END )
IF "%ingeoext%0%outgeo%" == ".in0" (busybox64.exe sh -c "cd %cd:\=/%; qe2xsf %ingeo% %ingeobase%.xsf" && goto END )
IF "%ingeoext%0%outgeoext%" == ".cif0.pw" (obabel.exe %ingeo% -Og2gtmp.vasp  --fillUC strict && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %outgeo%" && goto END )
IF "%ingeoext%0%outgeo%" == ".cif0" (obabel.exe %ingeo% -Og2gtmp.vasp  --fillUC strict && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %ingeobase%.pw" && goto END )
IF "%ingeoext%0%outgeoext%" == ".xsf0.pw" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %outgeo%" && goto END )
IF "%ingeoext%0%outgeo%" == ".xsf0" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %ingeobase%.pw" && goto END )
IF "%ingeoext%0%outgeoext%" == ".pdb0.pw" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %outgeo%" && goto END )
IF "%ingeoext%0%outgeo%" == ".pdb0" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %ingeobase%.pw" && goto END )
IF "%ingeoext%0%outgeoext%" == ".axsf0.xsf" (busybox64.exe sh -c "cd %cd:\=/%; vib2xsf %ingeo% %taskpara% %otherpara% && mv qe2vib%taskpara%x*.xsf %outgeo%" && goto END )
IF "%outgeoext%" == ".pw" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp %outgeo%" && goto END )
IF "%outgeoext%" == ".xsf" (obabel.exe %ingeo% -Og2gtmp.vasp && busybox64.exe sh -c "cd %cd:\=/%; v2qe g2gtmp.vasp g2gtmp.pw && qe2xsf g2gtmp.pw %outgeo%" && goto END )
IF "%outgeo%" == "POSCAR" (obabel.exe %ingeo% -ovasp -O%outgeo% && goto END )
IF "%outgeo%" == "CONTCAR" (obabel.exe %ingeo% -ovasp -O%outgeo% && goto END )
IF "%outgeo%" == ".vasp" (obabel.exe %ingeo% -ovasp -O%outgeo% && goto END )
IF NOT "x%outgeo%" == "x" (obabel.exe %ingeo% -O%outgeo% )

:END
DEL /Q g2gtmp.* qe2vib*x*.xsf 2>nul
REM EXIT 


