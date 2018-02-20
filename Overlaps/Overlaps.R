library(VennDiagram)
draw.triple.venn(65, 75, 85, 35, 15, 25, 5, c("First", "Second", "Third"))

############# Venn diagrams for Galbraith ############# 
####################################################### 

colList = scales::hue_pal()(4)

gDESeq = readRDS("../VirusHoneyBee/DESeq2/Method1/dataMetrics.Rds")
gDESeq = gDESeq[["C_T"]]
gD = gDESeq[which(gDESeq$padj <0.05),]$ID

gEdgeR = readRDS("../VirusHoneyBee/EdgeR/edgeR/dataMetrics.Rds")
gEdgeR = gEdgeR[["C_T"]]
gE = gEdgeR[which(gEdgeR$FDR <0.05),]$ID

gEdgeRB = readRDS("../VirusHoneyBee/EdgeR/edgeR-btwnLane/dataMetrics.Rds")
gEdgeRB = gEdgeRB[["C_T"]]
gEB = gEdgeRB[which(gEdgeRB$FDR <0.05),]$ID

gLimma = readRDS("../VirusHoneyBee/LimmaVoom/dataMetrics.Rds")
gLimma = gLimma[["C_T"]]
gL = gLimma[which(gLimma$adj.P.Val <0.05),]$ID

intgD = length(gD)
intgE = length(gE)
intgEB = length(gEB)
intgL = length(gL)

intgDE = length(intersect(gD, gE))
intgDEB = length(intersect(gD, gEB))
intgDL = length(intersect(gD, gL))
intgEEB = length(intersect(gE, gEB))
intgEL = length(intersect(gE, gL))
intgEBL = length(intersect(gEB, gL))
intgDEEB = length(intersect(intersect(gD, gE), gEB))
intgDEL = length(intersect(intersect(gD, gE), gL))
intgDEBL = length(intersect(intersect(gD, gEB), gL))
intgEEBL = length(intersect(intersect(gE, gEB), gL))
intgDEEBL = length(intersect(intersect(gE, gEB), intersect(gD, gL)))

fileName = paste(getwd(), "/Venn_Galbraith.jpg", sep="")
jpeg(fileName)
draw.quad.venn(add.title = "Test", area1=intgD, area2=intgE, area3=intgEB, area4=intgL, n12=intgDE, n13=intgDEB, n14=intgDL, n23=intgEEB, n24=intgEL, n34=intgEBL, n123=intgDEEB, n124=intgDEL, n134=intgDEBL, n234=intgEEBL, n1234=intgDEEBL, c("g-DESeq2", "g-EdgeR", "g-EdgeR-btwn", "g-Limma"), cat.col = colList)
invisible(dev.off())

############### Venn diagrams for Toth ############## 
##################################################### 

tDESeq = readRDS("../NC_NR_VC_VR/DESeq2/Method2/dataMetrics.Rds")
tDESeq = tDESeq[["N_V"]]
tD = tDESeq[which(tDESeq$padj <0.05),]$ID

tEdgeR = readRDS("../NC_NR_VC_VR/EdgeR/edgeR-Virus/dataMetrics.Rds")
tEdgeR = tEdgeR[["N_V"]]
tE = tEdgeR[which(tEdgeR$FDR <0.05),]$ID

tEdgeRB = readRDS("../NC_NR_VC_VR/EdgeR/edgeR-btwnLane-Virus/dataMetrics.Rds")
tEdgeRB = tEdgeRB[["N_V"]]
tEB = tEdgeRB[which(tEdgeRB$FDR <0.05),]$ID

tLimma = readRDS("../NC_NR_VC_VR/LimmaVoom/dataMetrics.Rds")
tLimma = tLimma[["N_V"]]
tL = tLimma[which(tLimma$adj.P.Val <0.05),]$ID

inttD = length(tD)
inttE = length(tE)
inttEB = length(tEB)
inttL = length(tL)

inttDE = length(intersect(tD, tE))
inttDEB = length(intersect(tD, tEB))
inttDL = length(intersect(tD, tL))
inttEEB = length(intersect(tE, tEB))
inttEL = length(intersect(tE, tL))
inttEBL = length(intersect(tEB, tL))
inttDEEB = length(intersect(intersect(tD, tE), tEB))
inttDEL = length(intersect(intersect(tD, tE), tL))
inttDEBL = length(intersect(intersect(tD, tEB), tL))
inttEEBL = length(intersect(intersect(tE, tEB), tL))
inttDEEBL = length(intersect(intersect(tE, tEB), intersect(tD, tL)))

fileName = paste(getwd(), "/Venn_Toth.jpg", sep="")
jpeg(fileName)
draw.quad.venn(area1=inttD, area2=inttE, area3=inttEB, area4=inttL, n12=inttDE, n13=inttDEB, n14=inttDL, n23=inttEEB, n24=inttEL, n34=inttEBL, n123=inttDEEB, n124=inttDEL, n134=inttDEBL, n234=inttEEBL, n1234=inttDEEBL, c("t-DESeq2", "t-EdgeR", "t-EdgeR-bwn", "t-Limma"), cat.col = colList)
invisible(dev.off())

fileName = paste(getwd(), "/Venn_Toth_NoLimma.jpg", sep="")
jpeg(fileName)
draw.triple.venn(area1=inttD, area2=inttE, area3=inttEB, n12=inttDE, n13=inttDEB, n23=inttEEB, n123=inttDEEB, c("t-DESeq2", "t-EdgeR", "t-EdgeR-bwn"), cat.col = colList[1:3])
invisible(dev.off())

############# Venn diagrams for Galbraith versus Toth per Method ############# 
##############################################################################

gD2 = sapply(gD, function(x) strsplit(strsplit(x, "[|]")[[1]][3], "[-]")[[1]][1])
fileName = paste(getwd(), "/Venn_DESeq2.jpg", sep="")
jpeg(fileName)
draw.pairwise.venn(area1=intgD, area2=inttD, cross.area = length(intersect(gD2, tD)), category=c("g-DESeq2", "t-DESeq2"))
invisible(dev.off())

gE2 = sapply(gE, function(x) strsplit(strsplit(x, "[|]")[[1]][3], "[-]")[[1]][1])
fileName = paste(getwd(), "/Venn_EdgeR.jpg", sep="")
jpeg(fileName)
draw.pairwise.venn(area1=intgE, area2=inttE, cross.area = length(intersect(gE2, tE)), category=c("g-EdgeR", "t-EdgeR"))
invisible(dev.off())

gEB2 = sapply(gEB, function(x) strsplit(strsplit(x, "[|]")[[1]][3], "[-]")[[1]][1])
fileName = paste(getwd(), "/Venn_EdgeR-btwn.jpg", sep="")
jpeg(fileName)
draw.pairwise.venn(area1=intgEB, area2=inttEB, cross.area = length(intersect(gEB2, tEB)), category=c("g-EdgeR-btwn", "t-EdgeR-btwn"))
invisible(dev.off())
