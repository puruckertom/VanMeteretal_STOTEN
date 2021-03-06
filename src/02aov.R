library(FrF2)
## create resolution III design
plan <- FrF2(8,nfactors=3, factor.names=c("atz","met","d"),replications=6)
## add some resonse data
y <- c(2+desnum(plan)%*%c(2,3,0) +
         1.5*apply(desnum(plan)[,c(1,2)],1,"prod") + rnorm(8))
## the "c()" makes y into a vector rather than a 1-column matrix
plan <- add.response(plan, y)
DanielPlot(lm(y~(.)^2,plan), alpha=0.2, half=TRUE)
## alias information
design.info(plan)
## full foldover for dealiasing all main effects
plan <- fold.design(plan)
design.info(plan)
## further data, shifted by -2
y <- c(y, desnum(plan)[9:16,1:5]%*%c(2,3,0,0,0) +
         1.5*apply(desnum(plan)[9:16,c(1,2)],1,"prod") + rnorm(8))
plan <- add.response(plan, y, replace=TRUE)
linmod <- lm(y~(.)^2,plan)
DanielPlot(linmod, alpha=0.2, half=TRUE)
MEPlot(linmod)
IAPlot(linmod)




#as it comes, not properly nesting covariates
#View(herbs)
summary(herbs)

atzfrog <- aov(ATZT ~ Group, data=herbs)
summary (atzfrog)

atzfrog <- aov(ATZT ~ Group + AppRate, data=herbs)
summary (atzfrog)


class(herbs$Group)

#make it tall and skinny
## Wide to long

l <- reshape(herbs, 
             varying = c("read", "write", "math", "science", "socst"), 
             v.names = "score",
             timevar = "subj", 
             times = c("read", "write", "math", "science", "socst"), 
             new.row.names = 1:1000,
             direction = "long")


###############
#not yet updated below
ATZFROG <- read.csv("~/Desktop/Summer 2015 Research/ATZFROG.csv")
View(ATZFROG)
atzgroups <- aov(ATZT ~ Pestnumber, data=ATZFROG)
summary(atzgroups)
logATZT <- log10(ATZT)
logATZT <- log10(ATZT, data=ATZFROG)
atzgroups <- aov(log(ATZT) ~ Pestnumber, data=ATZFROG)
summary(atzgroups)
logATZT <- log(ATZT, data=ATZFROG)
atzfrog <- aov(log(ATZT) ~ Rtreatment, data=ATZFROG)
summary(atzfrog)
ALLFROG <- read.csv("~/Desktop/Summer 2015 Research/ALLFROG.csv")
View(ALLFROG)

## want to implement a factorial anova

#aov
atzfrog <- aov(ATZT ~ Treatment, data=ALLFROG)
summary(atzfrog)
TukeyHSD(ATZT, Treatment, ordered = FALSE, conf.level = 0.95)
TukeyHSD(ATZT, Treatment, ordered = FALSE, conf.level = 0.95, data=ALLFROG)
TukeyHSD(atzfrog)
ALLFROG <- read.csv("~/Desktop/Summer 2015 Research/ALLFROG.csv")
View(ALLFROG)
atzfrog <- aov(ATZT ~ Rtreatment, data=ALLFROG)
summary(atzfrog)
TukeyHSD(atzfrog)
ALLFROG <- read.csv("~/Desktop/Summer 2015 Research/ALLFROG.csv")
View(ALLFROG)
atzfrog <- aov(ATZT ~ Rtreatment, data=ALLFROG)
summary(atzfrog)
metfrog <- aov(METT ~ Rtreatment, data=ALLFROG)
summary(metfrog)
Tukey(metfrog)
TukeyHSD(metfrog)
mean(metfrog)
summary(metfrog)
mean(metfrog)
mean(metfrog, data=ALLFROG)
summary(metfrog)
summary(METT)
summary(METT, data=ALLFROG)
mean(ALLFROG$METT)
ALLFROG
Table1 <- aggregate(METT, list(Rtreatment), Fun=mean)
Table1 <- aggregate(METT, list(Rtreatment), Fun=mean, data=ALLFROG)
Table1 <- aggregate(ALLFROG$METT, list(Rtreatment), Fun=mean)
Table1 <- aggregate(ALLFROG$METT, list(Rtreatment), Fun=mean))
mean.mett <- mean(METT ~ Rtreatment, data=AllFROG)
mean(metfrog)
propfrog <- aov(PROPT ~ Rtreatment, data=ALLFROG)
summary(propfrog)
TukeyHSD(propfrog)
dfrog <- aov(DT ~ Rtreatment, data=ALLFROG)
summary(dfrog)
TukeyHSD(dfrog)
mafrog <- aov(MAT ~ Rtreatment, data=ALLFROG)
summary(MAT)
summary(mafrog)
pestmanova <- manova(cbind(ATZT, MAT, PROPT, METT, DT) ~ Rtreatment, data=ALLFROG)
pestmanova <- manova(cbind(ATZT, MAT, PROPT, METT, DT) ~ as.factor(Rtreatment), data=ALLFROG)
pest<-cbind(ATZT, MAT, PROPT, METT, DT)
pest<-cbind(ATZT, MAT, PROPT, METT, DT, data=ALLFROG)
pest <- cbind(ALLFROG$ATZT, ALLFROG$MAT, ALLFROG$PROPT, ALLFROG$METT, ALLFROG$DT)
manova <- manova(pest ~ Rtreatment)
manova <- manova(pest ~ ALLFROG$Rtreatment)
manova <- manova(pest ~ ALLFROG$Rtreatment)
boxplot(ATZT ~ Rtreatment, data=ALLFROG)
class(ATZT) <- c("numeric", "character")
ATZFROG <- read.csv("~/Desktop/Summer 2015 Research/ATZFROG.csv")
View(ATZFROG)
boxplot(ATZT ~ Rtreatment, data=ATZFROG)
boxplot(ATZFROG, las = 2)
boxplot(ATZT, las=2)
boxplot(ALLFROG$ATZT, las=2)
boxplot(ATZT ~ Rtreatment, data=ATZFROG, las=2)
boxplot(ATZT ~ Rtreatment, data=ATZFROG, las=2, ylab = Tissue Concentration)
boxplot(ATZT ~ Rtreatment, data=ATZFROG, las=2, ylab = "Tissue Concentration")
METFROG <- read.csv("~/Desktop/Summer 2015 Research/METFROG.csv")
View(METFROG)
boxplot(METT ~ Rtreatment, data=ATZFROG, las=2, ylab = "Tissue Concentration")
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration")
boxplot(METT ~ Rtreatment(MET, ATZMET, DMET, ATZMETD), data=ALLFROG, las=2, ylab = "Tissue Concentration")
boxplot(METT ~ subset (Rtreatment = MET, ATZMET, DMET, ATZMETD), data=ALLFROG, las=2, ylab = "Tissue Concentration")
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = supp == "MET", "ATZMET", "DMET", "ATZMETD")
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = Rtreatment("MET", "ATZMET", "DMET", "ATZMETD"))
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = Rtreatment("MET", "ATZMET", "DMET", "ATZMETD"))
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = Rtreatment %in% Rtreatment("MET", "ATZMET", "DMET", "ATZMETD"))
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = c %in% c("MET", "ATZMET", "DMET", "ATZMETD"))
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = c %in% c("MET", "ATZMET", "DMET", "ATZMETD"))
atz = subset(ALLFROG, !is.na(ATZT))
boxplot(METT ~ Rtreatment, data=ALLFROG, las=2, ylab = "Tissue Concentration", subset = c %in% c("MET", "ATZMET", "DMET", "ATZMETD"))
summary(atz)
View(atz)
boxplot(METT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
drops <- c("MAT", "PROPT", "METT", "DT")
atz <- atz[ , !(names(atz) %in% drops)]
View(atz)
boxplot(METT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
boxplot(ATZT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
boxplot(ATZT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
atz = subset(atz, Rtreatment %in% c("ATZ", "ATZD", "ATZMET", "ATZMAL", "ATZPROP", "ATZMETD", "ATZMALPROP"))
view(atz)
View(atz)
boxplot(ATZT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
boxplot(ATZT ~ Rtreatment, data=atz, las=2, ylab = "Tissue Concentration")
ATZFROG <- read.csv("~/Desktop/Summer 2015 Research/ATZFROG.csv")
View(ATZFROG)
boxplot(ATZT ~ Rtreatment, data=ATZFROG, las=2, ylab = "Tissue Concentration")
ATZFROG <- read.csv("~/Desktop/Summer 2015 Research/ATZFROG.csv")
View(ATZFROG)
boxplot(ATZT ~ Rtreatment, data=ATZFROG, las=2, ylab = "Tissue Concentration")
DFROG <- read.csv("~/Desktop/Summer 2015 Research/DFROG.csv", header=FALSE)
View(DFROG)
DFROG <- read.csv("~/Desktop/Summer 2015 Research/DFROG.csv")
View(DFROG)
boxplot(D2.T.DT ~ Rtreatment, data=DFROG, las=2, ylab = "Tissue Concentration")
boxplot(X2.4.DT ~ Rtreatment, data=DFROG, las=2, ylab = "Tissue Concentration")
METFROG <- read.csv("~/Desktop/Summer 2015 Research/METFROG.csv")
View(METFROG)
boxplot(MET) ~ Rtreatment, data=METFROG, las=2, ylab = "Tissue Concentration")
boxplot(MET ~ Rtreatment, data=METFROG, las=2, ylab = "Tissue Concentration")
MALFROG <- read.csv("~/Desktop/Summer 2015 Research/MALFROG.csv")
View(MALFROG)
boxplot(MALT ~ Rtreatment, data=MALFROG, las=2, ylab = "Tissue Concentration")
PROPFROG <- read.csv("~/Desktop/Summer 2015 Research/PROPFROG.csv")
View(PROPFROG)
boxplot(PROPT ~ Rtreatment, data=PROPFROG, las=2, ylab = "Tissue Concentration")
SUMHERB <- read.csv("~/Desktop/Summer 2015 Research/SUMHERB.csv")
View(SUMHERB)
herb <- aov(TOTTHERB ~ ATZ, MET, D, ATZ*MET, ATZ*D, MET*D, ATZ*MET*D, data=SUMHERB)
SUMHERB <- read.csv("~/Desktop/Summer 2015 Research/SUMHERB.csv")
View(SUMHERB)
herb <- aov(TOTTHERB ~ ATZ, MET, D, ATZ*MET, ATZ*D, MET*D, ATZ*MET*D, data=SUMHERB)
SUMHERB <- read.csv("~/Desktop/Summer 2015 Research/SUMHERB.csv")
View(SUMHERB)
herb <- aov(TOTTHERB ~ ATZ, MET, D, ATZ*MET, ATZ*D, MET*D, ATZ*MET*D, data=SUMHERB)
herb <- aov (TOTTHERB ~ ATZ, D, ATZ*D, data=SUMHERB)
SUMHERB1 <- read.csv("~/Desktop/Summer 2015 Research/SUMHERB1.csv")
View(SUMHERB1)
herb <- aov (TOTTHERB ~ ATZ, D, ATZ*D, data=SUMHERB)
herb <- aov (TOTTHERB ~ ATZ, D, ATZ*D, data=SUMHERB1)
herb <- aov (TOTTHERB ~ ATZ, D, ATZ*D, data=SUMHERB)
herb <- aov (TOTTHERB ~ Treatment, data=SUMHERB1)
summary(herb)
TukeyHSD(herb)
multiple <- aov(TOTTHERB ~ ATZ, data=ALLFROG)
multiple <- aov(TOTTHERB ~ ATZ, data=SUMHERB1)
summary(multiple)
multiple1 <- aov(TOTTHERB ~ MET, data=SUMHERB1)
summary(multiple1)
this <- aov(TOTTHERB ~ ATZ + MET + D, data=SUMHERB1)
summary(this)
this <- aov(TOTTHERB ~ ATZ + MET + D + ATZ*MET, data=SUMHERB1)
this <- aov(TOTTHERB ~ ATZ + MET + D + ATZ*MET + ATZ*D + MET*ATZ + ATZ*MET*D, data=SUMHERB1)
summary(this)
TukeyHSD(this)
this <- aov(TOTTHERB ~ ATZ*MET + ATZ*D + MET*ATZ + ATZ*MET*D, data=SUMHERB1)
summary(this)
save.image("~/Desktop/Summer 2015 Research/Summer 2015 Data Analysis.RData")
AMAP.R <- read.csv("~/Desktop/Summer 2015 Research/AMAP R.csv")
View(AMAP.R)
ATZBB <- aov(TreatID ~ ATZBB, data=ATZBB)
ATZBB <-aov(ATZBB ~ TreatID, data=AMAP.R)
new <- aov(ATZBB ~ TreatID, data=AMAP.R)
new <- aov(TreatID~ATZBB, data=AMAP.r)
new <- aov(TreatID~ATZBB, data=AMAP.R)
anova <- aov(ATZBB ~ TreatID, data=AMAP.R)
summary(anova)
ATZ1 <- read.csv("~/Desktop/Summer 2015 Research/ATZ1.csv")
View(ATZ1)
anovaATZ <- aov(ATZBB ~ TreatID, data=ATZ1)
summary(anovaATZ)
anovaATZT <-(ATZT ~ TreatID, data=ATZ1)
anovaATZ1 <- (ATZT ~ TreatID, data=ATZ1)
anova <- (ATZT ~ TreatID, data = ATZ1)
anovaATZz <- aov(ATZT ~ TreatID, data=ATZ1)
summary(anovaATZz)
TukeyHSD(anovaATZz)
anovaATZs <- aov(ATZS ~ TreatID, data=ATZ1)
summary(anovaATZs)