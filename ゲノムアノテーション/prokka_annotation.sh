=
# Update on 2/Apr/2024: The update on 15/Mar/2024, might affect the total conda environment,
# making installing other packages problems, thus,
# here, I suggest to use docker to run the Prokka on Apple silicon processor.


# Update on 15/Mar/2024: Prokka installing on osx-arm64 (Apple silicon processor)
# A dependency of Prokka, Aragorn, has not been native built on osx-arm64. 
# Here I listed one possible way to solve this issue by creating an osx-64 environments.
#Check more @ https://stackoverflow.com/questions/70205633/cannot-install-python-3-7-on-osx-arm64


#For conda user

# 1. INSTALL PROKKA IF NOT INSTALLED
conda create -n prokka -c conda-forge -c bioconda -c defaults prokka

# If you are not osx-arm64 user, you don't need to run those commands!
# For osx-arm64 user 
# conda config --env --set subdir osx-64
# OR directly
# conda create CONDA_SUBDIR=osx-64 -n prokka -c conda-forge -c bioconda -c defaults prokka


# 2. ACTIVATE PROKKA ENV
conda activate prokka

# 3. MOVE TO WORKING DIR
cd prokka

# 4. ANNOTATE THE SEQUENCES
prokka --kingdom Bacteria --outdir H1_3_1 --genus Achromobacter H1_3_1.fasta
    # --OUTDIR H1_3_1 : NAME OF THE OUTPUT DIR 
    # --genus Achromobacter : NAME OF THE GENUS
    # H1_3_1.FASTA: THE NUCLEOTIDE SEQUENCES

prokka --kingdom Bacteria --outdir LMG1863 --genus Achromobacter LMG_1863.fna

# CHECK FOR MORE INFORMATION https://github.com/tseemann/prokka

# For docker user

# 1. download and install Docker Desktop for Macos (arm chips)
# 2. pull the images
docker pull staphb/prokka:latest
# 3. create a volume for data exchanging with host
docker volume create prokka
# 4. copy the sequences into docker volume
docker container create --name temp -v prokka:/data hello-world
docker cp . temp:/data # make sure you have the seqs in the current dir
docker rm temp
# 5. run the prokka annotation
docker run -v prokka:/data staphb/prokka:latest prokka seqs_name.fasta
# 6. check the results inside Docker Desktop - Volume - Prokka



