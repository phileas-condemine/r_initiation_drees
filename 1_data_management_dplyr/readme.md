# Introduction au data management avec R >> dplyr

Voici le lien vers la présentation : http://rpubs.com/arifelk/GUEPARD2

On introduit les principales fonctions dplyr ainsi que les principales fonctions de lectures de données : 
- données SAS : haven::read_sas (éviter le package sas7bdat)
- données CSV et TXT : data.table::fread (éviter les fonctions de base read.csv et read.csv2 ainsi que le package readr)
- données Excel : readxl:read_xls readxl::read_xlsx (éviter le package xlsx)
- concernant l'écriture/la création de fichiers Excel, vous pouvez utiliser le package openxlsx


On montre comment reproduire des PROCs SAS avec dplyr en enchaînant des fonctions élémentaires avec `%>%`
Pour économiser le `x <- x %>% f` on peut utiliser la <a href="https://stackoverflow.com/questions/46275951/magrittr-two-way-pipe-and-multiple-conditions">formule abrégée</a> `x %<>% f` issue du package `magrittr`.

Si on veut reproduire une PROC en particulier, vérifier sur Google si qqn n'a pas fait un package R pour ça. Exemple avec PROC COMPARE <-> package arsenal.

Pour vous y retrouver parmi toutes les fonctions de dplyr, voici une <a href="https://www.rstudio.com/wp-content/uploads/2016/01/data-wrangling-french.pdf"> anti-sèche</a>.

# Exercices

Données sources
1) fichier FINESS geolocalisé
  https://www.data.gouv.fr/fr/datasets/finess-extraction-du-fichier-des-etablissements/
2) fichier INSEE FiLosFi
  https://www.insee.fr/fr/statistiques/fichier/3126432/filo-revenu-pauvrete-menage-2014.zip

Un préparation de ces données est proposée dans le script
"data_cleaning.Rmd"

Vous pouvez directement partir du fichier de données préparées :
- `load("1_data_management_dplyr/fichiers_prepared.RData")`
- Certaines variables sont traitées comme des chaînes de caractères mais sont en fait des variables numériques `insee%<>%mutate_at(3:28,as.numeric)`

Il s'agit d'une pratique "libre". L'objectif est de manipuler un jeu de données réelles avec les fonctions dplyr vue précédemment.

Voici une suggestion d'exercices "résolus" dans pratique.Rmd 
- Jeter un oeil à vos données avec les fonctions `head` et `View`
- Sélectionner les variables qui vous intéressent avec `select` et vérifier qu'il y a une ligne par établissement (SIRET ou FINESS_ET) avec `distinct` et `nrow`
- Sélectionner les observations pertinentes dans finess_geo (choisir un système de coordonnées cohérent) avec `filter`
- Construire le CODGEO commune dans la base FINESS à partir du DEP et code commune en utilisant `mutate` et `paste`
- Si nécessaire renommer les variables avec `rename`
- Apparier les bases FINESS et INSEE avec la fonction `merge`ou `left_join`
- Trier les établissements par une variable INSEE d'intérêt, par exemple MED14 le revenu médian, avec la fonction `arrange`
- Construire des stats desc en croisant INSEE et FINESS avec `group_by` et `summarise`
- Ajouter des variables synthétiques avec `group_by` et `mutate`
- N'hésitez pas à réutiliser des fonctions vues dans les slides de la présentation http://rpubs.com/arifelk/GUEPARD2

Une proposition de "solution" se trouve dans les fichiers pratique.Rmd et pratique.html
