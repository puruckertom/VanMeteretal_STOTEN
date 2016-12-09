#Install and load supporting libraries.
print(Sys.info()[4])

R.Version()$version.string
library(rmarkdown, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(knitr, quietly = TRUE, warn.conflicts = FALSE)
library(ggplot2)
library(reshape2)
library(MASS)
print("list of loaded packages: ")
print((.packages()))

#google doc for sharing results with Robin
#https://docs.google.com/document/d/1bone3x8n6oWeySelsXaKIBnfHbaZdKDgipFpHuLje5Y/edit

#explanation of lm output
#http://blog.yhat.com/posts/r-lm-summary.html

#Determine path directory based on the user machine######
#tom epa windows
if(Sys.info()[4]=="DZ2626UTPURUCKE"){
  rvm_root<-path.expand("k:/git/vanmeter_herbicides/")
}
print(paste("Root directory location: ", rvm_root, sep=""))

rvm_csv_in <- paste(rvm_root, "csv_in/", sep="")

#check to see if directories are accessible
boo = file.exists(paste(rvm_csv_in,"Herbs.csv",sep=""))
print(paste("check to see if R can access files OK: ", boo))

#read data, original version
#herbs <- read.csv(paste(rvm_csv_in,"Herbs.csv",sep=""))
#View(herbs)

#cleaned up data set, manually reshaped
herbs2 <- read.csv(paste(rvm_csv_in,"Herbs2.csv",sep=""))
#View(herbs2)

#cleaned up data set, manually reshaped
hif2 <- read.csv(paste(rvm_csv_in,"hif2.csv",sep=""))
#View(herbs2)

#factors as appropriate
summary(herbs2)
class(herbs2$Group)
class(herbs2$ATZ)
herbs2$ATZ <- factor(herbs2$ATZ)
class(herbs2$ATZ)
class(herbs2$D)
herbs2$D <- factor(herbs2$D)
class(herbs2$D)
class(herbs2$ME)
herbs2$ME <- factor(herbs2$ME)
class(herbs2$ME)

class(herbs2$Pesticide)
levels(herbs2$Pesticide)
atzt <- which(herbs2$Pesticide=="ATZT" & herbs2$ATZ==1)
dt <- which(herbs2$Pesticide=="DT" & herbs2$D==1)
met <- which(herbs2$Pesticide=="MET" & herbs2$ME==1)
soil.met <- which(herbs2$Pesticide=="MES" & herbs2$ME==1)
soil.dt <- which(herbs2$Pesticide=="DS" & herbs2$D==1)
soil.atzt <- which(herbs2$Pesticide=="ATZS" & herbs2$ATZ==1)
bcf.met <- which(herbs2$Pesticide=="METBCF" & herbs2$ME==1)
bcf.dt <- which(herbs2$Pesticide=="DBCF" & herbs2$D==1)
bcf.atzt <- which(herbs2$Pesticide=="ATZBCF" & herbs2$ATZ==1)


herbs.atzt <- herbs2[atzt,]
dim(herbs.atzt)
herbs.dt <- herbs2[dt,]
dim(herbs.dt)
herbs.met <- herbs2[met,]
dim(herbs.met)
herbs.soil.met <- herbs2[soil.met,]
dim(herbs.soil.met)
herbs.soil.dt <- herbs2[soil.dt,]
dim(herbs.soil.dt)
herbs.soil.atzt <- herbs2[soil.atzt,]
dim(herbs.soil.atzt)
herbs.bcf.met <- herbs2[bcf.met,]
dim(herbs.bcf.met)
herbs.bcf.dt <- herbs2[bcf.dt,]
dim(herbs.bcf.dt)
herbs.bcf.atzt <- herbs2[bcf.atzt,]
dim(herbs.bcf.atzt)


#atrazine frog concs - categorical regression with and without interactions
summary(herbs.atzt)
#View(herbs.atzt)
herbs.atzt$Conc
lm.atzt <- lm(Conc ~ D + ME, data=herbs.atzt)
summary(lm.atzt)
lm.atzt2 <- lm(Conc ~ (D + ME)^2, data=herbs.atzt)
summary(lm.atzt2)
lm.atzt3 <- lm(Conc ~ D + ME + Weight, data=herbs.atzt)
summary(lm.atzt3)
#atrazine soil concs - categorical regression with and without interactions
lm.atzt4 <- lm(Conc ~ D + ME, data=herbs.soil.atzt)
summary(lm.atzt4)
lm.atzt5 <- lm(Conc ~ (D + ME)^2, data=herbs.soil.atzt)
summary(lm.atzt5)
#atrazine bcfs - categorical regression with and without interactions
lm.atzt6 <- lm(Conc ~ D + ME, data=herbs.bcf.atzt)
summary(lm.atzt6)
lm.atzt7 <- lm(Conc ~ (D + ME)^2, data=herbs.bcf.atzt)
summary(lm.atzt7)
step.atzt7 <- stepAIC(lm.atzt7, direction="both", trace=TRUE)
summary(step.atzt7)
step.atzt7
step.atzt7$anova

#2,4D frog concs - categorical regression with and without interactions
summary(herbs.dt)
#View(herbs.dt)
lm.dt <- lm(Conc ~ ATZ + ME, data=herbs.dt)
summary(lm.dt)
lm.dt2 <- lm(Conc ~ (ATZ + ME)^2, data=herbs.dt)
summary(lm.dt2)
lm.dt3 <- lm(Conc ~ ATZ + ME + Weight, data=herbs.dt)
summary(lm.dt3)
#2,4-D soil concs - categorical regression with and without interactions
lm.dt4 <- lm(Conc ~ ATZ + ME, data=herbs.soil.dt)
summary(lm.dt4)
lm.dt5 <- lm(Conc ~ (ATZ + ME)^2, data=herbs.soil.dt)
summary(lm.dt5)
#2,4-D bcfs - categorical regression with and without interactions
lm.dt6 <- lm(Conc ~ ATZ + ME, data=herbs.bcf.dt)
summary(lm.dt6)
lm.dt7 <- lm(Conc ~ (ATZ + ME)^2, data=herbs.bcf.dt)
summary(lm.dt7)
step.dt7 <- stepAIC(lm.dt7, direction="both", trace=TRUE)
step.dt7$anova

#metolachlor frog concs - categorical regression with and without interactions
summary(herbs.met)
lm.met <- lm(Conc ~ (ATZ + D), data=herbs.met)
summary(lm.met)
lm.met2 <- lm(Conc ~ (ATZ + D)^2, data=herbs.met)
summary(lm.met2)
lm.met3 <- lm(Conc ~ (ATZ + D + Weight), data=herbs.met)
summary(lm.met3)
#metolachlor soil concs - categorical regression with and without interactions
lm.met4 <- lm(Conc ~ ATZ + D, data=herbs.soil.met)
summary(lm.met4)
lm.met5 <- lm(Conc ~ (ATZ + D)^2, data=herbs.soil.met)
summary(lm.met5)
#2,4-D soil concs - categorical regression with and without interactions
lm.met6 <- lm(Conc ~ ATZ + D, data=herbs.bcf.met)
summary(lm.met6)
lm.met7 <- lm(Conc ~ (ATZ + D)^2, data=herbs.bcf.met)
summary(lm.met7)
step.met7 <- stepAIC(lm.met7, direction="both", trace=TRUE)
step.met7$anova

#log kows
#atrazine 2.4-2.7
#2,4-D 2.81
#s-metolachlor 3.24

#6 sets of boxplots for all 3 pesticides times 2 treatments





##hif start here
#factors as appropriate
summary(hif2)
class(hif2$Group)
class(hif2$ATZ)
hif2$ATZ <- factor(hif2$ATZ)
class(hif2$ATZ)
class(hif2$MA)
hif2$MA <- factor(hif2$MA)
class(hif2$MA)
class(hif2$PROP)
hif2$PROP <- factor(hif2$PROP)
class(hif2$PROP)

class(hif2$Pesticide)
levels(hif2$Pesticide)
atzt <- which(hif2$Pesticide=="ATZT" & hif2$ATZ==1)
length(atzt)
mat <- which(hif2$Pesticide=="MAT" & hif2$MA==1)
length(mat)
propt <- which(hif2$Pesticide=="PROPT" & hif2$PROP==1)
length(propt)
soil.prop <- which(hif2$Pesticide=="PROPS" & hif2$PROP==1)
length(soil.prop)
soil.ma <- which(hif2$Pesticide=="MAS" & hif2$MA==1)
length(soil.ma)
soil.atz <- which(hif2$Pesticide=="ATZS" & hif2$ATZ==1)
length(soil.atz)
bcf.prop <- which(hif2$Pesticide=="PROPBCF" & hif2$PROP==1)
length(bcf.prop)
bcf.ma <- which(hif2$Pesticide=="MABCF" & hif2$MA==1)
length(bcf.ma)
bcf.atz <- which(hif2$Pesticide=="ATZBCF" & hif2$ATZ==1)
length(bcf.atz)

hif.atzt <- hif2[atzt,]
dim(hif.atzt)
hif.mat <- hif2[mat,]
dim(hif.mat)
hif.propt <- hif2[propt,]
dim(hif.propt)
hif.soil.prop <- hif2[soil.prop,]
dim(hif.soil.prop)
hif.soil.ma <- hif2[soil.ma,]
dim(hif.soil.ma)
hif.soil.atz <- hif2[soil.atz,]
dim(hif.soil.atz)
hif.bcf.ma <- hif2[bcf.ma,]
dim(hif.bcf.ma)
hif.bcf.prop <- hif2[bcf.prop,]
dim(hif.bcf.prop)
hif.bcf.atz <- hif2[bcf.atz,]
dim(hif.bcf.atz)


#atrazine frog concs - categorical regression with and without interactions
summary(hif.atzt)
#View(hif.atzt)
hif.atzt$Conc
lm.atzt <- lm(Conc ~ MA + PROP, data=hif.atzt)
summary(lm.atzt)
lm.atzt2 <- lm(Conc ~ (MA + PROP)^2, data=hif.atzt)
summary(lm.atzt2)
lm.atzt3 <- lm(Conc ~ MA + PROP + Weight, data=hif.atzt)
summary(lm.atzt3)
#atrazine soil concs - categorical regression with and without interactions
lm.atzt4 <- lm(Conc ~ MA + PROP, data=hif.soil.atz)
summary(lm.atzt4)
lm.atzt5 <- lm(Conc ~ (MA + PROP)^2, data=hif.soil.atz)
summary(lm.atzt5)
#atrazine bcfs - categorical regression with and without interactions
lm.atzt6 <- lm(Conc ~ MA + PROP, data=hif.bcf.atz)
summary(lm.atzt6)
lm.atzt7 <- lm(Conc ~ (MA + PROP)^2, data=hif.bcf.atz)
summary(lm.atzt7)
step.atzt7 <- stepAIC(lm.atzt7, direction="both")
step.atzt7$anova

#malathion frog concs - categorical regression with and without interactions
summary(hif.mat)
#View(hif.dt)
lm.mat <- lm(Conc ~ ATZ + PROP, data=hif.mat)
summary(lm.mat)
lm.mat2 <- lm(Conc ~ (ATZ + PROP)^2, data=hif.mat)
summary(lm.mat2)
lm.mat3 <- lm(Conc ~ ATZ + PROP + Weight, data=hif.mat)
summary(lm.mat3)
#2,4-D soil concs - categorical regression with and without interactions
lm.mat4 <- lm(Conc ~ ATZ + PROP, data=hif.soil.ma)
summary(lm.mat4)
lm.mat5 <- lm(Conc ~ (ATZ + PROP)^2, data=hif.soil.ma)
summary(lm.mat5)
#2,4-D bcfs - categorical regression with and without interactions
lm.mat6 <- lm(Conc ~ ATZ + PROP, data=hif.bcf.ma)
summary(lm.mat6)
lm.mat7 <- lm(Conc ~ (ATZ + PROP)^2, data=hif.bcf.ma)
summary(lm.mat7)
step.mat7 <- stepAIC(lm.mat7, direction="both")
step.mat7$anova

#proptolachlor frog concs - categorical regression with and without interactions
summary(hif.propt)
lm.propt <- lm(Conc ~ (ATZ + MA), data=hif.propt)
summary(lm.propt)
lm.propt2 <- lm(Conc ~ (ATZ + MA)^2, data=hif.propt)
summary(lm.propt2)
lm.propt3 <- lm(Conc ~ (ATZ + MA + Weight), data=hif.propt)
summary(lm.propt3)
#proptolachlor soil concs - categorical regression with and without interactions
lm.propt4 <- lm(Conc ~ ATZ + MA, data=hif.soil.prop)
summary(lm.propt4)
lm.propt5 <- lm(Conc ~ (ATZ + MA)^2, data=hif.soil.prop)
summary(lm.propt5)
#2,4-D soil concs - categorical regression with and without interactions
lm.propt6 <- lm(Conc ~ ATZ + MA, data=hif.bcf.prop)
summary(lm.propt6)
lm.propt7 <- lm(Conc ~ (ATZ + MA)^2, data=hif.bcf.prop)
summary(lm.propt7)
step.propt7 <- stepAIC(lm.propt7, direction="both")
step.propt7$anova
