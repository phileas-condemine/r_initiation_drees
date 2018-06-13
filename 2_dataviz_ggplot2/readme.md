# Gallerie de graphes avec ggplot2
Il suffit de recherche "ggplot2" dans Google pour trouver des dizaines de sites qui recensent des applications de ggplot2 esthétiques et parfois inattendues.

## Approche didactique avec le code sur datacamp : 
https://www.datacamp.com/community/tutorials/top-5-r-graphics

## Approche par l'exemple
### r-graph-gallery
https://www.r-graph-gallery.com/portfolio/ggplot2-package/
Cliquer sur le graph qui vous intéresse pour voir le code associé
### r-statistics
http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
### D'autres exemples
https://github.com/sefakilic/ggplot-cheatsheet


Un exemple inspirant : 
Recherche "ggplot2 scatterplot lm confidence interval" dans Google pour retrouver le code 
- <a href="https://rstudio-pubs-static.s3.amazonaws.com/195401_20b3272a8bb04615ae7ee4c81d18ffb5.html">résultat 2</a>
`ggplot(cars, aes(x=speed, y=dist)) + 
  geom_point(color='#2980B9', size = 4) + 
  geom_smooth(method=lm, color='#2C3E50')`
  
- <a href=""> résultat 3 </a>

## Cheatsheet, antisèche avec un aperçu de toutes les couches/layers ggplot2
https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# Eléments théoriques
## Changement de paradigme
### Axe(s) des ordonnées 

Dans ggplot2 il y a NORMALEMENT un seul axe des ordonnées. <br>
MAIS si on veut vraiment, il est possible d'ajouter un second axe mais ce n'est pas "naturel", un exemple ici https://rpubs.com/MarkusLoew/226759.<br>
### Couches ou layers
ggplot2 permet de superposer des graphiques, des options, des thèmes en les ajoutant couche par couche. En général on procède dans cet ordre : 
- Initialisation d'un objet ggplot2 avec `ggplot()`. En général on définit les données à grapher et les coordonnées communes à toutes les couches graphiques ici
- Ajout d'une ou plusieurs couche(s) graphique(s) geom_ telle(s) que `geom_point()` `geom_line()` `geom_bar()` `geom_col()` `geom_smooth()`
- Modification de la légende et des axes avec `themes()` `scale_`
Remarque, pour des graphes simples, on utilise parfois qplot pour exprimer en un seul appel de fonction l'initialisation de l'objet et la couche graphique.

### aes pour gérer les paramètres visuels
aes, comme aesthetics permet de définir les paramètres visuels : 
- x pour les abscisses, 
- y pour les ordonnées, 
- label pour le text, 
- color pour les couleurs en groupes ou continu selon le type de la variable, 
- fill pour le remplissage des couleurs en groupes ou continu selon le type de la variable, 
- alpha pour la transparence.





Quelques applications aux données FINESS + INSEE dans grammar_of_graphics.Rmd

1) ggplot2 pour des graphes statiques hautement paramétrables. <br>
Une thème (charte graphique) DREES a déjà été défini pour les graphes ggplot2 et pour les apps Shiny, il suffit de le reprendre sur les graphes des apps Shiny Projection effictifs médecins, Conditions de vie des enfants ou encore dataviz Enquête CARE-M.

2) plotly/ggplotly pour rendre le graph interactif<br>
passage du + au %>% ?

3) leaflet pour réaliser des cartographies interactives

4) Pour avoir plus d'infos sur les possibilités de cartogrpahie avec R, consulter le doc de Kim Antunez présenté en séminaire GUEPARD le 8 juin 2018.
Cette présentation montre des différentes méthodes de cartographie statiques, dynamiques ou interactives.