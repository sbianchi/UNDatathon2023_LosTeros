setwd('C:/DARIO/Trabajo/DataThon')

library(sf)
library(dplyr)
library(data.table)

set.seed(12345)

fun = dir('Funciones')
fun = fun[grep('.R',fun,ignore.case = T)]
for(ii in fun) source(paste0('Funciones/',ii))

dir('SHP')

### Datos del viento
capaWind = leeTif(path = 'https://globalwindatlas.info/api/gis/country/ARG/power-density/100', 
                  nsample = 300000)

colnames(capaWind)[grep('file',colnames(capaWind))] = 'power_demsity'


### Datos del poblacion
capaPob = leeTif(path = 'SHP/arg_pd_2019_1km.tif', 
                  nsample = 300000)



#####################################
#### Guarda los datos
fwrite(capaWind,'Datos/ARG_power.csv',sep = ',')
fwrite(capaPob,'Datos/arg_pd_2019_1km.csv',sep = ',')

