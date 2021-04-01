# geo2geo4win (g2g4w)
* Convert chemical geometries to other formats on Windows.

## 1 Requirements
* Install [openbabel](https://github.com/openbabel/openbabel).
* Put `busybox64.exe`(from <http://frippery.org/busybox/>) into subdirectory `ash`.
* Put `ibrav2cell.exe`, `libgfortran-4.dll`, `msmpi.dll`，`libwinpthread-1.dll` and `libquadmath-0.dll` (from **Quantum VITAS** <https://www.quantumvitas.org/>) into subdirectory `ash`.
* Double click `add_pwd.vbs` to add current directory to `PATH` of Windows.

## 2 Usage
* `g2g4w a.in/a.pw/a.out [b.xsf]`: Convert pwscf input/output to xsf format, it support `ibrav=0` and `ibrav>0`, while [openbabel](https://github.com/openbabel/openbabel) does not support  `ibrav>0` or **xsf** output. 
* `g2g4w POSCAR/CONTCAR/a.vasp [b.pw]`: Convert geometry in vasp format to pwscf input format. 
* `g2g4w a.cif [b.pw]`: Convert geometry in cif format to pwscf input format.
* `g2g4w a.xsf [b.pw]`: Convert geometry in xsf format to pwscf input format.
* `g2g4w a.pdb [b.pw]`: Convert geometry in pdb format to pwscf input format.
* `g2g4w a.gif [a.xyz]`: Convert geometry in gaussian gjf format to xyz format.

