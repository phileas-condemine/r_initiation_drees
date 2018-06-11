# Introduction au data management avec R >> dplyr
On introduit les principales fonctions dplyr ainsi que les principales fonctions de lectures de donn�es : 
- donn�es SAS : haven::read_sas (�viter le package sas7bdat)
- donn�es Excel : readxl:read_xls readxl::read_xlsx (�viter le package xlsx)
- donn�es CSV et TXT : data.table::fread (�viter les fonctions de base read.csv et read.csv2 ainsi que le package readr)

On montre comment reproduire des PROCs SAS avec dplyr en encha�nant des fonctions �l�mentaires avec %>%

Si on veut reproduire une PROC en particulier, v�rifier sur google si qqn n'a pas fait un package R pour �a. Exemple avec PROC COMPARE <-> package arsenal.

# Exercices

Donn�es sources
1) fichier FINESS geolocalis�
  https://www.data.gouv.fr/fr/datasets/finess-extraction-du-fichier-des-etablissements/
2) fichier INSEE FiLosFi
  https://www.insee.fr/fr/statistiques/fichier/3126432/filo-revenu-pauvrete-menage-2014.zip

Un pr�paration de ces donn�es est propos�e dans le script
"data_cleaning.Rmd"

Vous pouvez directement partir du fichier de donn�es pr�par�es :
load("fichiers_prepared.RData")
