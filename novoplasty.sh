#de novo assembly of mtDNA genomes from WGS data using novoplasty

rm novoplast.cmds

for f in /path/to/program/mtDNA_novoplast/*config.txt
do
	echo "perl /NOVOPlasty/NOVOPlasty2.6.4.pl -c $f" >> novoplast.cmds
done 


cat novoplast.cmds
