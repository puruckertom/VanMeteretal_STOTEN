# step by step code for 6 panel box plot
#read in files
ATZBCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/ATZBCF.csv")
ATZ_BCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/ATZ_BCF.csv")
DBCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/DBCF.csv")
METBCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/METBCF.csv")
PZBCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/PZBCF.csv")
MABCF <- read.csv("~/Desktop/Summer 2015 Research/Summer:Fall 2016/MABCF.csv")

#specify order of x-axis treatments in boxplot
ATZBCF$Treatment = factor(ATZBCF$Treatment, c("ATZ","ATZME","ATZD","ATZMED"))
ATZ_BCF$Treatment = factor(ATZ_BCF$Treatment, c("ATZ","ATZMA","ATZPZ","ATZMAPZ"))
MABCF$Treatment = factor(MABCF$Treatment, c("MA","ATZMA","MAPZ","ATZMAPZ"))
PZBCF$Treatment = factor(PZBCF$Treatment, c("PZ","ATZPZ","MAPZ","ATZMAPZ"))
METBCF$Treatment = factor(METBCF$Treatment, c("ME","ATZME","MED","ATZMED"))
DBCF$Treatment = factor(DBCF$Treatment, c("D","ATZD","MED","ATZMED"))

#create a 2 column 3 row boxplot
par(mfrow=c(3,2), mar= c(4,4,2,2), oma = c(1.0,1.0,1.0,1.0))

#determine which order you want boxplots to appear in, starting at the top left, then going top right, then moving the row 2 left, right and then row 3 left, right
#perform a boxplot function in the order you determined above and insert a legend/label - make sure you specify where you want the label to appear
#"main" - gives the boxplot a title; "bty="n"
boxplot(ATZBCF ~ Treatment, ylab = "Atrazine BCF", cex.axis=1.1, cex.lab=1.3, cex.main=1.5, ylim=c(0,3.0), main = "Herbicides", data = ATZBCF)
legend ("topleft", legend = "A", bty="n")
boxplot(ATZ_BCF ~ Treatment, ylab = "Atrazine BCF", cex.axis=1.1, cex.lab=1.3, cex.main=1.5, ylim=c(0,3.0), main = "Mixed Pesticides", data = ATZ_BCF)
legend ("topleft", legend = "D", bty="n")
boxplot(METBCF ~ Treatment, ylab = "Metolachlor BCF", cex.axis=1.1, cex.lab=1.3, data = METBCF)
legend ("topleft", legend = "B", bty="n")
boxplot(MABCF ~ Treatment, ylab = "Malathion BCF", cex.axis=1.1, cex.lab=1.3,ylim=c(0,0.4), data = MABCF)
legend ("topleft", legend = "E", bty="n")
boxplot(DBCF ~ Treatment, xlab = "Pesticide Treatment", ylab = "2,4-D BCF", cex.axis=1.1, cex.lab=1.3, data = DBCF)
legend ("topleft", legend = "C", bty="n")
boxplot(PZBCF ~ Treatment, xlab = "Pesticide Treatment", ylab = "Propiconazole BCF", cex.axis=1.1, cex.lab=1.3, data = PZBCF)
legend ("topleft", legend = "F", bty="n")

