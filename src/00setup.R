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

#read data
herbs <- read.csv(paste(rvm_csv_in,"Herbs.csv",sep=""))
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

herbs.atzt <- herbs2[atzt,]
herbs.dt <- herbs2[dt,]
herbs.met <- herbs2[met,]
herbs.soil.met <- herbs2[soil.met,]

summary(herbs.atzt)
#View(herbs.atzt)
herbs.atzt$Conc
lm.atzt <- lm(Conc ~ D + ME, data=herbs.atzt)
summary(lm.atzt)
lm.atzt2 <- lm(Conc ~ (D + ME)^2, data=herbs.atzt)
summary(lm.atzt2)
lm.atzt3 <- lm(Conc ~ D + ME + Weight, data=herbs.atzt)
summary(lm.atzt3)

summary(herbs.dt)
#View(herbs.dt)
lm.dt <- lm(Conc ~ ATZ + ME, data=herbs.dt)
summary(lm.dt)
lm.dt2 <- lm(Conc ~ (ATZ + ME)^2, data=herbs.dt)
summary(lm.dt2)
lm.dt3 <- lm(Conc ~ ATZ + ME + Weight, data=herbs.dt)
summary(lm.dt3)


summary(herbs.met)
lm.met <- lm(Conc ~ (ATZ + D), data=herbs.met)
summary(lm.met)
lm.met2 <- lm(Conc ~ (ATZ + D)^2, data=herbs.met)
summary(lm.met2)
lm.met3 <- lm(Conc ~ (ATZ + D + Weight), data=herbs.met)
summary(lm.met3)
lm.met4 <- lm(Conc ~ ATZ + D, data=herbs.soil.met)
summary(lm.met4)
lm.met5 <- lm(Conc ~ (ATZ + D)^2, data=herbs.soil.met)
summary(lm.met5)
