# Introduction au data management avec R >> dplyr
On introduit les principales fonctions dplyr ainsi que les principales fonctions de lectures de données : 
- données SAS : haven::read_sas (éviter le package sas7bdat)
- données Excel : readxl:read_xls readxl::read_xlsx (éviter le package xlsx)
- données CSV et TXT : data.table::fread (éviter les fonctions de base read.csv et read.csv2 ainsi que le package readr)

On montre comment reproduire des PROCs SAS avec dplyr en enchaînant des fonctions élémentaires avec %>%

Si on veut reproduire une PROC en particulier, vérifier sur google si qqn n'a pas fait un package R pour ça. Exemple avec PROC COMPARE <-> package arsenal.

# Exercices

Données sources
1) fichier FINESS geolocalisé
  https://www.data.gouv.fr/fr/datasets/finess-extraction-du-fichier-des-etablissements/
2) fichier INSEE FiLosFi
  https://www.insee.fr/fr/statistiques/fichier/3126432/filo-revenu-pauvrete-menage-2014.zip

Un préparation de ces données est proposée dans le script
"data_cleaning.Rmd"

Vous pouvez directement partir du fichier de données préparées :
load("fichiers_prepared.RData")
