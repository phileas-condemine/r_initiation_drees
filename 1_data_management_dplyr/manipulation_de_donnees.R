library(dplyr)
load("1_data_management_dplyr/fichiers_prepared.RData")

# pourquoi le %>% ?

summarise(group_by(distinct(select(finess_et,SIRET,dep)),dep),count=n())


arrange(.data = finess_et,dep)

decompte_finess_dep

temp = summarise(
  group_by(
    distinct(
      select(finess_et,SIRET,dep)
      ),dep
    )
  ,count=n()
  )
temp$proportion=temp$count/sum(temp$count)


finess_et%>%
  select(SIRET,dep)%>%
  distinct()%>%# blabla
  
  
  #blabla
  
  group_by(dep)%>%
  summarise(nombre=n())%>%
  mutate(proportion=nombre/sum(nombre))-> decompte_finess_dep

decompte_finess_dep <- finess_et%>%
  select(SIRET,dep)%>%
  distinct()%>%
  group_by(dep)%>%
  summarise(nombre=n())%>%
  mutate(proportion=nombre/sum(nombre))



head(decompte_finess_dep)
tail(decompte_finess_dep)
View(decompte_finess_dep)

# assign pour les jusqu'au-bout-istes
rm("decompte_finess_dep")
finess_et%>%
  select(SIRET,dep)%>%
  distinct()%>%
  group_by(dep)%>%
  summarise(nombre=n())%>%
  mutate(proportion=nombre/sum(nombre))%>%
  assign(x = "decompte_finess_dep",value=.,envir=globalenv())


insee%>%#table en entrée
  select(CODGEO,MED14)%>%# selection de 2 variables
  mutate(dep=substr(CODGEO,1,2),#extraction du département
         MED14=as.numeric(MED14))%>%#conversion en numérique
  group_by(dep)%>%#clef de group by
  summarise(moyenne=mean(MED14,na.rm=TRUE),
            sd=sd(MED14,na.rm=TRUE),
            q90=quantile(x = MED14,
                         probs = .9,
                         na.rm=TRUE))

insee2=insee
insee2$dep=substr(insee$CODGEO,1,2)

insee$PIMP14=as.numeric(insee$PIMP14)

finess_et$somme_coord=as.numeric(finess_geo$X)+as.numeric(finess_geo$Y)

insee$med_pimp=as.numeric(insee$MED14)+as.numeric(insee$PIMP14)
