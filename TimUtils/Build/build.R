setwd("/home/tim/git/TimUtils/TimUtils")

library(devtools)
load_all()
document()

versionIncrement(minor=TRUE,README=FALSE)

getwd()
#install.packages("devtools")
#devtools::install_github("devtools")

