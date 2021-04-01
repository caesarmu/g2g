# geo2geo4win
* Convert chemical geometries to other formats on Windows.

## 1 Requirements
* Windows version `busybox64.exe`(<http://frippery.org/busybox/>).
* Put `busybox64.exe` and these files in the same directory and add the directory to `PATH` of Windows.

### 1.2 Additional for pw2xsf
* Put `ibrav2cell.exe`, `libgfortran-4.dll`, `msmpi.dll`，`libwinpthread-1.dll` and `libquadmath-0.dll` (from **Quantum VITAS** <https://www.quantumvitas.org/>) in the same directory.

## 2 Usage
### 2.1 Pwscf input/output to xsf format
* `busybox64.exe pw2xsf pwscf.pw/pwscf.out out.xsf`, then you will get `out.xsf` from input/output file of Pwscf in the case `ibrav=0` and `ibrav>0`.
* OR you can use [openbabel](https://github.com/openbabel/openbabel) to covert it (like `obabel.exe -ipwscf  pwscf.in -ocif -Oout.cif`) only in the case `ibrav=0`. 

### 2.2 POSCAR to pwxsf input 
* `busybox64.exe v2pw POSCAR out.pw`, then you will get the structure in pwscf input format.

### 2.3 Gaussian gjf to xyz format 
* `gjf2xyz  g09.gjf`, then you will get `g09.xyz`.

### 2.4 Add current directory to `PATH`
* Double click `add_pwd.vbs`.
