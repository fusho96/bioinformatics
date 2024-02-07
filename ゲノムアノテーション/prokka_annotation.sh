# INSTALL PROKKA IF NOT
conda create -n prokka -c conda-forge -c bioconda -c defaults prokka

# ACTIVATE PROKKA ENV
conda activate prokka

# MOVE TO WORKING DIR
cd prokka

# ANNOTATE THE SEQUENCES
prokka --kingdom Bacteria --outdir H1_3_1 --genus Achromobacter H1_3_1.fasta
    # --OUTDIR H1_3_1 : NAME OF THE OUTPUT DIR 
    # --genus Achromobacter : NAME OF THE GENUS
    # H1_3_1.FASTA: THE NUCLEOTIDE SEQUENCES

prokka --kingdom Bacteria --outdir LMG1863 --genus Achromobacter LMG_1863.fna

# CHECK FOR MORE INFORMATION https://github.com/tseemann/prokka