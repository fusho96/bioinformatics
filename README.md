# Pipline for bioinformatics
Here listed a pipeline I used for bioinformatics.

Tools used in this pipeline:
1. *R* (ver. 4.0.2)
2. MATLAB (ver. 2023b)
3. Python (ver. 3.7)
4. Miniconda on WSL2 (Ubuntu)
5. Mauve (ver. 20150226) - Genome comparision
6. MEGA (ver. 7) - Phylogenetic tree constrution

Tools created as conda environments:

(Thanks for developing these useful tools which helped me a lot in PhD research)
1. [Prokka](https://github.com/tseemann/prokka) - Genome annotation
2. [Clinker](https://github.com/gamcil/clinker) - Visualization of the genetic clusters
3. [ISEScan](https://github.com/xiezhq/ISEScan) - Find insertion sequences

Online tools:
1. [eggNOG-mapper](http://eggnog-mapper.embl.de/) - KEGG annotation
2. [KofamKOALA](https://www.genome.jp/tools/kofamkoala/) - KEGG annotation 
3. [EzBioCloud](https://www.ezbiocloud.net/) - 16S rRNA database / ANI calculator
4. [GGDC](https://ggdc.dsmz.de/ggdc.php#) - DDH calculator

## FOR 16S rRNA amplicon analysis
Tutorials for using QIIME2 (command and galaxy) have been uploaded to the Google Drive, 
please check them there.

### Statistic test in alpha diversity 
I use QIIME2 to conduct the analysis first, 
the results will be located in ./core-metrics-results.

QIIME2 uses Kruskal-wallis tests for comparison between groups, which is not recommended here.
Inside, codes using *R* to do the Dunn test are located in ./アルファ多様性/alpha_test.r (dependant on libraries [agricolae](https://github.com/myaseen208/agricolae) and [dunn.test](https://github.com/cran/dunn.test)).

### Ploting the alpha diversity
1. Summarize the alpha diversities into one file ./アルファ多様性/alpha.txt
2. Run alpha_box_plot.r (dependant on libraries [ggplot2](https://github.com/tidyverse/ggplot2) and [amplicon](https://github.com/microbiota/amplicon)).

3. Use Adobe Illustrator to revise the figures as you want.

### Ploting the beta diversity
1. Paste the pcoa result (ordination.txt) into ./ベータ多様性
2. Run beta_pcoa_plot.r (dependant on libraries [ggplot2](https://github.com/tidyverse/ggplot2) and [ggrepel](https://github.com/slowkow/ggrepel)).

4. Use Adobe Illustrator to revise the figures as you want.

### FOR ploting taxanomy barplot
I use QIIME2 to get the taxanomy asignment first, and filter to what I am interested.

1. Paste the filtered data into ./棒グラフ
2. Run barplot_plot.r (dependant on libraries [reshape2](https://github.com/cran/reshape2), [ggplot2](https://github.com/tidyverse/ggplot2) and [ggsci](https://github.com/nanxstats/ggsci)).
   
3. Use Adobe Illustrator to revise the figures as you want.

### For ploting heatmap
Personally, I don't like the heatmap made by R, so here I use Python with library [seaborn](https://github.com/mwaskom/seaborn).
1. Run ./ヒートマップ/seasborn_plot_heatmap.ipynb
2. Use Adobe Illustrator to revise the figures as you want.

### For ploting other barplot (using ectoine concentration as an example)
1. Run ./エクトイン濃度/barplot_ectoine.r
2. Use Adobe Illustrator to revise the figures as you want.

### For ploting the current vs. time, and gas concentration vs. time
I prefer to use MATLAB for making two y-axes figures, again, it's personal choice.

1. Import all your data into MATLAB data format *.mat
2. Run ./リアクターの電流ー気相/plot_od_code.m
3. Use Adobe Illustrator to combine all the figures.

### For ploting phylogenetic tree
I recommend to download sequences from [EziBioCloud 16S databas](https://www.ezbiocloud.net/).
It can provide the results of comparison with type strains of your uploaded sequences. 

1. Prepare the sequences (with root) ./系統樹
2. Use MEGA to construct the trees (Find parameters in our previous papers, or use your own parameters)
3. Use Adobe Illustrator to combine all the figures

## FOR genome analysis

### FOR genome annotation
1. Prepare your sequence files well. ./ゲノムアノテーション/H1_3_1.fasta
2. Prokka annotation: Run the commands in prokka_annotation.sh in a conda bash
3. After finishing Prokka annotation, you can use the amino acid sequences to do further KEGG annotations
   - eggNOG-mapper: upload the amino acid sequences (./KEGGアノテーション/H1_3_1.faa) to http://eggnog-mapper.embl.de
   - KofamKOALA: upload the amino acid sequences to https://www.genome.jp/tools/kofamkoala/

### FOR genome comparison
1. Use the Genbank files (*.gbk) from you Prokka annotation results. ./ゲノムをを比較する/H1_3_1.gbk and LMG1863.gbk
2. Open Mauve to align the sequences: Files-Align with progressiveMavue, add the sequences (dependant on JAVA environment)

### FOR visulazation the results of genetic clusters
1. Cut the part of sequences you are interested
2. Annotate them with Prokka and use the *.gbk files
3. Clinker visulazation
   Run the commands in ./遺伝子クラスターを比較して図で視覚化する/gene_cluster_comparison.sh
4. Use Adobe Illustrator to revise the figures as you want.

### For finding insertion sequences
I recommend to use ISEScan. This tool can provide the length/starting/ending of the insertion sequences.
There are also some other tools listed in ./ISエレメントを探す/H1_3_1_other_tools.xlsx for finding IS and antibotic genes.
Please check this file if you need more choices.

1. Prepare the nucleotide sequences ./ISエレメントを探す/H1_3_1.fasta
2. Run commands in ISEScan.sh

### FOR calculating DDH and ANI
Online tools can be much helpful. 
[Genome-to-Genome Distance Calculator 3.0](https://ggdc.dsmz.de/ggdc.php#)
[ANI Calculator](https://www.ezbiocloud.net/tools/ani)

## Sequences submission

### Submitting raw sequences to DDBJ database
1. Prepare files as orders in ./DDBJにDRAを登録する
2. For more information, check https://www.ddbj.nig.ac.jp/dra/submission.html

### Submitting 16S rRNA sequences to Genbank
1. Prepare files as orders in ./Genbankに16S_rRNAを登録する

### Submitting genome sequences with annotation to DDBJ database
1. Prokka annotation
2. Make the annotation files (*.tsv) according to the *.gbk files from your Prokka annotation results

  A example can be found in ./DDBJにゲノムを登録する/achromobacter_H1_3_1.annt.tsv

3. Validation using the tools provided by DDBJ







