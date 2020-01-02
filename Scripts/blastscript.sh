#!~/Documents/GECO/Script
# please adjust file name depending on path

# List of species of interest
species='Blochmannia_floridanus.txt Candidatus_Blochmannia_pennsylvanicus.faa Candidatus_Blochmannia_chromaiodes_str.640.txt Enterobacter_hormaechei.faa Klebsiella_pneumonia.faa'

# Create databanks
for specie in $species
do
	makeblastdb -in ~/Documents/GECO/Genomes/${specie} -dbtype prot
done
# moves files to databanks directory
mv ~/Documents/GECO/Genomes/*.phr ~/Documents/GECO/Genomes/*.pin ~/Documents/GECO/Genomes/*.psq ~/Documents/GECO/BLAST_results/BLAST_databanks/
echo "All databases have been created"

# Run blast (in BLAST_output)
# and ignore comment lines, filter for sequences with over 30% identity and 80% alignment, for multiple hits keep the one with lowest e value (in BLAST_filtered)
for specie in $species
do

	if [ ${specie} != "Blochmannia_floridanus.txt" ] # avoid run blast against it-self
	then
		blastp -db ~/Documents/GECO/BLAST_results/BLAST_databanks/${specie} -query ~/Documents/GECO/Genomes/Blochmannia_floridanus.txt -out ~/Documents/GECO/BLAST_results/BLAST_output/Blochmannia_floridanus_VS_${specie}.out -outfmt 7
		grep -v '^#' ~/Documents/GECO/BLAST_results/BLAST_output/Blochmannia_floridanus_VS_${specie}.out | awk '$3>=30 && $4>=80' | sort -k1,1 -k11,11 | awk '!a[$1]++' > ~/Documents/GECO/BLAST_results/BLAST_filtered/Blochmannia_floridanus.txt_VS_${specie}_filtered.out
	fi

	if [ ${specie} != "Candidatus_Blochmannia_pennsylvanicus.faa" ] # avoid run blast against it-self
	then
		blastp -db ~/Documents/GECO/BLAST_results/BLAST_databanks/${specie} -query ~/Documents/GECO/Genomes/Candidatus_Blochmannia_pennsylvanicus.faa -out ~/Documents/GECO/BLAST_results/BLAST_output/Candidatus_Blochmannia_pennsylvanicus_VS_${specie}.out -outfmt 7
		grep -v '^#' ~/Documents/GECO/BLAST_results/BLAST_output/Candidatus_Blochmannia_pennsylvanicus_VS_${specie}.out | awk '$3>=30 && $4>=80' | sort -k1,1 -k11,11 | awk '!a[$1]++' > ~/Documents/GECO/BLAST_results/BLAST_filtered/Candidatus_Blochmannia_pennsylvanicus.faa_VS_${specie}_filtered.out
	fi

	if [ ${specie} != "Candidatus_Blochmannia_chromaiodes_str.640.txt" ] # avoid run blast against it-self
	then
		blastp -db ~/Documents/GECO/BLAST_results/BLAST_databanks/${specie} -query ~/Documents/GECO/Genomes/Candidatus_Blochmannia_chromaiodes_str.640.txt -out ~/Documents/GECO/BLAST_results/BLAST_output/Candidatus_Blochmannia_chromaiodes_VS_${specie}.out -outfmt 7
		grep -v '^#' ~/Documents/GECO/BLAST_results/BLAST_output/Candidatus_Blochmannia_chromaiodes_VS_${specie}.out | awk '$3>=30 && $4>=80' | sort -k1,1 -k11,11 | awk '!a[$1]++' > ~/Documents/GECO/BLAST_results/BLAST_filtered/Candidatus_Blochmannia_chromaiodes_str.640.txt_VS_${specie}_filtered.out
	fi

	if [ ${specie} != "Enterobacter_hormaechei.faa" ] # avoid run blast against it-self
	then
		blastp -db ~/Documents/GECO/BLAST_results/BLAST_databanks/${specie} -query ~/Documents/GECO/Genomes/Enterobacter_hormaechei.faa -out ~/Documents/GECO/BLAST_results/BLAST_output/Enterobacter_hormaechei_VS_${specie}.out -outfmt 7
		grep -v '^#' ~/Documents/GECO/BLAST_results/BLAST_output/Enterobacter_hormaechei_VS_${specie}.out | awk '$3>=30 && $4>=80' | sort -k1,1 -k11,11 | awk '!a[$1]++' > ~/Documents/GECO/BLAST_results/BLAST_filtered/Enterobacter_hormaechei.faa_VS_${specie}_filtered.out
	fi

	if [ ${specie} != "Klebsiella_pneumonia.faa" ] # avoid run blast against it-self
	then
		blastp -db ~/Documents/GECO/BLAST_results/BLAST_databanks/${specie} -query ~/Documents/GECO/Genomes/Klebsiella_pneumonia.faa -out ~/Documents/GECO/BLAST_results/BLAST_output/Klebsiella_pneumonia_VS_${specie}.out -outfmt 7
		grep -v '^#' ~/Documents/GECO/BLAST_results/BLAST_output/Klebsiella_pneumonia_VS_${specie}.out | awk '$3>=30 && $4>=80' | sort -k1,1 -k11,11 | awk '!a[$1]++' > ~/Documents/GECO/BLAST_results/BLAST_filtered/Klebsiella_pneumonia.faa_VS_${specie}_filtered.out
	fi

done
