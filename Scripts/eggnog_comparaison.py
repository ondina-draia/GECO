#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Dec 27 13:51:11 2019

@author: madeleine
"""

# Import packages
import pandas as pd
from collections import Counter

##########

def compareGenes(diamondGenes, hmmerGenes):
    
    # Found differences between 2 dataframes
    differentGenes = pd.concat([diamondGenes, hmmerGenes]).drop_duplicates(keep=False)

    # Print results as dataframe size
    print("Gene comparaison between both dataframes:")
    print(diamondGenes.size, " orthologs found with diamond")
    print(hmmerGenes.size, " orthologs found with hmmer")
    print(differentGenes.size, " orthologs differ between diamond and hmmer")

# Read gene names from files
diamondGene = pd.read_csv('/home/madeleine/Documents/GECO/eggNOG/Candidatus_Blochmannia_pennsylvanicus_DIAMOND.annotations', header=None, usecols=[0], sep='\t')
hmmerGene = pd.read_csv('/home/madeleine/Documents/GECO/eggNOG/Candidatus_Blochmannia_pennsylvanicus_HMMER.annotations', header=None, usecols=[0], sep='\t')

# Compare genes of both dataframes
compareGenes(diamondGene, hmmerGene)

##########

def commonGO(GO):
    listOfList = GO.values.tolist()
    flatList = [item for elem in listOfList for item in elem]
    print(Counter(flatList).most_common(2))

# Read orthologous groups from files
diamondGO = pd.read_csv('/home/madeleine/Documents/GECO/eggNOG/Candidatus_Blochmannia_pennsylvanicus_DIAMOND.annotations', header=None, usecols=[5], sep='\t')
hmmerGO = pd.read_csv('/home/madeleine/Documents/GECO/eggNOG/Candidatus_Blochmannia_pennsylvanicus_HMMER.annotations', header=None, usecols=[5], sep='\t')

# Compare orthologous groups
print("Most common GO found in diamond:")
commonGO(diamondGO)
print("Most common GO found in hmmer:")
commonGO(hmmerGO)

