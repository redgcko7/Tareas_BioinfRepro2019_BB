# README

______________________________
______________________________
>Final Project — Brett Oliver Butler

## General Intro
This repository contains the scripts, data, and figures used in my final project for the class Bioinfinv2019. Each analysis contains its own directory, with corresponding directories for DATA, SCRIPTS, and FIGURES associated with each analysis. Each of the three analyses are independent of each other and can be run in any order.

## Data Used
Data for this project was taken from the [zenodo](https://zenodo.org/record/885534#.XIbuWVNKgWo) respository corresponding to the publication titled **Population genomic data reveal extreme geographic subdivision and novel conservation actions for the declining foothill yellow- legged frog** ([McCartney-Melstad et al. 2018](https://www.nature.com/articles/s41437-018-0097-7.pdf?origin=ppub)). In this publication, the authors sampled 93 individuals of the foothill yellow legged frog, *Rana boylii*, from 50 localities in California and Oregon to explore population genetics and phylogeographic patterns. The authors exracted genomic data using the 3RAD protocal, a variant of double-digest RAD-Seq, and filtered the data using the **pyRAD** pipeline. Three files are provided in the zenodo repository and will be used for the following specified analysis: **1)** A VCF file containing a maximum of 80% missing data and selecting a single biallelic SNP from each RAD locus (**80missing.vcf**) was used for the following Admixture analyses; **2)** A VCF file containting 50% missing data (**50missing.vcf**) was used for the PCA analyses; and **3)** a phylip file with a maximum of 50% missing data (**50missing.phy**) was used for the RAxML analysis. Scripts for these analyses were not included in the supplementary material of the original publication.

## Analyses Run
### Admixture Plots
The program [Admixture] (http://software.genetics.ucla.edu/admixture/index.html) v.1.3 (Alexander et al. 2009) is used for identifying and visualizing distinct populations within a species or group of closely related species. The ideal population size (k) is assigned a posteriori based on maximum likelihood estimations of individual ancestries.

The **admixture.script** script (/Admixture/SCRIPTS) converts the vcf file to plink file using **vcftools**, then converts ped to bed files use **plink**, then runs the admixture analysis on K = 1–9, writing an output file (Admixture.CVerrors.txt) that will help determine the optimal K value. Additionally, the R script **admixture\_panel\_plot.R** plots all 9 barplots to a pdf file for visualization and is run from the admixture script.

>*Note:* ***Admixture*** *and* ***plink*** *need to be downloaded and executables copied into Admixture/DATA directory prior to running the scripts. Additionally, the* ***vcftools biocontainer*** *is used from* ***docker*** *to run part of the script. An absolute route for the vcftools biocontainer command is needed.*

### PCA plots
Principal Component Analyses (PCAs) are another tool to detect genetic variation within a species/population. The R script **PCA\_script.R** (PCA/SCRIPTS) runs the [SNPRelate] (http://www.bioconductor.org/packages/release/bioc/html/SNPRelate.html) v1.16 package (Zheng et al. 2012) to calcuate principal components of the different clades, which are then graphed as a panel figure and saved to a pdf using **R (base)** (R Core Team 2018).

>*Note: The R package* ***SNPRelate*** *must be installed prior to running this script. There are installation commands at the beginning of the script if needed, just remove the '#s.'*

### Phylogenetic Tree Reconstruction
Relationships among individuals and clades can be determined by estimating a phylogenetic tree. The program [RAxML](https://github.com/stamatak/standard-RAxML) v8.2.12 (Stamatiakis 2014) was used to contruct a phylogenetic tree using Maximum Likelihood methods, with non-parametric bootstrapping to determine nodal support values.

The original data from the paper (50missing.phy) contains a concatenated dataset of 2,435,662 basepairs from 93 individuals.
Running a RAxML analysis on this full dataset would take days/weeks to on a cluster, and therefore, for the purpose of this project, I decided to run a RAxML analysis on a reduced dataset (50missing\_reduced.phy), including 11 of the 93 individuals (all 2,435,662 basepairs), representing the major lineages found in the original article. In addition, since no meta-data regarding locality was give, I make a mini meta-data table (Phylogenetics/DATA/**reduced_taxa.txt**) for the 11 individuals in the reduced dataset for visualization based off of the orignal publication.

The script **RAxML.script** (/Phylogenetics/SCRIPTS) includes code for reducing the dataset, running RAxML, and visualizing the tree using the R script **Tree\_visualization.R**, which uses the R packages **ape** and **phytools**.

>*Note:* ***RAxML*** *should be downloaded and the executable pasted into the Phylogenetics/DATA directory prior to running the scripts.* 