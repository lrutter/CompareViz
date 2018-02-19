library(VennDiagram)
draw.triple.venn(65, 75, 85, 35, 15, 25, 5, c("First", "Second", "Third"))

############# Venn diagrams for Goliath ############# 
##################################################### 

gDESeq = readRDS("VirusHoneyBee/DESeq2/Method1/dataMetrics.Rds")
gDESeq = gDESeq[["C_T"]]
gD = gDESeq[which(gDESeq$padj <0.05),]$ID

gEdgeR = readRDS("VirusHoneyBee/EdgeR/edgeR/dataMetrics.Rds")
gEdgeR = gEdgeR[["C_T"]]
gE = gEdgeR[which(gEdgeR$FDR <0.05),]$ID

gEdgeRB = readRDS("VirusHoneyBee/EdgeR/edgeR-btwnLane/dataMetrics.Rds")
gEdgeRB = gEdgeRB[["C_T"]]
gEB = gEdgeRB[which(gEdgeRB$FDR <0.05),]$ID

gLimma = readRDS("VirusHoneyBee/LimmaVoom/dataMetrics.Rds")
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

draw.quad.venn(area1=intgD, area2=intgE, area3=intgEB, area4=intgL, n12=intgDE, n13=intgDEB, n14=intgDL, n23=intgEEB, n24=intgEL, n34=intgEBL, n123=intgDEEB, n124=intgDEL, n134=intgDEBL, n234=intEEBL, n1234=intDEEBL, c("gD", "gE", "gEB", "gL"))

############### Venn diagrams for Toth ############## 
##################################################### 

tDESeq = readRDS("NC_NR_VC_VR/DESeq2/Method2/dataMetrics.Rds")
tDESeq = tDESeq[["N_V"]]
tD = tDESeq[which(tDESeq$padj <0.05),]$ID

tEdgeR = readRDS("NC_NR_VC_VR/EdgeR/edgeR-Virus/dataMetrics.Rds")
tEdgeR = tEdgeR[["N_V"]]
tE = tEdgeR[which(tEdgeR$FDR <0.05),]$ID

tEdgeRB = readRDS("NC_NR_VC_VR/EdgeR/edgeR-btwnLane-Virus/dataMetrics.Rds")
tEdgeRB = tEdgeRB[["N_V"]]
tEB = tEdgeRB[which(tEdgeRB$FDR <0.05),]$ID

tLimma = readRDS("NC_NR_VC_VR/LimmaVoom/dataMetrics.Rds")
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

draw.quad.venn(area1=inttD, area2=inttE, area3=inttEB, area4=inttL, n12=inttDE, n13=inttDEB, n14=inttDL, n23=inttEEB, n24=inttEL, n34=inttEBL, n123=inttDEEB, n124=inttDEL, n134=inttDEBL, n234=inttEEBL, n1234=inttDEEBL, c("tD", "tE", "tEB", "tL"))



