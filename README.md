# Course project

The R-script `run_analysis.R` needs to be saved in a directory with two subdirectories, "test" and "train" containing the respective data files.

After completion a file "data_means.txt" will be placed along side the script. This file contains the results of the analysis (after cleaning and tidying the data). 

To read back the results, issue the following command in R:
`data.means <- read.table("data_means.txt", header = TRUE, stringsAsFactors=FALSE, check.names = F)`

Inspect it with:
`View(data.means)`

