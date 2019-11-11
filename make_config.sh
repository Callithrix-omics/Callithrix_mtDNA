#make configuration file for novoplasty

#location of our files (only the R1 files)
FILES=/path/to/raw/fastq/*_R1.fastq.gz
f2=""

#loop through the files
for f in $FILES
do

#create config file for each sample
        sample_name=`basename $f`
        echo $f
        project_name=${sample_name%_R1*}  
        echo $project_name
        project_file=/mtDNA_newplast/${project_name}_config.txt
        echo $project_file
        #determine our second file name (replace R1 with R2)
        f2="${f/_R1/_R2}"






	echo "Project:" > $project_file
	echo "-----------------------"
	echo "Project name          = $project_name " >> $project_file
	echo "Type                  = mito " >> $project_file
 	echo "Genome Range          = 12000-22000 " >> $project_file
 	echo "K-mer                 = 23 " >> $project_file
 	echo "Max memory            = " >> $project_file
 	echo "Extended log          = 0 " >> $project_file
 	echo "Save assembled reads  = no " >> $project_file
 	echo "Seed Input            = /storage/datasets/callithrix/ref/ref_mtDNA/mtDNA_  " >> $project_file
 	echo "Reference sequence    =  " >> $project_file
	echo "Variance detection    = no " >> $project_file
 	echo "Heteroplasmy          = " >> $project_file
 	echo "Chloroplast sequence  = /path/to/chloroplast_file/chloroplast.fasta (only for mito_plant option) " >> $project_file
 	echo "            You have to assemble the chloroplast before you assemble the mitochondria of plants!" >> $project_file 
 	echo "Dataset 1: " >> $project_file
 	echo "----------------------- " >> $project_file
 	echo "Read Length           = 151 " >> $project_file
 	echo "Insert size           = 300 " >> $project_file
 	echo "Platform              = illumina " >> $project_file
 	echo "Single/Paired         = PE " >> $project_file
 	echo "Combined reads        = " >> $project_file
 	echo "Forward reads         = $f " >> $project_file
 	echo "Reverse reads         = $f2 " >> $project_file
 	echo ""
 	echo "Optional: " >> $project_file
 	echo "-----------------------"
 	echo "Insert size auto      = yes " >> $project_file
 	echo "Insert Range          = 1.8 " >> $project_file
 	echo "Insert Range strict   = 1.3 " >> $project_file
 	echo ""
	echo "Project: " >> $project_file
 	echo "-----------------------" >> $project_file 
 	echo "Project name         = Choose a name for your project, it will be used for the output files." >> $project_file 
 	echo "Type                 = (chloro/mito/mito_plant) "chloro" for chloroplast assembly, "mito" for mitochondrial assembly and " >> $project_file 
 	echo "                       "mito_plant" for mitochondrial assembly in plants." >> $project_file 
 	echo "Genome Range         = (minimum genome size-maximum genome size) The expected genome size range of the genome." >> $project_file 
 	echo "                       Default value for mito: 12000-20000 / Default value for chloro: 120000-200000" >> $project_file 
 	echo "                       If the expected size is know, you can lower the range, this can be useful when there is a repetitive" >> $project_file 
 	echo "                       region, what could lead to a premature circularization of the genome." >> $project_file 
 	echo "K-mer                = (integer) This is the length of the overlap between matching reads (Default: 23). " >> $project_file 
 	echo "                       If reads are shorter then 90 bp or you have low coverage data, this value should be decreased down to 23. " >> $project_file 
 	echo "                       For reads longer then 101 bp, this value can be increased, but this is not necessary." >> $project_file 
 	echo "Max memory           = You can choose a max memory usage, suitable to automatically subsample the data or when you have limited                      " >> $project_file 
 	echo "                       memory capacity. If you have sufficient memory, leave it blank, else write your available memory in GB" >> $project_file 
 	echo "                       (if you have for example a 8 GB RAM laptop, put down 7 or 7.5 (don't add the unit in the config file))" >> $project_file 
 	echo "Extended log         = Prints out a very extensive log, could be useful to send me when there is a problem  (0/1)." >> $project_file 
 	echo "Save assembled reads = All the reads used for the assembly will be stored in seperate files (yes/no)" >> $project_file 
 	echo "Seed Input           = The path to the file that contains the seed sequence." >> $project_file 
 	echo "Reference (optional) = If a reference is available, you can give here the path to the fasta file." >> $project_file 
 	echo "                       The assembly will still be de novo, but references of the same genus can be used as a guide to resolve " >> $project_file 
 	echo "                       duplicated regions in the plant mitochondria or the inverted repeat in the chloroplast. " >> $project_file 
 	echo "                       References from different genus haven't beeen tested yet." >> $project_file 
 	echo "Variance detection   = If you select yes, you should also have a reference sequence (previous line). It will create a vcf file                " >> $project_file 
 	echo "                       with all the variances compared to the give reference (yes/no)" >> $project_file 
 	echo "Heteroplasmy         = If yo uwant to detect heteroplasmy,first assemble the genome without this option. Then give the resulting                         " >> $project_file 
 	echo "                       sequence as a reference and as a seed input. And give the minimum minor allele frequency for this option " >> $project_file 
 	echo "                       (0.01 will detect heteroplasmy of >1%)" >> $project_file 
 	echo "Chloroplast sequence = The path to the file that contains the chloroplast sequence (Only for mito_plant mode)." >> $project_file 
 	echo "                       You have to assemble the chloroplast before you assemble the mitochondria of plants!" >> $project_file 
 	echo "" >> $project_file 
 	echo "Dataset 1:" >> $project_file 
 	echo "-----------------------" >> $project_file 
 	echo "Read Length          = The read length of your reads." >> $project_file 
 	echo "Insert size          = Total insert size of your paired end reads, it doesn't have to be accurate but should be close enough." >> $project_file 
 	echo "Platform             = illumina is for now the only option" >> $project_file 
 	echo "Single/Paired        = For the moment only paired end reads are supported." >> $project_file 
 	echo "Combined reads       = The path to the file that contains the combined reads (forward and reverse in 1 file)" >> $project_file 
 	echo "Forward reads        = The path to the file that contains the forward reads (not necessary when there is a merged file)" >> $project_file 
 	echo "Reverse reads        = The path to the file that contains the reverse reads (not necessary when there is a merged file)" >> $project_file 
 	echo "" >> $project_file 
 	echo "Optional:" >> $project_file 
 	echo "-----------------------" >> $project_file 
 	echo "Insert size auto     = (yes/no) This will finetune your insert size automatically (Default: yes)" >> $project_file 
 	echo "Insert Range         = This variation on the insert size, could lower it when the coverage is very high or raise it when the" >> $project_file 
	echo "                       coverage is too low (Default: 1.6). " >> $project_file 
 	echo "Insert Range strict  = Strict variation to resolve repetitive regions (Default: 1.2). " >> $project_file 
 done
