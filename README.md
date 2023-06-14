# Chemical format converter based on Openbabel for Windows (g2g)

## 1 Why to creat this project 
* [openbabel](https://github.com/openbabel/openbabel) does not support `ibrav>0` for converting **pwscf** format. 
* [openbabel](https://github.com/openbabel/openbabel) does not support output in **pwscf** format, which is needed by [QuantumVITAS](https://www.quantumvitas.org/ "QuantumVITAS"), a Windows GUI for [Quantum Espresso](https://www.quantum-espresso.org/ "Quantum Espresso"). The content of ouputfile *.pw will be sent to clipboard on Windows 7/10, to be used in [QuantumVITAS](https://www.quantumvitas.org/ "QuantumVITAS").  
* [openbabel](https://github.com/openbabel/openbabel) does not support output in **xsf** format. 

## 2 Installation
* Requirements: Install [Openbabel](https://github.com/openbabel/openbabel) or [Avogadro](https://github.com/OpenChemistry/avogadrolibs), and make sure their `bin` directory are in the `PATH` of your system. If not, copy `pwd2path.vbs` to the `bin` directory and double click it.
* Double click `g2g_reg.bat` to initialize the environment variables.
* In your work directory, right click the background of the directory, select `ASHCMD`, then run g2g commands. 

## 3 Usage
### 3.1 Quantum Espresso Related 
* `g2g a.in/a.pw/a.out [b.xsf]`: Convert pwscf input/output to xsf format, it support `ibrav=0` and `ibrav>0`.
* `g2g a.in/a.pw/a.out b.cif`: Convert pwscf input/output to cif format, it support `ibrav=0` and `ibrav>0`.
* `g2g a.out b.pw`: Convert pwscf output to input format.
* `g2g a.out b.vasp`: Convert pwscf output to vasp format.
* `g2g a.out trace.xyz 5`:Convert pwscf output to trace file in xyz format, 5 is sample period.
* `g2g POSCAR/CONTCAR/a.vasp [b.pw]`: Convert geometry in vasp format to pwscf input format. 
* `g2g a.cif [b.pw]`: Convert geometry in cif format to pwscf input format.
* `g2g a.xsf [b.pw]`: Convert geometry in xsf format to pwscf input format.
* `g2g a.pdb [b.pw]`: Convert geometry in xsf format to pwscf input format.
* `g2g xxx.yyy a.pw`: Convert geometry to pwscf input format.
* `g2g qepath %quantumvitashome%\qe6.4.1_win`: Add the directories of qe and mpi in QuantumVITAS to `PATH` of Windows and open a console.


### 3.2 Other Toos
* `g2g aa.axsf b.xsf id [scale]`: Extract id-th xsf file from axsf file, and geometry may be modified by scale*frequency vector if the a.xsf is the frequency mode file from pwscf.
* `g2g aa.axsf b.xyz`: Convert axsf file with multi-frames to xyz format
* `g2g aaa.yyy POSCAR/CONTCAR/a.vasp`: Convert geometry to vasp format with openbabel.
* `g2g a.gif [a.xyz]`: Convert geometry in gaussian gjf format to xyz format.
* `g2g xxx.yyy a.xsf`: Convert geometry to xsf format.
* `g2g aaa.yyy bbb.zzz`: Convert geometry with openbabel.

### 3.3 If Anaconda installed 
* Install Anaconda3 to somewhere (e.g. default: `%USERPROFILE%\anaconda3`), and add the home of Anaconda (`%USERPROFILE%\anaconda3`), and its subdirectory `%USERPROFILE%\anaconda3\Scripts` and `%USERPROFILE%\anaconda3\Library\bin` to the environmental variable `PATH`. 
* Install ASE and SeekPath package, `conda  install -c conda-forge  ase seekpath`

### 3.3.1  Build Slab
* `g2g bulk.cif slab`
* Give Miller Index (e.g. 1 1 1), number of layers (e.g. 3) and vaccum thickness (e.g. 8)
* You will get a slab structure in cif format. 

### 3.3.2  High symmetry K-path for vasp 
* `g2g bulk.cif vaspkp`
* You will get `PRIM.vasp` and `vasp.kpt` for VASP band structure calculation. 

### 3.3.3  High symmetry K-path for QuantumVITAS (Quantum Espresso)
* `g2g bulk.cif qekp`
* Give the number of points to insert between high symmetry K points
* You will get `XXX_kpt.pw`, copy it to the Geometry and Bands K-path in QuantumVITAS for band structure calculation.

