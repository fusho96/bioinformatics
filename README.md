# Pipline for bioinformatics
Here is a pipeline I used for bioinformatics.

Tools used in this pipeline:
1. *R* (ver. 4.0.2)
2. MATLAB (ver. 2023b)
3. Python (ver. 3.7)
4. Miniconda on WSL2 (Ubuntu)
5. Mauve (ver. 20150226) - Genome comparison
6. MEGA (ver. 7) - Phylogenetic tree construction

Tools created as conda environments:
1. [Prokka](https://github.com/tseemann/prokka) - Genome annotation
2. [Clinker](https://github.com/gamcil/clinker) - Visualization of the genetic clusters
3. [ISEScan](https://github.com/xiezhq/ISEScan) - Find insertion sequences

Online tools:
1. [eggNOG-mapper](http://eggnog-mapper.embl.de/) - KEGG annotation
2. [KofamKOALA](https://www.genome.jp/tools/kofamkoala/) - KEGG annotation 
3. [EzBioCloud](https://www.ezbiocloud.net/) - 16S rRNA database / ANI calculator
4. [GGDC](https://ggdc.dsmz.de/ggdc.php#) - DDH calculator

## For 16S rRNA amplicon analysis
Tutorials for using QIIME2 (command and galaxy) have been uploaded to Google Drive, 
please check them there.

### Statistic test in alpha diversity 
I use QIIME2 to conduct the analysis first, 
the results will be located in /core-metrics-results.

QIIME2 uses Kruskal-wallis tests for comparison between groups, which is not recommended here.
Inside, codes using *R* to do the Dunn test are located in `./アルファ多様性/alpha_test.r` (dependant on libraries [agricolae](https://github.com/myaseen208/agricolae) and [dunn.test](https://github.com/cran/dunn.test)).

### Ploting the alpha diversity
1. Summarize the alpha diversities into one file `./アルファ多様性/alpha.txt`
2. Run `alpha_box_plot.r` (dependant on libraries [ggplot2](https://github.com/tidyverse/ggplot2) and [amplicon](https://github.com/microbiota/amplicon)).
3. Use Adobe Illustrator to revise the figures as you want.

### Ploting the beta diversity
1. Paste the PCoA result (ordination.txt) into `./ベータ多様性`
2. Run `beta_pcoa_plot.r` (dependant on libraries [ggplot2](https://github.com/tidyverse/ggplot2) and [ggrepel](https://github.com/slowkow/ggrepel)).
3. Use Adobe Illustrator to revise the figures as you want.

### Ploting taxonomy barplot
I use `QIIME2` to get the taxonomy assignment first and filter to what I am interested in.
1. Paste the filtered data into `./棒グラフ`
2. Run `barplot_plot.r` (dependant on libraries [reshape2](https://github.com/cran/reshape2), [ggplot2](https://github.com/tidyverse/ggplot2) and [ggsci](https://github.com/nanxstats/ggsci)).
3. Use Adobe Illustrator to revise the figures as you want.

### Ploting heatmap
I don't like the heatmap made by *R*, so here I use Python with the library [seaborn](https://github.com/mwaskom/seaborn).
1. Run `./ヒートマップ/seasborn_plot_heatmap.ipynb`
2. Use Adobe Illustrator to revise the figures as you want.

### Ploting other barplot (using ectoine concentration as an example)
1. Run `./エクトイン濃度/barplot_ectoine.r`
2. Use Adobe Illustrator to revise the figures as you want.

### Ploting the current vs. time, and gas concentration vs. time
I prefer to use `MATLAB` for making two y-axis figures, again, it's a personal choice.
1. Import all your data into MATLAB data format (*.mat)
2. Run `./リアクターの電流ー気相/plot_od_code.m`
3. Use Adobe Illustrator to combine all the figures.

### How to use local blastn?
If you have an amount of 16S rRNA sequences to identify, I suggest you use local BLASTn, rather than the online version.
1. First, you should have a 16S rRNA database. You can either use SILVA 16S rRNA database or nr/nt database from NCBI.
   Here, I provided the link for SILVA,  https://www.arb-silva.de/download/arb-files/.
   The one I downloaded was `SILVA_138.1_SSURef_NR99_tax_silva.fasta`. （Not uploaded due to the limitation of file size in Github）
3. If you already have QIIME2 installed, you don't need to install BLAST anymore. The only thing is to activate that conda environment.
4. Make a blast database using this command
   
   `makeblastdb -in SILVA_138.1_SSURef_NR99_tax_silva.fasta -dbtype nucl -out SILVA_16S`

   （.nhr and .nhq files are not uploaded due to the limitation of file size in Github）
6. Blasting your seqs (`./Local BLASTの使い方/seqs.fasta`) using this command
   
   `blastn -db SILVA_16S -query seqs.fasta -num_threads 4 -out seqs.blastn -outfmt "6 qseqid sseqid pident length mismatch stitle evalue" -evalue 1e-5 -max_target_seqs 5`
   
   For your own defined output style, you can change the format specifiers of the outfmt.
8. Your results will be stored in seqs.blastn.

### Ploting phylogenetic tree
I recommend to download sequences from [EziBioCloud 16S database](https://www.ezbiocloud.net/).
It can provide the results of comparison with type strains of your uploaded sequences. 

1. Prepare the sequences (with root) `./系統樹`
2. Use `MEGA` to construct the trees (Find parameters in our previous papers, or use your parameters)
3. Use Adobe Illustrator to combine all the figures

## For genome analysis

### Genome annotation
1. Prepare your sequence files well and store them in `./ゲノムアノテーション/H1_3_1.fasta`
2. `Prokka` annotation: Run the commands in `prokka_annotation.sh` in a conda bash
   
   Update on 15/Mar/2024: Prokka installing on osx-arm64 (Apple silicon processor)
   A dependency of Prokka, Aragorn, has not been native built on osx-arm64.
   Here I listed one possible way to solve this issue by creating an osx-64 environments.

   `conda config --env --set subdir osx-64`

   Check more @ https://stackoverflow.com/questions/70205633/cannot-install-python-3-7-on-osx-arm64
      
4. After finishing the Prokka annotation, you can use the amino acid sequences to do further KEGG annotations
   
   - [eggNOG-mapper](http://eggnog-mapper.embl.de): upload the amino acid sequences (`./KEGGアノテーション/H1_3_1.faa`) and submit
   - [KofamKOALA](https://www.genome.jp/tools/kofamkoala/): upload the amino acid sequences and submit.
   
## Genome comparison
1. Use the Genbank files (*.gbk) from you Prokka annotation results `./ゲノムをを比較する/H1_3_1.gbk and LMG1863.gbk`
2. Open `Mauve` to align the sequences: Files-Align with progressiveMavue, add the sequences (dependent on JAVA environment)

### Visualizing the results of genetic clusters
1. Cut the part of sequences you are interested
2. Annotate them with Prokka and use the *.gbk files
3. `Clinker` visualization
   Run the commands in `./遺伝子クラスターを比較して図で視覚化する/gene_cluster_comparison.sh`
4. Use Adobe Illustrator to revise the figures as you want.

### Finding insertion sequences
I recommend using `ISEScan`. This tool can provide the length/starting/ending of the insertion sequences.
There are also some other tools listed in `./ISエレメントを探す/H1_3_1_other_tools.xlsx` for finding IS and antibiotic genes.
Please check this file if you need more choices.
1. Prepare the nucleotide sequences `./ISエレメントを探す/H1_3_1.fasta`
2. Run commands in `ISEScan.sh`

### Calculating DDH and ANI
Online tools can be very helpful. 
[Genome-to-Genome Distance Calculator 3.0](https://ggdc.dsmz.de/ggdc.php#) and [ANI Calculator](https://www.ezbiocloud.net/tools/ani)

## Sequences submission

### Submitting raw sequences to the DDBJ database
1. Prepare files as orders in `./DDBJにDRAを登録する`
2. For more information, check https://www.ddbj.nig.ac.jp/dra/submission.html

### Submitting 16S rRNA sequences to Genbank
1. Prepare files as orders in `./Genbankに16S_rRNAを登録する`

### Submitting genome sequences with annotation to the DDBJ database
1. Prokka annotation
2. Make the annotation files (*.tsv) according to the *.gbk files from your Prokka annotation results `./DDBJにゲノムを登録する/achromobacter_H1_3_1.annt.tsv`
3. Validation using the tools provided by DDBJ







