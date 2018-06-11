# Organisation de la journée
- 9h30 : [Introduction]
- 10h : [Présentation & questions] data management avec R >> dplyr
- 10h30 : [Pause]
- 10h45 : [Pratique] data management avec R >> dplyr  
- 12h : [Pause] Déjeuner
- 13h30 : [Présentation & questions] graphiques
- 14h : [Pratique] graphiques
- 14h45 : [Pause]
- 15h : [Présentation & questions] webscraping
- 15h30 : [Pratique] webscraping
- 16h15 : [Pause]
- 16h30 : [Présentation & questions] modèles & sélection de variables
- 17h : [Pratique]  modèles & sélection de variables
- 17h20 : [Conclusions]

# Introduction à R
## Open Source
Lorsqu'on lance R on voit un message :<br>
"R is free software and comes with ABSOLUTELY NO WARRANTY"<br>
Ceci dit, tout le développement de R est complètement transparent ie tous les codes sources sont accessibles et ont été de nombreuses fois "peer reviewed".

## Gestion des tables et autres objets
Tous les objets sont chargés en RAM (mémoire vive).<br>
Les tables sont traités comme des data.frame ou dérivés : tibble, data.table, sparseMatrix.<br>
Les autres objets courants sont les vecteurs et les listes. Un data.frame est une liste de vecteurs de tailles identiques.<br>

## Types de données
Les characters/chaînes de caractères.<br>
Les facteurs ou variables catégorielle avec labels (levels).<br>
Les variables numériques.<br>

## Les fonctions
Dans R, il n'y a que des fonctions (macro ?) à appliquer à des objets pour les transformer, les manipuler, calculer les stats... `a+b` est vu comme une fonction `+`(a,b), l'assignation/définition `a=b` est vu comme la fonction `assign("a",b)`<br>
Paramètres implicites vs explicites. On aime bien que les fonctions soient très paramétrables, mais certains paramètres sont souvent les mêmes, par exemple lorsqu'on lit un CSV, les séparateurs sont en général des virgules (d'où le nom Comma Separateur Values). Donc la valeur par défaut du séparateur `sep` sera souvent ",".<br>
Différence entre `<-` et `=` : le symbole `=` permet à la fois de définir un objet et de définir le paramètre d'une fonction. Le symbole `<-` est moins ambigu, il sert uniquement à assigner une valeur comme la fonction `assign()`.<br>
Les "puristes" utilisent toujours `<-` pour l'assignation et `=` seulement pour la définition des paramètres. Ceci est nécessaire lorsqu'on encapsule une expression dans une fonction : `system.time(a<-rnorm(1000000))` <br>
 

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
Si vous voulez faire quelque chose, quelqu'un l'a sans doute déjà codé dans une fonction.<br>
Une fonction vient rarement seule, et pour assurer la bonne documentation et le maintien à jour des fonctions, on les encapsule dans des packages ou librairies (libraries).<br>
Il ne vous reste qu'à trouver le package.<br>
Pour bien comprendre, il faut savoir que n'importe qui peut développer une(des) fonction(s) et proposer un package R.<br>
En général les packages sont stockés à deux endroits :
- CRAN, avec des fichiers de description standard, une documentation dans un format standard et éventuellement des tests unitaires/tests de non-regressions pour faciliter la maintenance et le debug.
- github.io (équivalent de gitlab.com) avec un format libre.

## Traitement vectoriel, moins de boucles
Dans R il y a des vecteurs partout, alors plutôt que d'écrire des boucles sur ces vecteurs, les fonctions sont naturellement généralisées pour effectuer des calculs sur l'ensemble des éléments du vecteur.<br>
Lorsqu'on doit réaliser des boucles, par exemple réaliser une opération sur chaque variable d'une table (data.frame) :
- l'instruction permettant de définir une boucle existe en R. 
`for(var in variables){
  table(data[[var]])
}`


# Découverte de l'environnement RStudio

## Saisie semi-automatique
Lorsque vous entrez le nom d'un objet : fonction, table, vecteur... utilisez la touche "tab" pour compléter le nom de l'objet qui vous intéresse.

## La console
On peut éxecuter des lignes de codes, elles sont enregistrées dans l'historique .RHistory mais elles ne sont pas dans un script. Ca n'est pas pratique si je veux
- reproduire mon travail
- créer des fonctions pour encapsuler un programme

## L'éditeur de script
Permet de conserver les lignes de codes.

## L'environnement
Référence les objets chargés en mémoire et donne quelques informations sur chaque objet : type, taille...

## L'explorateur de fichier

## Chargement de packages

## Projets

## Ouvrir le gestionnaire de tâches pour surveiller la RAM et les CPUs

## Commande de debugging - lire le traceback

# Chercher de l'aide sur internet : stackoverflow
## Copier-coller la partie importante de mon erreur
- Si des noms de variable ou des numéros de lignes/colonnes sont mentionnés, il n'est probablement pas pertinent de les rappeler.
- Si le message d'erreur est en français j'aurai sans doute plus de chance en le traduisant en anglais.
- Si le message est très long, il faut chercher les "bons" morceaux de texte.
