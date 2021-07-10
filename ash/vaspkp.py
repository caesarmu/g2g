#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import sys
import os
import ase 
from ase.io import read ,write,vasp
from ase import Atoms
import spglib 
import seekpath

if len(sys.argv) == 1 :
    print("Example: python vaspkp.py a.cif/POSCAR  [30 [0.001]]")
    os.system("pause")
    sys.exit(1)
elif len(sys.argv) == 2 :
    inpos = sys.argv[1]
    ndiv = input("Number of points between high symmetry K points: (e.g., 30): ")
    symprec = input("Tolerance for symmetry: (e.g., 0.001): ")
elif len(sys.argv) == 3 :
    inpos = sys.argv[1]
    ndiv = sys.argv[2]
    symprec = input("Tolerance for symmetry: (e.g., 0.001): ")
else:
    inpos = sys.argv[1]
    ndiv = sys.argv[2]
    symprec = sys.argv[3]

if ndiv == "":
     ndiv = "30"
if symprec == "":
     symprec = "0.001"     
symprec = float(symprec)

dirname,posname = os.path.split(inpos)
if not os.path.isfile(inpos):
    sys.exit(1)   
outdir = "."

bulk = read(inpos) 
numbers = bulk.get_atomic_numbers()
tr = True
output = os.path.join(outdir,"vasp.kpt")
outpos = os.path.join(outdir,"Prim.vasp")
inp = (bulk.cell, bulk.get_scaled_positions(),numbers)
kpdata = seekpath.getpaths.get_path(inp, with_time_reversal=tr, recipe='hpkot', threshold=1e-07, symprec=symprec, angle_tolerance=-1.0)

primcell = Atoms(positions=kpdata['primitive_positions'],cell=kpdata['primitive_lattice'],pbc=[True,True,True])
primcell.set_atomic_numbers(kpdata['primitive_types'])
primcell.set_scaled_positions(kpdata['primitive_positions'])

kpath = kpdata['point_coords']
if os.path.isfile(output):
    os.remove(output)
with open(output,'a') as outfile:
    outfile.write("High-symmetry K-points from SeekPath\n")
    outfile.write(ndiv+"\n")
    outfile.write("Line-mode\n")
    outfile.write("Reciprocal\n")
    for kp in  kpdata['path'] :
        for kpkey in kp :
            outfile.write("%8.6f %8.6f %8.6f !%s\n" % (kpath[kpkey][0],  kpath[kpkey][1], kpath[kpkey][2], kpkey))
        outfile.write("\n")
outfile.close()
 
print('Primitive cell written to Prim.vasp...')
vasp.write_vasp(outpos,primcell,sort=True,direct=True,vasp5=True)
sys.exit(0)
