#!~/Documents/GECO/Script
# please adjust file name depending on path

# BLAST PREPARATION

# List of species of interest (repeated)
species1='Blochmannia_floridanus.txt Candidatus_Blochmannia_pennsylvanicus.faa Candidatus_Blochmannia_chromaiodes_str.640.txt Enterobacter_hormaechei.faa Klebsiella_pneumonia.faa'
species2='Blochmannia_floridanus.txt Candidatus_Blochmannia_pennsylvanicus.faa Candidatus_Blochmannia_chromaiodes_str.640.txt Enterobacter_hormaechei.faa Klebsiella_pneumonia.faa'

# Get list of BBH genes from BH files
for specie1 in $species1
do
	for specie2 in $species2
	do
		if [ ${specie1} != ${specie2} ]
		then
			awk -F"\t" 'NR==FNR{_[$1]=$2} NR!=FNR{if($1==_[$2]) print $1;}' ~/Documents/GECO/BLAST_results/BLAST_filtered/${specie1}_VS_${specie2}_filtered.out ~/Documents/GECO/BLAST_results/BLAST_filtered/${specie2}_VS_${specie1}_filtered.out | sort | uniq > ~/Documents/GECO/BLAST_results/BBH/${specie1}_VS_${specie2}_BBH.out
			
			# Test if desired
			#echo "Number of BH:"
			#wc -l ~/Documents/GECO/BLAST_results/BLAST_filtered/${specie1}_VS_${specie2}_filtered.out ~/Documents/GECO/BLAST_results/BLAST_filtered/${specie2}_VS_${specie1}_filtered.out
			#echo "Number of BBH:"
			#wc -l ~/Documents/GECO/BLAST_results/BBH/${specie1}_VS_${specie2}_BBH.out
			# end of test

		fi
	done
done
echo "Bidirectional blast hits have been filtered."


# PAN AND CORE GENOMES

orga1='Candidatus_Blochmannia_pennsylvanicus.faa'
orga2='Candidatus_Blochmannia_chromaiodes_str.640.txt'
orga3='Enterobacter_hormaechei.faa'
orga4='Blochmannia_floridanus.txt'
orga5='Klebsiella_pneumonia.faa'

# Obtain pan genome

cat ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome0.txt
cat ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga1}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome1.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome2.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga1}_pangenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome0.txt
cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga2}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome1.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome2.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga2}_pangenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome0.txt
cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga3}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome1.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome2.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga3}_pangenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome0.txt
cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga4}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome1.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome2.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga4}_pangenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome0.txt
cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga5}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome1.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome2.txt
cat ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/PanGenome/${orga5}_pangenome3.txt

for specie1 in $species1
do	
	echo "Pan genome of ${specie1}:"
	wc -l ~/Documents/GECO/BLAST_results/PanGenome/${specie1}_pangenome0.txt ~/Documents/GECO/BLAST_results/PanGenome/${specie1}_pangenome1.txt ~/Documents/GECO/BLAST_results/PanGenome/${specie1}_pangenome2.txt ~/Documents/GECO/BLAST_results/PanGenome/${specie1}_pangenome3.txt
done

# Obtain core genome

cat ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome0.txt
comm -12 ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga1}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome1.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome2.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga1}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga1}_coregenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome0.txt
comm -12 ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga2}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome1.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome2.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga2}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga2}_coregenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome0.txt
comm -12 ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga3}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome1.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome2.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga3}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga3}_coregenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome0.txt
comm -12 ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga4}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome1.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome2.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga5}_VS_${orga4}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga4}_coregenome3.txt

cat ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome0.txt
comm -12 ~/Documents/GECO/BLAST_results/BBH/${orga1}_VS_${orga5}_BBH.out ~/Documents/GECO/BLAST_results/BBH/${orga2}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome1.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome1.txt ~/Documents/GECO/BLAST_results/BBH/${orga3}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome2.txt
comm -12 ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome2.txt ~/Documents/GECO/BLAST_results/BBH/${orga4}_VS_${orga5}_BBH.out | sort | uniq > ~/Documents/GECO/BLAST_results/CoreGenome/${orga5}_coregenome3.txt

for specie1 in $species1
do	
	echo "Core genome of ${specie1}:"
	wc -l ~/Documents/GECO/BLAST_results/CoreGenome/${specie1}_coregenome0.txt ~/Documents/GECO/BLAST_results/CoreGenome/${specie1}_coregenome1.txt ~/Documents/GECO/BLAST_results/CoreGenome/${specie1}_coregenome2.txt ~/Documents/GECO/BLAST_results/CoreGenome/${specie1}_coregenome3.txt
done

