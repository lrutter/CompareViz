library(edgeR)
library(ggplot2)
library(GGally)
library(EDASeq)
library(utils)
library(data.table)

thisPath <- getwd()

beeCounts <- readRDS("../../data/data.Rds")
beeCounts <- cbind(ID=rownames(beeCounts), beeCounts)
beeCounts$ID <- as.character(beeCounts$ID)

bcS <- beeCounts[,-1] - rowMeans(beeCounts[,-1])
bcStandardized = cbind(beeCounts[,1], bcS)
bcStandardized[,1] = as.character(bcStandardized[,1])
colnames(bcStandardized)[1] <- "ID"

plotPermutations(bcStandardized, nPerm = 20, topThresh = 50, outDir = getwd())
