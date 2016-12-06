#Install and load supporting libraries.
print(Sys.info()[4])

R.Version()$version.string
library(rmarkdown, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(knitr, quietly = TRUE, warn.conflicts = FALSE)
library(ggplot2)
library(reshape2)
print("list of loaded packages: ")
print((.packages()))


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
herbs.dt <- herbs2[dt,]
herbs.met <- herbs2[met,]
herbs.soil.met <- herbs2[soil.met,]
herbs.soil.dt <- herbs2[soil.dt,]
herbs.soil.atzt <- herbs2[soil.atzt,]
herbs.bcf.met <- herbs2[bcf.met,]
herbs.bcf.dt <- herbs2[bcf.dt,]
herbs.bcf.atzt <- herbs2[bcf.atzt,]


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

#log kows
#atrazine 2.4-2.7
#2,4-D 2.81
#s-metolachlor 3.24

#6 sets of boxplots for all 3 pesticides times 2 treatments
