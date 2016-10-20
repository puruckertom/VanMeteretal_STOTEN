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
View(herbs)