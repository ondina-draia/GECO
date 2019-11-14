def geneLength(filename):  # get CDS size (to get average gene length + gene density)
    with open(filename) as f:
        content = f.readlines()

    seq = ''
    seqdict = {}
    seqact = ''
    # previousLine = ""

    #creation dictionnaire qui recupere chaque id comme cle et chaque sequence comme valeur associee
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
    

sequence = geneLength("Blochmannia_floridanus.txt")
i = 0 #va compter le nombre de genes
totlen = 0
genelengths= []
for k, v in sequence.items():
    i += 1
    totlen += len(v)
    genelengths.append(len(v))
    print(i, " ",k, "longueur", len(v)) #longueur des genes avec leur id
   
#Average gene lengths
print("Average gene length: ", sum(genelengths)/len(genelengths))

#Gene density
#finir cette fonction

#tout mettre dans des fonctions

#faire un main 

#mettre dans des fichiers text

