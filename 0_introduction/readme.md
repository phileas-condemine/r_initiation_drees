# Organisation de la journée
- 9h30 : [Introduction]
- 11h00 : [Pause]
- 11h15 : [Présentation] Data management avec R >> dplyr  
- 12h30 : [Pause] Déjeuner
- 13h45 : [Pratique] Data management avec R >> dplyr
- 14h45 : [Pause]
- 15h : [Présentation] Graphiques avec ggplot2
- 15h50 : [Pratique] Graphiques avec ggplot2
- 16h30 : [Pause]
- 16h45 : [Présentation] modèles & sélection de variables
- 17h15 : [Conclusions]

# Pourquoi une formation aux packages du tidyverse plutôt que R Base ?
Vous pouvez trouver <a href="http://rpubs.com/arifelk/359957">ici</a> une formation co-écrite avec Stéphanie Combes qui consacre beaucoup de temps aux base de R.<br>
Au quotidien, les agents ont surtout besoin de maîtriser quelques fonctions de manipulation de tables de données pour réaliser des sélections, des jointures et des statistiques descriptives. C'est le thème de la matinée. <br>
L'après-midi nous traiterons les différents sujets récurrents en atelier projet R. L'objectif est de vous donner un aperçu de tâches faisables facilement avec R. Vous disposerez du code et pourrez ainsi reproduire ces démarches si nécessaire.<br>
Une fois conscients de l'étendue des possibles avec R, il vous sera plus facile de venir participer à un atelier projet R afin d'appliquer à vos besoins spécifiques avec le support d'agents expérimentés.<br>
Cette journée de formation est dense et très complète, j'ai volontairement laissé un sujet crucial de côté : le développement d'applications Shiny. En effet, Shiny est un package R qui vient avec un paradigme de programmation très différent.<br>
La bonne nouvelle c'est que dans 99% des cas, pour développer une app Shiny on commence par réutiliser une appli pré-éxistante trouvée en générale dans <a href="https://shiny.rstudio.com/gallery/">la galerie officielle</a> qui contient des applis avec leur code ou dans <a href="http://dataviz.drees.solidarites-sante.gouv.fr">la galerie de la DREES</a> dont les codes sont sur le gitlab de la DREES.<br>


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
- l'instruction permettant de définir une boucle existe en R. <br>
`for(var in variables){
  table(data[[var]])
}`<br>
Vous avez peut-être entendu il y a quelques années, qu'il ne faut JAMAIS utiliser de boucle for dans R.<br>
Ce n'est plus vrai ! L'implémentation des boucles a évolué et les performances sont correctes.<br>
Heureusement, parce que les fonctions apply, sapply, lapply, mapply, tapply qui devaient être utilisées à la place des boucles for, demandent un certain entraînement.<br>
MAIS, si les boucles sont "autorisées" il ne faut pas pour autant en mettre partout. Comme dit au dessus, R est un langage vectoriel, donc on ne boucle <b>JAMAIS</b> sur les observations !!!


# Découverte de l'environnement RStudio

## Saisie semi-automatique
Lorsque vous entrez le nom d'un objet : fonction, table, vecteur... utilisez la touche `tab` pour compléter le nom de l'objet qui vous intéresse. Cette caractéristique est commune à la plupart des environnements de développement intégrés modernes (IDE). Par exemple vous la retrouverez dans Visual Studio, Eclipse... Ou dans des éditeurs de code modernes Visual Studio Code, Atom, Sublime Text...

## La console & la log
On peut écrire et éxecuter des lignes de codes, le résultat s'affiche au même endroit en dessous du code éxécuté. Les lignes de code sont enregistrées dans un fichier historique `.RHistory` mais elles ne sont pas dans un script. Ca n'est pas pratique si je veux
- reproduire mon travail
- créer des fonctions pour encapsuler/reproduire un programme

Plusieurs couleurs s'affichent dans la log : 
- dans un couleur les lignes de code qui ont été éxécutées
- dans une autre couleur les résultats de l'invocation de la fonction, par exemple un aperçu de la table de donnée
- en ROUGE les alertes (warnings) ET les erreurs. Les erreurs interrompent l'éxécution de la fonction contrairement aux alertes. Cependant une alerte peut indiquer un vrai problème dans l'éxécution d'une fonction ! Attention à bien lire ces alertes et essayer de les comprendre. 
A cause des contraintes de sécurité sur les PC de la DREES, lorsqu'on installe un package, il est fréquent que l'installation se termine avec un warning "unable to move file...". Ceci veut dire que le package a bien été téléchargé et décompressé dans un fichier temporaire mais qu'il n'a pas pu être placé dans le bon dossier ! Dans ce cas il faut placer le dossier du package décompressé (le chemin est donné à la fin du warning) dans le dossier "library" persistant (par opposition à temporaire) indiqué dans le message d'erreur.

Pour interrompre l'éxécution d'une commande, (par exemple `print(full_database)`) cliquer sur le bouton rouge (signe STOP) situé en haut à droite de la fenêtre de la Console. Ce bouton apparaît uniquement lorsqu'un script est en cours d'éxécution. Parfois R est bloqué dans l'éxécution d'une commande trop longue ou trop gourmande en RAM, il faut alors s'armer de patience et si nécessaire redémarrer la session R => sauvegarder le script régulièrement avec `Ctrl+S` ou le bouton "disquette" en haut à gauche de la fenêtre de Script (cf section suivante "l'éditeur de script").

## L'éditeur de script
Permet de conserver les lignes de codes et de les éxécuter une à une ou par bloc (raccourci `Ctrl+Enter` ou le bouton `Run` en haut à droite de la fenêtre de script).<br>
On peut éditer des fichiers R mais aussi Rmd, Rhtml ou d'autres fichiers "plats" comme dans un bloc-note : .txt, .csv, .md<br>
C'est dans cette fenêtre que s'affiche les aperçus des données générés par la fonction `View(data)`. Pour cette fonction comme pour toutes les fonctions qui affichent les données, il est recommandé de se limiter à un échantillon, en général on utilise la fonction `head` => `View(head(data))` pour ne pas prendre de risque. Il est bien sûr possible de paramétrer le nombre de lignes à afficher dans la fonction `head`.

## Assignation, appels de fonction
Dans SAS, une étape data consiste à préciser les données d'entrée et les données de sortie.
Dans R l'idée est un peu similaire, 
- on fournit dans les arguments de la fonction, les données d'entrée.
- la fonction renvoie un résultat, par exemple une jointure, ou le calcul d'une variable supplémentaire ajouté à la table de originale, ou une table avec des statistiques... Il faut mettre (assigner) dans "sortie" dans objet ! Bien sûr il est possible (et fréquent) de vouloir remplacer l'objet en entrée par l'objet en sortie, par exemple lorsqu'on ajoute une variable... pour cela il "suffit" de faire `data = fonction_de_creation_de_nouvelle_variable(data,autre_parametre)`.
ATTENTION : un "oubli" d'assignation `fonction_de_creation_de_nouvelle_variable(data,autre_parametre)` va demander à R de renvoyer dans la log l'intégralité de la sortie !!! Ca risque d'être long...


## L'environnement
La fenêtre portant ce nom référence les objets chargés en mémoire et donne quelques informations sur chaque objet : type, taille...<br>
Avec le bouton en haut à droite de la fenêtre Environment il est possible de passer de List à Grid pour obtenir des informations différentes sur les objets, en particulier la taille (Size). La fonction pour connaître la taille d'un objet est `object.size`.<br>

[Considérations de niveau avancé]

L'environnement visible par défaut est le "Global Environment", comme indiqué en haut à gauche de la fenêtre d'Environment. Chaque package vient avec son environnement. De même chaque appel de fonction définit un environnement local qui, le plus souvent, hérite de l'environnement global.<br>
Ces environnements "virtuels" permettent de faire cohabiter à des endroits distincts des objets partageant le même nom.<br>
Par exemple deux fonctions différentes mais portant le même nom peuvent exister dans deux packages différents. Dans ce cas il est recommandé de préciser l'environnement env::nom_de_la_fonction.<br>
Si vous voulez en savoir plus sur la manipulation d'environnements vous pouvez jeter un oeil à cette publication : https://rpubs.com/chrisbrunsdon/local2

## Projets
Avant de commencer à travailler sur des données, une bonne pratique est de 
1) Créer un dossier associé à l'étude dans lequel on place les données
2) Créer un "projet" R dans ce dossier en cliquant sur le bouton en haut à droite de la fenêtre RStudio et en choissant "dossier existant", il suffit alors de naviguer jusque dans le dossier de l'étude. RStudio va alors redémarrer une session dans un nouvel environnement (cf plus loin) spécifique à ce projet.
3) Créer un script en cliquant sur le bouton en haut à gauche de la fenêtre et sauvegarder ce script dans le dossier du projet.
Vous êtes alors prêts à commencer votre étude avec R.

## L'explorateur de fichier
Il fonctionne comme l'explorateur de fichier Windows sauf qu'il est ouvert par défaut au niveau du dossier de travail (working directory = wd). Par défaut c'est dans le wd que les fichiers seront lus/chargés et écrits/sauvegardés.<br>
Lorsqu'on crée un projet dans RStudio, on définit en même temps le wd, pas besoin de le changer à la main avec `setwd`.

## Remarque sur wd & env
Les concepts d'environnement + dossier de travail reproduisent les concepts de la work dans SAS : dossier par défaut.<br>
CEPENDANT, il faut bien différencier les fichiers accessibles dans le wd et les objets chargés en RAM dans l'environnement.


## Chargement de packages
Cette fenêtre "Packages" est le 3ème onglet de la fenêtre située par défaut en bas à droite de l'écran. Elle permet de rechercher un package dans la liste des packages déjà installés avec la barre de recherche située en haut à droite de la fenêtre.<br>
Si un package est coché, cela veut dire qu'il est chargé (attached) dans l'environnement de travail (Global Environment) ie ses fonctions peuvent être appelées directement. Sinon il est possible de les appeler en faisant précéder leur nom de nom_du_package::<br>
En général on évite de charger les packages manuellement, on préfère les appeler dans le script avec la fonction `library`. <br>
Par exemple pour charger le package haven, qui permet de lire des tables SAS, j'éxécute la ligne `library(haven)`<br>
Si un package n'est pas installé vous pouvez l'installer de deux manières différentes : 
- cliquer le bouton `Install` situé en haut à gauche de la fenêtre, puis saisissez le nom du package à installer. 
- utiliser la fonction `install.packages` en précisant le nom du package à installer.

## Aides sur les fonction
La fenêtre "Help" est le 4ème onglet de la fenêtre située par défaut en bas à droite de l'écran. Elle permet de rechercher de l'aide sur une fonction dans la documentation officielle de la fonction. Pour cela il suffit de taper le nom de la fonction dans la barre de recherche située en haut à droite de la fenêtre Help. Vous pouvez aussi appeler la fonction help(nom_de_la_fonction) ou ?nom_de_la_fonction.<br>
La page d'aide est toujours construite de la même manière !
1) Description brève de la ou des fonction(s) documentées
2) Appel par défaut de la fonction avec définition des paramètres par défaut ou des valeurs possibles
3) Description des arguments de la fonction
4) Facultatif : Détails
5) Values : Information sur les éléments renvoyés par la fonction
6) Facultatif : References si le package est associé à une publication par exemple !
7) Examples : la partie la PLUS UTILE de la doc est située à la fin, elle propose des exemples d'utilisation de la fonction sur des jeux de données d'école.


## Ouvrir le gestionnaire de tâches pour surveiller la RAM et les CPUs
Dans R, tous les objets, y compris les données, sont chargés en RAM, nos PC ont peu de RAM et comme le système d'exploitation est Windows, les objets en RAM ne sont pas "compressés" par l'OS et il n'existe pas de fichier de SWAP pour passer en mémoire dure lorsque la mémoire vive est débordée.<br>
Il est donc important de surveiller la consommation de RAM de la session et de 
- Régulièrement supprimer les objets VOLUMINEUX chargés en RAM (visibles dans l'environnement global) qui ne sont pas utiles.
- Vérifier la taille du fichier à lire/charger avant de le monter en RAM. Par exemple si je dispose de 8Go de RAM et que je veux charger la base MCO RSA du PMSI qui fait 10Go, ça ne marchera pas. La session va tourner en vain et finira par générer une erreur `cannot allocate vector of size 10Go`.
- Lorsque je supprime un objet je peux utiliser soit le bouton delete dans la fenêtre d'environnement, soit appeler la fonction rm sur l'objet que je souhaite supprimer. Une fois l'objet supprimer, Windows est feignant, la mémoire risque de ne pas être libérée immédiatement, on appelle donc la fonction `gc()` garbage collector, sans argument. Cette bonne pratique est héritée des langages de programmation "bas niveau"" tels que le C.

Alors que faire ?
- Charger une échantillon de données.
- Anticiper l'empreinte mémoire des opérations à effectuer. Par exemple je dispose d'une table de 2 colonnes (coordonées GPS) et 10M de lignes, ne pas calculer brutalement la matrice des distances de taille 10M x 10M !
- Augmenter la RAM en travaillant sur des infrastructures déportées dans des machines virtuelles. C'est possible, la DSI s'entraîne déjà à le faire, il suffit de déployer RStudio Server sur une VM, c'est fait en 10 minutes. Ce qui prend du temps c'est que la DSI accorde des VM avec suffisamment de RAM... La preuve, ce tutoriel en 12 commandes : https://www.vultr.com/docs/how-to-install-rstudio-server-on-centos-7






# Chercher de l'aide sur internet : StackOverflow/StackExchange et les forums Google
## Commande de debugging - lire le traceback
Le sujet est trop avancé pour cette formation alors je donne un lien : https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-RStudio
Il y a deux messages simples et importants : 
- Lorsqu'on rencontre une erreur, il faut et il suffit de la copier coller dans un moteur de recherche (type google) pour trouver la réponse sur stackoverflow dans 99% des cas ! Quelques consignes supplémentaires sont données dans la section suivante
- Lorsqu'une erreur apparaît au sein d'une fonction définie par l'utilisateur, le `traceback` permet en général de connaître la ligne à laquelle l'erreur a eu lieu, c'est pratique. 

Voici un exemple reproductible

`test <- function(x){
  print(x[[1]])
  cumsum(x)
  return(x/x)
}
test(data.frame(x=c(1,2,3),y=c("A","B","C")))
traceback()`


## Copier-coller la partie importante de mon erreur
- Si des noms de variable ou des numéros de lignes/colonnes sont mentionnés, il n'est probablement pas pertinent de les rappeler.
- Si le message d'erreur est en français j'aurai sans doute plus de chance en le traduisant en anglais.
- Si le message est très long, il faut chercher les "bons" morceaux de texte.
