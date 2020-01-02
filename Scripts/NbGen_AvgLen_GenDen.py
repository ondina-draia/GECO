#This script computes the number of genes that are present in a sequence, their average length and the gene density
import pandas as pd 

def geneLength(filename):  # get CDS size (to get average gene length + gene density)
    with open(filename) as f:
        content = f.readlines()

    seq = ''
    seqdict = {}
    seqact = ''
    # previousLine = ""

    #created adictionnary that gets each id as its keys and each sequence as the associated values
    for line in content:
        if line.startswith(">"):
            seq = seq + line[5:40] + ' '
            seqdict[line[5:40]] = ""
            actkey = line[5:40]
            seqact = ''
        else:
            seq = seq + line
            seqact = seqact + line
            seqdict[actkey] = seqact
     
    return seqdict
    

def NAG(filename): #shows the gene length, the average gene length and the gene density
    sequence = geneLength(filename)
    i = 0 #va compter le nombre de genes
    genelengths= []
    gendens = []
    for k, v in sequence.items():
        i += 1
        genelengths.append(len(v))
        gendens.append(i/len(v))
    #Gene density: ratio number of genes (i) per number of base pairs (gene length)
    print(" Number of genes:", i, "    ",k, "AVG Gene length: ", sum(genelengths)/len(genelengths), "Gene density: ", sum(gendens)/len(gendens) ) #longueur des genes avec leur id
    return 0

NAG("Candidatus_Blochmannia_pennsylvanicus.faa")
NAG("Candidatus_Blochmannia_chromaiodes_str.640.txt")
NAG("Blochmannia_floridanus.txt")
NAG("Enterobacter_hormaechei.faa")
NAG("Klebsiella_pneumonia.faa")

