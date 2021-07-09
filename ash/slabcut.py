#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import sys
import os
import ase   
from ase.build import surface
from ase.visualize import view
from ase.io import read, write
 
if len(sys.argv) == 1 :
    inpos = input("Input bulk: ")
else:
    inpos = sys.argv[1]

hkl = input("Slab [hkl] indices (e.g. 1 1 1): ")
thick = input("Number of layers (e.g., 3): ")
thick = int(thick)
hvac = input("Thickness of vaccum at each side (e.g., 10 ): ")
hvac = float(hvac)
dirname,posname = os.path.split(inpos)
posbase,posext = os.path.splitext(posname)

if not os.path.isfile(inpos):
    sys.exit(1)   

outdir = "."
outpos = os.path.join(outdir,posbase+'_'+hkl.replace(' ','')+".cif")
inbulk= read(inpos) 
    
hkllist = hkl.replace("  "," ").split()
newhkl =(int(hkllist[0]),int(hkllist[1]),int(hkllist[2]))
cutsurface = surface(inbulk,newhkl,thick)
cutsurface.center(vacuum=hvac,axis=2)
write(outpos,cutsurface)
print(posbase+'_'+hkl.replace(' ','')+' generated!')
#view(cutsurface)
