# Pipline for bioinformatics
Here listed a pipeline I used for bioinformatics.

Tools used in this pipeline:
1. *R* (ver. 4.0.2)
2. MATLAB (ver. 2023b)
3. Python (ver. 3.7)
4. Miniconda on WSL2 (Ubuntu)
5. Mauve (ver. 20150226)
6. MEGA (ver. 6)

Tools created as conda environments:
(Thanks for developing these useful tools which helped me a lot in PhD research)
1. [Prokka](https://github.com/tseemann/prokka)
2. [Clinker](https://github.com/gamcil/clinker)
3. [ISEScan](https://github.com/xiezhq/ISEScan)

Online tools:
1. [eggNOG-mapper](http://eggnog-mapper.embl.de/)
2. [KofamKOALA](https://www.genome.jp/tools/kofamkoala/)
3. [EzBioCloud](https://www.ezbiocloud.net/)

## FOR 16S rRNA amplicon analysis
Tutorials for using QIIME2 (command and galaxy) have been uploaded to the Google Drive, 
please check them there.

## FOR ploting the diversity analysis results
I use QIIME2 to conduct the analysis first, 
the results will be located in ./core-metrics-results.

### Statistic test in alpha diversity 
QIIME2 use Kruskal-wallis tests for comparison between groups,
which is not recommended here.
Inside, codes using *R* to do the Dunn test are located in ./アルファ多様性/alpha_test.r

### Ploting the alpha diversity
1. Summarize the alpha diversities into one files ./アルファ多様性/alpha.txt
2. 







