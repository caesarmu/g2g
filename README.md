# Chemical format converter based on Openbabel for Windows (g2g4w)

## 1 Why to creat this project 
* [openbabel](https://github.com/openbabel/openbabel) does not support `ibrav>0` for converting **pwscf** format. 
* [openbabel](https://github.com/openbabel/openbabel) does not support output in **pwscf** format, which is needed by [QuantumVITAS](https://www.quantumvitas.org/ "QuantumVITAS"), a Windows GUI for [Quantum Espresso](https://www.quantum-espresso.org/ "Quantum Espresso"). 
* [openbabel](https://github.com/openbabel/openbabel) does not support output in **xsf** format. 

## 2 Requirements
* Install [openbabel](https://github.com/openbabel/openbabel).
* Double click `add_pwd.vbs` to add current directory to `PATH` of Windows.

## 3 Usage
* `g2g4w a.in/a.pw/a.out [b.xsf]`: Convert pwscf input/output to xsf format, it support `ibrav=0` and `ibrav>0`.
* `g2g4w POSCAR/CONTCAR/a.vasp [b.pw]`: Convert geometry in vasp format to pwscf input format. 
* `g2g4w a.cif [b.pw]`: Convert geometry in cif format to pwscf input format.
* `g2g4w a.xsf [b.pw]`: Convert geometry in xsf format to pwscf input format.
* `g2g4w a.pdb [b.pw]`: Convert geometry in xsf format to pwscf input format.
* `g2g4w a.gif [a.xyz]`: Convert geometry in gaussian gjf format to xyz format.
* `g2g4w xxx.yyy a.pw`: Convert geometry to pwscf input format.
* * `g2g4w xxx.yyy a.xsf`: Convert geometry to xsf format.
* `g2g4w aaa.yyy bbb.zzz`: Convert geometry with openbabel.

