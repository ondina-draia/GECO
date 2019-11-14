# -*- coding: utf-8 -*-
"""
Éditeur de Spyder

Ceci est un script temporaire.
"""

def geneLength(filename):
    with open(filename) as f:
        content = f.readlines()
    #for line in content:
    #    if line.startswith(">"):
    #        print(line)
        #print(line)
    previousLine = ""
    for line in content:
        if previousLine.startswith(">"):
            #for aa in range(len(line)):
            #    while aa != ">":
             #       print(aa)
             print(line)
        previousLine = line
    
        
    # get CDS size (to get average gene length + gene density)

geneLength("Blochmannia_floridanus.txt")