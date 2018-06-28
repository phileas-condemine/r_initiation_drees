# Introduction au data management avec R >> dplyr

Voici le lien vers la pr�sentation : http://rpubs.com/arifelk/GUEPARD2

On introduit les principales fonctions dplyr ainsi que les principales fonctions de lectures de donn�es : 
- donn�es SAS : haven::read_sas (�viter le package sas7bdat)
- donn�es Excel : readxl:read_xls readxl::read_xlsx (�viter le package xlsx)
- donn�es CSV et TXT : data.table::fread (�viter les fonctions de base read.csv et read.csv2 ainsi que le package readr)

On montre comment reproduire des PROCs SAS avec dplyr en encha�nant des fonctions �l�mentaires avec %>%

Si on veut reproduire une PROC en particulier, v�rifier sur google si qqn n'a pas fait un package R pour �a. Exemple avec PROC COMPARE <-> package arsenal.

Pour vous y retrouver parmi toutes les fonctions de dplyr, voici une <a href="https://www.rstudio.com/wp-content/uploads/2016/01/data-wrangling-french.pdf"> anti-s�che</a>.

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

Il s'agit d'une pratique "libre". L'objectif est de manipuler un jeu de donn�es r�elles avec les fonctions dplyr vue pr�c�demment.

Voici une suggestion d'exercices "r�solus" dans pratique.Rmd 

- S�lectionner les variables qui vous int�ressent avec `select` et v�rifier qu'il y a une ligne par �tablissement (SIRET ou FINESS_ET) avec `distinct`
- S�lectionner les observations pertinentes dans finess_geo (choisir un syst�me de coordonn�es coh�rent) avec `filter`
- Construire le CODGEO commune dans la base FINESS � partir du DEP et code commune en utilisant `mutate`
- Si n�cessaire renommer les variables avec `rename`
- Apparier les bases FINESS et INSEE avec la fonction `merge`ou `left_join`
- Trier les �tablissements par une variable INSEE d'int�r�t, par exemple MED14 le revenu m�dian, avec la fonction `arrange`
- Construire des stats desc en croisant INSEE et FINESS avec `group_by` et `summarise`
- N'h�sitez pas � r�utiliser des fonctions vues dans les slides de la pr�sentation http://rpubs.com/arifelk/GUEPARD2

