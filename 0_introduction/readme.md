# Organisation de la journ�e
- 9h30 : [Introduction]
- 10h : [Pr�sentation & questions] data management avec R >> dplyr
- 10h30 : [Pause]
- 10h45 : [Pratique] data management avec R >> dplyr  
- 12h : [Pause] D�jeuner
- 13h30 : [Pr�sentation & questions] graphiques
- 14h : [Pratique] graphiques
- 14h45 : [Pause]
- 15h : [Pr�sentation & questions] webscraping
- 15h30 : [Pratique] webscraping
- 16h15 : [Pause]
- 16h30 : [Pr�sentation & questions] mod�les & s�lection de variables
- 17h : [Pratique]  mod�les & s�lection de variables
- 17h20 : [Conclusions]

# Introduction � R
## Open Source
Lorsqu'on lance R on voit un message :<br>
"R is free software and comes with ABSOLUTELY NO WARRANTY"<br>
Ceci dit, tout le d�veloppement de R est compl�tement transparent ie tous les codes sources sont accessibles et ont �t� de nombreuses fois "peer reviewed".

## Gestion des tables et autres objets
Tous les objets sont charg�s en RAM (m�moire vive).<br>
Les tables sont trait�s comme des data.frame ou d�riv�s : tibble, data.table, sparseMatrix.<br>
Les autres objets courants sont les vecteurs et les listes. Un data.frame est une liste de vecteurs de tailles identiques.<br>

## Types de donn�es
Les characters/cha�nes de caract�res.<br>
Les facteurs ou variables cat�gorielle avec labels (levels).<br>
Les variables num�riques.<br>

## Les fonctions
Dans R, il n'y a que des fonctions (macro ?) � appliquer � des objets pour les transformer, les manipuler, calculer les stats... `a+b` est vu comme une fonction `+`(a,b), l'assignation/d�finition `a=b` est vu comme la fonction `assign("a",b)`<br>
Param�tres implicites vs explicites. On aime bien que les fonctions soient tr�s param�trables, mais certains param�tres sont souvent les m�mes, par exemple lorsqu'on lit un CSV, les s�parateurs sont en g�n�ral des virgules (d'o� le nom Comma Separateur Values). Donc la valeur par d�faut du s�parateur `sep` sera souvent ",".<br>
Diff�rence entre `<-` et `=` : le symbole `=` permet � la fois de d�finir un objet et de d�finir le param�tre d'une fonction. Le symbole `<-` est moins ambigu, il sert uniquement � assigner une valeur comme la fonction `assign()`.<br>
Les "puristes" utilisent toujours `<-` pour l'assignation et `=` seulement pour la d�finition des param�tres. Ceci est n�cessaire lorsqu'on encapsule une expression dans une fonction : `system.time(a<-rnorm(1000000))` <br>
 

Quelques fonctions essentielles :
- max
- min
- mean
- sum
- which
- which.max 
- which.min
- which.mean 
- rowSums
- colSums
- cumsum
- system.time


## Les packages
Si vous voulez faire quelque chose, quelqu'un l'a sans doute d�j� cod� dans une fonction.<br>
Une fonction vient rarement seule, et pour assurer la bonne documentation et le maintien � jour des fonctions, on les encapsule dans des packages ou librairies (libraries).<br>
Il ne vous reste qu'� trouver le package.<br>
Pour bien comprendre, il faut savoir que n'importe qui peut d�velopper une(des) fonction(s) et proposer un package R.<br>
En g�n�ral les packages sont stock�s � deux endroits :
- CRAN, avec des fichiers de description standard, une documentation dans un format standard et �ventuellement des tests unitaires/tests de non-regressions pour faciliter la maintenance et le debug.
- github.io (�quivalent de gitlab.com) avec un format libre.

## Traitement vectoriel, moins de boucles
Dans R il y a des vecteurs partout, alors plut�t que d'�crire des boucles sur ces vecteurs, les fonctions sont naturellement g�n�ralis�es pour effectuer des calculs sur l'ensemble des �l�ments du vecteur.<br>
Lorsqu'on doit r�aliser des boucles, par exemple r�aliser une op�ration sur chaque variable d'une table (data.frame) :
- l'instruction permettant de d�finir une boucle existe en R. 
`for(var in variables){
  table(data[[var]])
}`


# D�couverte de l'environnement RStudio

## Saisie semi-automatique
Lorsque vous entrez le nom d'un objet : fonction, table, vecteur... utilisez la touche "tab" pour compl�ter le nom de l'objet qui vous int�resse.

## La console
On peut �xecuter des lignes de codes, elles sont enregistr�es dans l'historique .RHistory mais elles ne sont pas dans un script. Ca n'est pas pratique si je veux
- reproduire mon travail
- cr�er des fonctions pour encapsuler un programme

## L'�diteur de script
Permet de conserver les lignes de codes.

## L'environnement
R�f�rence les objets charg�s en m�moire et donne quelques informations sur chaque objet : type, taille...

## L'explorateur de fichier

## Chargement de packages

## Projets

## Ouvrir le gestionnaire de t�ches pour surveiller la RAM et les CPUs

## Commande de debugging - lire le traceback

# Chercher de l'aide sur internet : stackoverflow
## Copier-coller la partie importante de mon erreur
- Si des noms de variable ou des num�ros de lignes/colonnes sont mentionn�s, il n'est probablement pas pertinent de les rappeler.
- Si le message d'erreur est en fran�ais j'aurai sans doute plus de chance en le traduisant en anglais.
- Si le message est tr�s long, il faut chercher les "bons" morceaux de texte.
