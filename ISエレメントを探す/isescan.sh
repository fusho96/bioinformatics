# INSTALL
conda create -n isescan -c bioconda -c defaults -conda-forge isescan

# ACTIVATE ENV
conda activate isescan

# SEARCH
isescan.py --seqfile H1_3_1.fasta --output H1_3_1_results --nthread 8