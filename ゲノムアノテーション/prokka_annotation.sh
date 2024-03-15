# Update on 15/Mar/2024: Prokka installing on osx-arm64 (Apple silicon processor)
# A dependency of Prokka, Aragorn, has not been native built on osx-arm64. 
# Here I listed one possible way to solve this issue by creating an osx-64 environments.
#Check more @ https://stackoverflow.com/questions/70205633/cannot-install-python-3-7-on-osx-arm64

conda config --env --set subdir osx-64
# If you not osx-arm64 user, you don't need to run the command above!

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
