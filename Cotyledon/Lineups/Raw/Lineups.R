library(edgeR)
library(ggplot2)
library(GGally)
library(EDASeq)
library(utils)
library(data.table)
library(bigPint)

thisPath <- getwd()

data(soybean_cn)

plotPermutations(soybean_cn, nPerm = 10, topThresh = 50, outDir = getwd())
