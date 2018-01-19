library(edgeR)
library(ggplot2)
library(GGally)
library(EDASeq)
library(utils)
library(data.table)
library(bigPint)

thisPath <- getwd()

data(soybean_ir)
soybean_ir[,-1] <- log(soybean_ir[,-1]+1)

plotPermutations(soybean_ir, nPerm = 10, topThresh = 50, outDir = getwd())
