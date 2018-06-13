# Gallerie de graphes avec ggplot2
Il suffit de recherche "ggplot2" dans Google pour trouver des dizaines de sites qui recensent des applications de ggplot2 esth�tiques et parfois inattendues.

## Approche didactique avec le code sur datacamp : 
https://www.datacamp.com/community/tutorials/top-5-r-graphics

## Approche par l'exemple
### r-graph-gallery
https://www.r-graph-gallery.com/portfolio/ggplot2-package/
Cliquer sur le graph qui vous int�resse pour voir le code associ�
### r-statistics
http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
### D'autres exemples
https://github.com/sefakilic/ggplot-cheatsheet


Un exemple inspirant : 
Recherche "ggplot2 scatterplot lm confidence interval" dans Google pour retrouver le code 
- <a href="https://rstudio-pubs-static.s3.amazonaws.com/195401_20b3272a8bb04615ae7ee4c81d18ffb5.html">r�sultat 2</a>
`ggplot(cars, aes(x=speed, y=dist)) + 
  geom_point(color='#2980B9', size = 4) + 
  geom_smooth(method=lm, color='#2C3E50')`
  
- <a href=""> r�sultat 3 </a>

## Cheatsheet, antis�che avec un aper�u de toutes les couches/layers ggplot2
https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# El�ments th�oriques
## Changement de paradigme
### Axe(s) des ordonn�es 

Dans ggplot2 il y a NORMALEMENT un seul axe des ordonn�es. <br>
MAIS si on veut vraiment, il est possible d'ajouter un second axe mais ce n'est pas "naturel", un exemple ici https://rpubs.com/MarkusLoew/226759.<br>
### Couches ou layers
ggplot2 permet de superposer des graphiques, des options, des th�mes en les ajoutant couche par couche. En g�n�ral on proc�de dans cet ordre : 
- Initialisation d'un objet ggplot2 avec `ggplot()`. En g�n�ral on d�finit les donn�es � grapher et les coordonn�es communes � toutes les couches graphiques ici
- Ajout d'une ou plusieurs couche(s) graphique(s) geom_ telle(s) que `geom_point()` `geom_line()` `geom_bar()` `geom_col()` `geom_smooth()`
- Modification de la l�gende et des axes avec `themes()` `scale_`
Remarque, pour des graphes simples, on utilise parfois qplot pour exprimer en un seul appel de fonction l'initialisation de l'objet et la couche graphique.

### aes pour g�rer les param�tres visuels
aes, comme aesthetics permet de d�finir les param�tres visuels : 
- x pour les abscisses, 
- y pour les ordonn�es, 
- label pour le text, 
- color pour les couleurs en groupes ou continu selon le type de la variable, 
- fill pour le remplissage des couleurs en groupes ou continu selon le type de la variable, 
- alpha pour la transparence.





Quelques applications aux donn�es FINESS + INSEE dans grammar_of_graphics.Rmd

1) ggplot2 pour des graphes statiques hautement param�trables. <br>
Une th�me (charte graphique) DREES a d�j� �t� d�fini pour les graphes ggplot2 et pour les apps Shiny, il suffit de le reprendre sur les graphes des apps Shiny Projection effictifs m�decins, Conditions de vie des enfants ou encore dataviz Enqu�te CARE-M.

2) plotly/ggplotly pour rendre le graph interactif<br>
passage du + au %>% ?

3) leaflet pour r�aliser des cartographies interactives

4) Pour avoir plus d'infos sur les possibilit�s de cartogrpahie avec R, consulter le doc de Kim Antunez pr�sent� en s�minaire GUEPARD le 8 juin 2018.
Cette pr�sentation montre des diff�rentes m�thodes de cartographie statiques, dynamiques ou interactives.