#install.packages("DBI")
#install.packages("RMariaDB")
#install.packages("RMySQL")
setwd("~/RStudio/r_aecid")
library(dplyr)

m1<-read.csv("csv/m1_data.csv")
m2<-read.csv("csv/m2_data.csv")
summary(m2)
data.dep('Piura')

#Piura	***
#Puno	***
#Nacional	***
  


#####################################################
t1<-subset(m2,departamento=='Amazonas' & fase=='Concluido' & estado=='published')[1]
write.table(t1,"export/validar.txt",sep = '\t',row.names = FALSE)
rm(t1)
subset(m2,porcentaje=='NA')
#Muestra nulos
m2[is.na(m2$porcentaje),]

t1<-data.dep('Amazonas')
head(t1)


d1<-read.csv("csv/d1.csv")
d2<-read.csv("csv/d2.csv")

m1<-round(d1[2],2)
m2<-round(d2[2],2)
head(m1)

anti_join(d1,d2)
round(anti_join(m1,m2),2)
head(d1)
subset(d1,d1$id=='2258')
subset(d2,d2$id=='2258')
#####################################################
data.dep<-function(dep,tipo){
  d1<-subset(m1,Departamento==dep & Fase=='Concluido' & Estado=='Publicado')
  d2<-subset(m2,departamento==dep & fase=='Concluido' & estado=='published')
  if(tipo=='M'){
    d1<-select(d1,monto=Monto.total.español)
    d2<-select(d2,monto=monto_total_español)
  }else{
    d1<-select(d1,id=Intervencion_Id,monto=Monto.total.español)
    d2<-select(d2,id,monto=monto_total_español)
  }
  a<-anti_join(d1,d2)
  return(a)
}
