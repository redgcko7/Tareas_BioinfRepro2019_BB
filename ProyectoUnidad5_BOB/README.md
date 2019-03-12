# README

______________________________
______________________________
Final Project — Brett Oliver Butler

## General Intro
This repository contains the scripts and data used in my final project for the class Bioinfinv2019. Each analysis contains its own directory, with corresponding directories for Data, Scripts, and Figures associated with each analysis. Each of the three analyses are independent of each other and can be run in any order.

## Data Used
Data for this project was taken from the [zenodo](https://zenodo.org/record/885534#.XIbuWVNKgWo) respository corresponding to the publication [McCartney-Melstad et al. (2018)](https://www.nature.com/articles/s41437-018-0097-7.pdf?origin=ppub). In this publication, the authors sampled 93 individuals of the foothill yellow legged frog, *Rana boylii*, from 50 localities in California and Oregon to explore population genetics and phylogeographic patterns. Genomic data was extracted using 3RAD protocal, a variant of double-digest RAD-Seq, and filtered using the **pyRAD** pipeline. The VCF file containing a maximum of 80% missing data and selecting a single biallelic SNP from each RAD locus was used for the following analyses. Scripts for these analyses were not included in the supplementary material of the original publication.

## Analyses Run
### Admixture Plots
The program Admixture is useful for identifying and visualizing distinct populations within a species or group of closely related species. The ideal population size (k) is assigned a posteriori based on maximum likelihood estimations of individual ancestries.

### PCA plots
Principal Component Analyses (PCAs) are another tool to detect genetic variation within a species/population. I will use the program SNPRelate to calcuate principal components of the different clades and will graph them in R.

### Phylogenetic Tree Reconstruction
Relationships among individuals and clades can be determined by estimating a phylogenetic tree. I will use the program RAxML to contruct a phylogenetic tree using Maximum Likelihood methods, with non-parametric bootstrapping to determine nodal support values. Trees will be edited using the R package ggplot. 