library(DESeq2)

dds <- makeExampleDESeqDataSet(n=100,m=18)
dds$genotype <- factor(rep(rep(c("I","II","III"),each=3),2))
dds$genotype <- factor(rep(rep(c("I","II","III"),each=3),2))
design(dds) <- ~ genotype + condition + genotype:condition
dds <- DESeq(dds)
resultsNames(dds)

# 2*2 Linear model explanation (https://support.bioconductor.org/p/65708/#65709)
group <- factor(rep(rep(c("X","Y"),each=3),2))
condition <- factor(rep(c("A","B"),each=6))
model.matrix(~ group + condition + group*condition)

# The first term is the intercept.
# The second term is the group Y vs X effect specific to condition A.
# The third term is the condition B vs A effect for group X.
# The fourth term is the interaction term. This is the additional effect of B vs A in group Y. Or equivalently, it is the additional effect of Y vs X in condition B.


