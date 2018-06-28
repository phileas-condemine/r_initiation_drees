a=3
a

b=c("bonjour","merci","au revoir")
b

rep(b,a)
rep(x = b,times=a)#argument explicite dans rep.int mais caché dans ... pour rep()

install.packages(arsenal)
library(arsenal)

read.csv("2_dataviz_ggplot2/etalab_finess_geocoded.csv")

devtools::install_github("dmlc/xgboost")


library(cartography)
library(sp)
data("nuts2006")
nuts2.df$unemprate <- nuts2.df$unemp2008/nuts2.df$act2008*100
choroLayer(spdf = nuts2.spdf,
           df = nuts2.df,
           var = "unemprate")

myfunc <- function(a,b){
  a+b^2
  
}

c <- myfunc(c(1,2,3,5),rep(2,4))
