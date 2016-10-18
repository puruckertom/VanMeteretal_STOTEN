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
print(paste("check to see if R can access files OK: ", file.exists(rvm_csv_in), sep = ""))

#read data
herbs <- read.csv(paste(rvm_csv_in,"Herbs.csv",sep=""))
View(herbs)

atzfrog <- aov(ATZT ~ Rtreatment, data=ATZFROG)
summary (atzfrog)
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