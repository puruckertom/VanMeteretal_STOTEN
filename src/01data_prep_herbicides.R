#we are crossed, but we have 3 not 2
#Two factors are crossed when every category of one factor co-occurs in the design with every category 
#of the other factor. In other words, there is at least one observation in every combination of 
#categories for the two factors.

#not nested
#A factor is nested within another factor when each category of the first factor co-occurs with 
#only one category of the other. In other words, an observation has to be within one category of 
#Factor 2 in order to have a specific category of Factor 1. All combinations of categories are not represented.

#abc factorial three way crossed design?
#fractional factorial design
# we have a full factorial design, so no need for foldover stuff
#a,b,c,ab,ac,bc,abc,contr
#6 * 8 = 48 samples
#Yates matrix for full factorial in 3 factors, each factor has 2 levels
#https://cran.r-project.org/web/packages/FrF2/FrF2.pdf
#http://www2.stat.duke.edu/~banks/218-lectures.dir/spec-lect2.pdf


#data set header row
#Group,ATZ,D,ME,DT,ATZT,MET,DS,ATZS,MES,DBCF,ATZBCF,METBCF,Weight,SA,TotT,TotBCF,Totalsoil,AppRate

drop: ATZ, ME, D
#atz treatments are ATZT
#metolachlor treatments are MET
#2,4-D DT
Weight,SA,AppRate

#spray treatment, liquid

#7 treatments plus control
#6 frogs per treatment

#triple herbicide
#24 D, ATZ, Metolachlor
#alone or combined, binary yes or no

#*T refers to tissue concentration
#*S refers to soil concentration
#*BCF empirical

#weight, surface area, 
#TotT-total tissue concentration (summed across herbicides)
#TotBCF- total bcf
#AppRate (total)

#frog = green frogs rana clamitanscat herbs.csv

#next study
#atrazine, malathion (insect), propiconazole (fungicide)

#possibly just look at atrazine across all pairs...

#read data
herbs <- read.csv(paste(rvm_csv_in,"Herbs.csv",sep=""))
#View(herbs)
summary (herbs)

#there is another data set coming for pesticides
