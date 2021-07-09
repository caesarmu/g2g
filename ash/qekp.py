#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import sys
import os
import ase 
from ase.io import read ,write,vasp
from ase import Atom,Atoms
import spglib 
import seekpath

if len(sys.argv) == 1 :
    inpos = input("Input System for High-symmetry KP: ")
    ndiv = input("Number of points between high symmetry K points: (e.g., 30): ")
elif len(sys.argv) == 2 :
    inpos = sys.argv[1]
    ndiv = input("Number of points between high symmetry K points: (e.g., 30): ")
else:
    inpos = sys.argv[1]
    ndiv = sys.argv[2]
 
 
if not os.path.isfile(inpos):
    sys.exit(1)   
ndiv = int(ndiv)

dirname,posname = os.path.split(inpos)
posbase,posext = os.path.splitext(posname)
outdir = "."
bulk = read(inpos) 

numbers = bulk.get_atomic_numbers()
tr = True
output = os.path.join(outdir,posbase+"_kpt.pw")
inp = (bulk.cell, bulk.get_scaled_positions(),numbers)
kpdata = seekpath.getpaths.get_path(inp, with_time_reversal=tr, recipe='hpkot', threshold=1e-07, symprec=1e-05, angle_tolerance=-1.0)

primcell = Atoms(positions=kpdata['primitive_positions'],cell=kpdata['primitive_lattice'],pbc=[True,True,True])
primcell.set_atomic_numbers(kpdata['primitive_types'])
primcell.set_scaled_positions(kpdata['primitive_positions'])
kpath = kpdata['point_coords']
if os.path.isfile(output):
    os.remove(output)

kpid = 0
hskp = []
elelist = []
ele = Atom('H')
with open(output,'a') as outfile:
    outfile.write("&SYSTEM \n")
    outfile.write("  ibrav=0\n")
    outfile.write("  nat=10\n")
    outfile.write("/\n")
    outfile.write("CELL_PARAMETERS angstrom\n")
    for latt in primcell.cell:
        outfile.write("%16.10f %16.10f %16.10f\n" % (latt[0], latt[1],latt[2])) 
    outfile.write("ATOMIC_POSITIONS crystal\n") 
    atomid =0 
    for dxyz in  primcell.positions:
        ele.number = primcell.get_atomic_numbers()[atomid]
        outfile.write("%s %16.10f %16.10f %16.10f\n" % (ele.symbol, dxyz[0], dxyz[1],dxyz[2]))
        atomid=atomid+1
    for kp in  kpdata['path'] :
        for ni in range(ndiv+1) :            
            kpx= kpath[kp[0]][0]*(ndiv-ni)/ndiv + kpath[kp[1]][0]*ni/ndiv
            kpy = kpath[kp[0]][1]*(ndiv-ni)/ndiv + kpath[kp[1]][1]*ni/ndiv
            kpz = kpath[kp[0]][2]*(ndiv-ni)/ndiv + kpath[kp[1]][2]*ni/ndiv
            if kpid>1 and abs(kpx-kpx0)<0.001 and abs(kpy-kpy0)<0.001 and abs(kpz-kpz0)<0.001 :
                continue
            kpx0 = kpx 
            kpy0 = kpy 
            kpz0 = kpz
            hskp.append([kpx,kpy,kpz])
            kpid = kpid +1
    outfile.write("K_POINTS crystal\n")
    outfile.write(str(kpid)+" \n")
    for hkp in hskp :
        outfile.write("%16.10f %16.10f %16.10f 1\n" % (hkp[0], hkp[1],hkp[2]))
    outfile.write("\n")
outfile.close()
