# USE PROKKA TO ANNOTATE FIRST 
#

# INSTALL CLINKER IF NOT
conda create -n clinker -c conda-forge -c bioconda clinker-py

# ACTIVATE CLINKER ENV
conda activate clinker

# MOVE TO DIR
cd clinker
# COPY AND PASTE ALL GBK FILES HERE
# -LMG1863.GBK
# -H131.GBK

# PLOT
clinker *.gbk -p

# CHECK FOR MORE INFORMATION https://github.com/gamcil/clinker