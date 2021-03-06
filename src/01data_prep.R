#data set header row
#Group,ATZ,D,ME,DT,ATZT,MET,DS,ATZS,MES,DBCF,ATZBCF,METBCF,Weight,SA,TotT,TotBCF,Totalsoil,AppRate

drop: ATZ, ME, D
atz treatments are ATZT
MET
DT
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
