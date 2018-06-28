# Organisation de la journ�e
- 9h30 : [Introduction]
- 11h00 : [Pause]
- 11h15 : [Pr�sentation] Data management avec R >> dplyr  
- 12h30 : [Pause] D�jeuner
- 13h45 : [Pratique] Data management avec R >> dplyr
- 14h45 : [Pause]
- 15h : [Pr�sentation] Graphiques avec ggplot2
- 15h50 : [Pratique] Graphiques avec ggplot2
- 16h30 : [Pause]
- 16h45 : [Pr�sentation] mod�les & s�lection de variables
- 17h15 : [Conclusions]

# Pourquoi une formation aux packages du tidyverse plut�t que R Base ?
Vous pouvez trouver <a href="http://rpubs.com/arifelk/359957">ici</a> une formation co-�crite avec St�phanie Combes qui consacre beaucoup de temps aux base de R.<br>
Au quotidien, les agents ont surtout besoin de ma�triser quelques fonctions de manipulation de tables de donn�es pour r�aliser des s�lections, des jointures et des statistiques descriptives. C'est le th�me de la matin�e. <br>
L'apr�s-midi nous traiterons les diff�rents sujets r�currents en atelier projet R. L'objectif est de vous donner un aper�u de t�ches faisables facilement avec R. Vous disposerez du code et pourrez ainsi reproduire ces d�marches si n�cessaire.<br>
Une fois conscients de l'�tendue des possibles avec R, il vous sera plus facile de venir participer � un atelier projet R afin d'appliquer � vos besoins sp�cifiques avec le support d'agents exp�riment�s.<br>
Cette journ�e de formation est dense et tr�s compl�te, j'ai volontairement laiss� un sujet crucial de c�t� : le d�veloppement d'applications Shiny. En effet, Shiny est un package R qui vient avec un paradigme de programmation tr�s diff�rent.<br>
La bonne nouvelle c'est que dans 99% des cas, pour d�velopper une app Shiny on commence par r�utiliser une appli pr�-�xistante trouv�e en g�n�rale dans <a href="https://shiny.rstudio.com/gallery/">la galerie officielle</a> qui contient des applis avec leur code ou dans <a href="http://dataviz.drees.solidarites-sante.gouv.fr">la galerie de la DREES</a> dont les codes sont sur le gitlab de la DREES.<br>


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
- l'instruction permettant de d�finir une boucle existe en R. <br>
`for(var in variables){
  table(data[[var]])
}`<br>
Vous avez peut-�tre entendu il y a quelques ann�es, qu'il ne faut JAMAIS utiliser de boucle for dans R.<br>
Ce n'est plus vrai ! L'impl�mentation des boucles a �volu� et les performances sont correctes.<br>
Heureusement, parce que les fonctions apply, sapply, lapply, mapply, tapply qui devaient �tre utilis�es � la place des boucles for, demandent un certain entra�nement.<br>
MAIS, si les boucles sont "autoris�es" il ne faut pas pour autant en mettre partout. Comme dit au dessus, R est un langage vectoriel, donc on ne boucle <b>JAMAIS</b> sur les observations !!!


# D�couverte de l'environnement RStudio

## Saisie semi-automatique
Lorsque vous entrez le nom d'un objet : fonction, table, vecteur... utilisez la touche `tab` pour compl�ter le nom de l'objet qui vous int�resse. Cette caract�ristique est commune � la plupart des environnements de d�veloppement int�gr�s modernes (IDE). Par exemple vous la retrouverez dans Visual Studio, Eclipse... Ou dans des �diteurs de code modernes Visual Studio Code, Atom, Sublime Text...

## La console & la log
On peut �crire et �xecuter des lignes de codes, le r�sultat s'affiche au m�me endroit en dessous du code �x�cut�. Les lignes de code sont enregistr�es dans un fichier historique `.RHistory` mais elles ne sont pas dans un script. Ca n'est pas pratique si je veux
- reproduire mon travail
- cr�er des fonctions pour encapsuler/reproduire un programme

Plusieurs couleurs s'affichent dans la log : 
- dans un couleur les lignes de code qui ont �t� �x�cut�es
- dans une autre couleur les r�sultats de l'invocation de la fonction, par exemple un aper�u de la table de donn�e
- en ROUGE les alertes (warnings) ET les erreurs. Les erreurs interrompent l'�x�cution de la fonction contrairement aux alertes. Cependant une alerte peut indiquer un vrai probl�me dans l'�x�cution d'une fonction ! Attention � bien lire ces alertes et essayer de les comprendre. 
A cause des contraintes de s�curit� sur les PC de la DREES, lorsqu'on installe un package, il est fr�quent que l'installation se termine avec un warning "unable to move file...". Ceci veut dire que le package a bien �t� t�l�charg� et d�compress� dans un fichier temporaire mais qu'il n'a pas pu �tre plac� dans le bon dossier ! Dans ce cas il faut placer le dossier du package d�compress� (le chemin est donn� � la fin du warning) dans le dossier "library" persistant (par opposition � temporaire) indiqu� dans le message d'erreur.

Pour interrompre l'�x�cution d'une commande, (par exemple `print(full_database)`) cliquer sur le bouton rouge (signe STOP) situ� en haut � droite de la fen�tre de la Console. Ce bouton appara�t uniquement lorsqu'un script est en cours d'�x�cution. Parfois R est bloqu� dans l'�x�cution d'une commande trop longue ou trop gourmande en RAM, il faut alors s'armer de patience et si n�cessaire red�marrer la session R => sauvegarder le script r�guli�rement avec `Ctrl+S` ou le bouton "disquette" en haut � gauche de la fen�tre de Script (cf section suivante "l'�diteur de script").

## L'�diteur de script
Permet de conserver les lignes de codes et de les �x�cuter une � une ou par bloc (raccourci `Ctrl+Enter` ou le bouton `Run` en haut � droite de la fen�tre de script).<br>
On peut �diter des fichiers R mais aussi Rmd, Rhtml ou d'autres fichiers "plats" comme dans un bloc-note : .txt, .csv, .md<br>
C'est dans cette fen�tre que s'affiche les aper�us des donn�es g�n�r�s par la fonction `View(data)`. Pour cette fonction comme pour toutes les fonctions qui affichent les donn�es, il est recommand� de se limiter � un �chantillon, en g�n�ral on utilise la fonction `head` => `View(head(data))` pour ne pas prendre de risque. Il est bien s�r possible de param�trer le nombre de lignes � afficher dans la fonction `head`.

## Assignation, appels de fonction
Dans SAS, une �tape data consiste � pr�ciser les donn�es d'entr�e et les donn�es de sortie.
Dans R l'id�e est un peu similaire, 
- on fournit dans les arguments de la fonction, les donn�es d'entr�e.
- la fonction renvoie un r�sultat, par exemple une jointure, ou le calcul d'une variable suppl�mentaire ajout� � la table de originale, ou une table avec des statistiques... Il faut mettre (assigner) dans "sortie" dans objet ! Bien s�r il est possible (et fr�quent) de vouloir remplacer l'objet en entr�e par l'objet en sortie, par exemple lorsqu'on ajoute une variable... pour cela il "suffit" de faire `data = fonction_de_creation_de_nouvelle_variable(data,autre_parametre)`.
ATTENTION : un "oubli" d'assignation `fonction_de_creation_de_nouvelle_variable(data,autre_parametre)` va demander � R de renvoyer dans la log l'int�gralit� de la sortie !!! Ca risque d'�tre long...


## L'environnement
La fen�tre portant ce nom r�f�rence les objets charg�s en m�moire et donne quelques informations sur chaque objet : type, taille...<br>
Avec le bouton en haut � droite de la fen�tre Environment il est possible de passer de List � Grid pour obtenir des informations diff�rentes sur les objets, en particulier la taille (Size). La fonction pour conna�tre la taille d'un objet est `object.size`.<br>

[Consid�rations de niveau avanc�]

L'environnement visible par d�faut est le "Global Environment", comme indiqu� en haut � gauche de la fen�tre d'Environment. Chaque package vient avec son environnement. De m�me chaque appel de fonction d�finit un environnement local qui, le plus souvent, h�rite de l'environnement global.<br>
Ces environnements "virtuels" permettent de faire cohabiter � des endroits distincts des objets partageant le m�me nom.<br>
Par exemple deux fonctions diff�rentes mais portant le m�me nom peuvent exister dans deux packages diff�rents. Dans ce cas il est recommand� de pr�ciser l'environnement env::nom_de_la_fonction.<br>
Si vous voulez en savoir plus sur la manipulation d'environnements vous pouvez jeter un oeil � cette publication : https://rpubs.com/chrisbrunsdon/local2

## Projets
Avant de commencer � travailler sur des donn�es, une bonne pratique est de 
1) Cr�er un dossier associ� � l'�tude dans lequel on place les donn�es
2) Cr�er un "projet" R dans ce dossier en cliquant sur le bouton en haut � droite de la fen�tre RStudio et en choissant "dossier existant", il suffit alors de naviguer jusque dans le dossier de l'�tude. RStudio va alors red�marrer une session dans un nouvel environnement (cf plus loin) sp�cifique � ce projet.
3) Cr�er un script en cliquant sur le bouton en haut � gauche de la fen�tre et sauvegarder ce script dans le dossier du projet.
Vous �tes alors pr�ts � commencer votre �tude avec R.

## L'explorateur de fichier
Il fonctionne comme l'explorateur de fichier Windows sauf qu'il est ouvert par d�faut au niveau du dossier de travail (working directory = wd). Par d�faut c'est dans le wd que les fichiers seront lus/charg�s et �crits/sauvegard�s.<br>
Lorsqu'on cr�e un projet dans RStudio, on d�finit en m�me temps le wd, pas besoin de le changer � la main avec `setwd`.

## Remarque sur wd & env
Les concepts d'environnement + dossier de travail reproduisent les concepts de la work dans SAS : dossier par d�faut.<br>
CEPENDANT, il faut bien diff�rencier les fichiers accessibles dans le wd et les objets charg�s en RAM dans l'environnement.


## Chargement de packages
Cette fen�tre "Packages" est le 3�me onglet de la fen�tre situ�e par d�faut en bas � droite de l'�cran. Elle permet de rechercher un package dans la liste des packages d�j� install�s avec la barre de recherche situ�e en haut � droite de la fen�tre.<br>
Si un package est coch�, cela veut dire qu'il est charg� (attached) dans l'environnement de travail (Global Environment) ie ses fonctions peuvent �tre appel�es directement. Sinon il est possible de les appeler en faisant pr�c�der leur nom de nom_du_package::<br>
En g�n�ral on �vite de charger les packages manuellement, on pr�f�re les appeler dans le script avec la fonction `library`. <br>
Par exemple pour charger le package haven, qui permet de lire des tables SAS, j'�x�cute la ligne `library(haven)`<br>
Si un package n'est pas install� vous pouvez l'installer de deux mani�res diff�rentes : 
- cliquer le bouton `Install` situ� en haut � gauche de la fen�tre, puis saisissez le nom du package � installer. 
- utiliser la fonction `install.packages` en pr�cisant le nom du package � installer.

## Aides sur les fonction
La fen�tre "Help" est le 4�me onglet de la fen�tre situ�e par d�faut en bas � droite de l'�cran. Elle permet de rechercher de l'aide sur une fonction dans la documentation officielle de la fonction. Pour cela il suffit de taper le nom de la fonction dans la barre de recherche situ�e en haut � droite de la fen�tre Help. Vous pouvez aussi appeler la fonction help(nom_de_la_fonction) ou ?nom_de_la_fonction.<br>
La page d'aide est toujours construite de la m�me mani�re !
1) Description br�ve de la ou des fonction(s) document�es
2) Appel par d�faut de la fonction avec d�finition des param�tres par d�faut ou des valeurs possibles
3) Description des arguments de la fonction
4) Facultatif : D�tails
5) Values : Information sur les �l�ments renvoy�s par la fonction
6) Facultatif : References si le package est associ� � une publication par exemple !
7) Examples : la partie la PLUS UTILE de la doc est situ�e � la fin, elle propose des exemples d'utilisation de la fonction sur des jeux de donn�es d'�cole.


## Ouvrir le gestionnaire de t�ches pour surveiller la RAM et les CPUs
Dans R, tous les objets, y compris les donn�es, sont charg�s en RAM, nos PC ont peu de RAM et comme le syst�me d'exploitation est Windows, les objets en RAM ne sont pas "compress�s" par l'OS et il n'existe pas de fichier de SWAP pour passer en m�moire dure lorsque la m�moire vive est d�bord�e.<br>
Il est donc important de surveiller la consommation de RAM de la session et de 
- R�guli�rement supprimer les objets VOLUMINEUX charg�s en RAM (visibles dans l'environnement global) qui ne sont pas utiles.
- V�rifier la taille du fichier � lire/charger avant de le monter en RAM. Par exemple si je dispose de 8Go de RAM et que je veux charger la base MCO RSA du PMSI qui fait 10Go, �a ne marchera pas. La session va tourner en vain et finira par g�n�rer une erreur `cannot allocate vector of size 10Go`.
- Lorsque je supprime un objet je peux utiliser soit le bouton delete dans la fen�tre d'environnement, soit appeler la fonction rm sur l'objet que je souhaite supprimer. Une fois l'objet supprimer, Windows est feignant, la m�moire risque de ne pas �tre lib�r�e imm�diatement, on appelle donc la fonction `gc()` garbage collector, sans argument. Cette bonne pratique est h�rit�e des langages de programmation "bas niveau"" tels que le C.

Alors que faire ?
- Charger une �chantillon de donn�es.
- Anticiper l'empreinte m�moire des op�rations � effectuer. Par exemple je dispose d'une table de 2 colonnes (coordon�es GPS) et 10M de lignes, ne pas calculer brutalement la matrice des distances de taille 10M x 10M !
- Augmenter la RAM en travaillant sur des infrastructures d�port�es dans des machines virtuelles. C'est possible, la DSI s'entra�ne d�j� � le faire, il suffit de d�ployer RStudio Server sur une VM, c'est fait en 10 minutes. Ce qui prend du temps c'est que la DSI accorde des VM avec suffisamment de RAM... La preuve, ce tutoriel en 12 commandes : https://www.vultr.com/docs/how-to-install-rstudio-server-on-centos-7






# Chercher de l'aide sur internet : StackOverflow/StackExchange et les forums Google
## Commande de debugging - lire le traceback
Le sujet est trop avanc� pour cette formation alors je donne un lien : https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-RStudio
Il y a deux messages simples et importants : 
- Lorsqu'on rencontre une erreur, il faut et il suffit de la copier coller dans un moteur de recherche (type google) pour trouver la r�ponse sur stackoverflow dans 99% des cas ! Quelques consignes suppl�mentaires sont donn�es dans la section suivante
- Lorsqu'une erreur appara�t au sein d'une fonction d�finie par l'utilisateur, le `traceback` permet en g�n�ral de conna�tre la ligne � laquelle l'erreur a eu lieu, c'est pratique. 

Voici un exemple reproductible

`test <- function(x){
  print(x[[1]])
  cumsum(x)
  return(x/x)
}
test(data.frame(x=c(1,2,3),y=c("A","B","C")))
traceback()`


## Copier-coller la partie importante de mon erreur
- Si des noms de variable ou des num�ros de lignes/colonnes sont mentionn�s, il n'est probablement pas pertinent de les rappeler.
- Si le message d'erreur est en fran�ais j'aurai sans doute plus de chance en le traduisant en anglais.
- Si le message est tr�s long, il faut chercher les "bons" morceaux de texte.
