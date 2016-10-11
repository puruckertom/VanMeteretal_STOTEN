#Determine path directory based on the user machine######
#tom epa windows
if(Sys.info()[4]=="DC2626UTPURUCKE"){
  dir<-path.expand("C:/git/beeRpop/")
}

#read data
ATZFROG <- read.csv("~/Desktop/Summer 2015 Research/ATZFROG.csv")
View(ATZFROG)
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