# Webscraping
## Déjà vu
Ce n'est sans doute pas la première fois que vous entendez parler de webscraping puisque c'etait le thème du premier Séminaire GUEPARD le 14 mars 2018.
<a href="https://gitlab.com/DREES_code/OUTILS/seminaires-guepard/tree/master/scraping%20FINESS%20avec%20R">Voici la documentation de l'exemple en R</a>.<br>
<a href="https://gitlab.com/DREES_code/OUTILS/seminaires-guepard/tree/master">Voici la page de référencement des codes des différents séminaires GUEPARD</a><br>

## Définition
Le terme est désignait initialement l'absorption d'un site web par un "robot". C'est le travail réalisé par un moteur de recherche qui doit indéxer "tous" les sites web pour les restituer à l'utilisateur de manière cohérente.<br>
Dans notre cas ce qui nous intéresse est souvent un élément spécifique d'une page ou d'un formulaire web.<br>

## Exemple de scraping d'une page statique
Si on souhaite récupérer une table dans une page web on peut bien sûr le faire à la main. Exemple : https://en.wikipedia.org/wiki/Lists_of_communes_of_France.<br>
Dans ce cas, le seul intérêt d'automatiser la récupération de la page web est de garder une trace reproductible du processus.<br>
`
library(rvest)
url="https://en.wikipedia.org/wiki/Lists_of_communes_of_France"
page_wikipedia=read_html(url)
page_wikipedia%>%html_node(".wikitable")%>%html_table()
`
Comment ça marche ?

# Comprendre une page web 
## HTML, CSS, JS et navigateur web
Il existe de nombreux site proposant des cours en ligne gratuits dits MOOC (massive open online courses). <br>
<a href="https://openclassrooms.com/courses/apprenez-a-creer-votre-site-web-avec-html5-et-css3">Voici</a> un exemple d'un tel cours en français :<br> 
En accéléré ça donne : 
- je tente de me connecter à une URL, par exemple google.com
- pour cela j'ouvre mon navigateur, c'est à dire un "client" web, et j'entre cette URL (sauf si c'est déjà ma page d'accueil)
- la requête est transmise au bon "serveur" web par correspondance entre DNS et IP comme illustré <a href="http://get-site-ip.com/">ici</a>
- le "serveur" web traite ma requête et me renvoie un ensemble de fichiers qui constituent la page web à afficher
- lorsqu'une URL est "résolue", le serveur web renvoie une page web constituée de fichiers HTML, CSS et JS à mon navigateur qui s'occupe de composer le rendu final avec ces fichiers.
- disons maitenant que je souhaite rechercher quelque chose dans Google, par exemple je cherche le mot "DREES", j'effectue ma saisie dans le formulaire de recherche (`form`)
- je lance ma recherche, ce qui construit une <a href="https://www.google.fr/search?q=DREES&rlz=1C1GGRV_enFR784FR784&oq=DREES&aqs=chrome..69i57j69i60l5.1996j0j8&sourceid=chrome&ie=UTF-8">nouvelle URL</a> à resoudre
- certains site web, par exemple ceux réalisés en Flash, utilisent d'autres techniques pour résoudre un formulaire sans modifier l'URL, mais pour comprendre comment ça fonctionne il faut en savoir un peu plus sur la construction d'une page web.

Le HTML définit le contenu statique et l'organisation de la page web.<br>
Le CSS définit les styles (polices, couleurs...) et la mise en page de la page web.<br>
Le JS ou javascript éxécute des fonctions telles que l'envoie de formulaire ou l'interactivité d'une page.<br>

## Chercher un élément avec l'inspecteur d'élément

Un élément devenu crucial dans les navigateurs web est l'inspecteur d'éléments. <br>
Il permet de surveiller tout ce qui se passe dans la page web côté "client".<br>
Ce qui nous intéresse pour le webscraping est de comprendre la construction de la page HTML.<br>
On a besoin de quelques concepts pour s'y retrouver : 
- les balises ou tags par exemple div, a, h1, p, script, img, form, iframe (page web dans une page web)
- les identifiants des balises id qui permettent de retrouver un tag par son identifiant
- les classes des tags qui définissent les styles CSS à appliquer mais aussi de retrouver les éléments par leur classe




## Cas général
La plupart du temps on utilise des outils de webscraping pour automatiser une procédure répétitive.<br>
Par exemple si je souhaite récupérer la correspondance entre les lieux-dits et communes pour un ensemble de lieux-dits donc je ne connais pas le code commune dans le PMSI.<br>
https://territoires-fr.fr/lieux-list1.php<br>

## Ouverture
N'importe quel site web peut être "scrapé" mais
- Légalité : il faut vérifier le fichier robot.txt et lire les CGU/CGV.
- Efficience : parfois les données sont déjà mises à disposition dans un format structuré.
- Nuisance : scraper une page web c'est en général lui imposer un volume important de requêtes, plus important que celui d'un utilisateur qui naviguera sur la page web. Ceci peut générer un déni de service (DoS) qui justifie que le serveur bloque l'utilisateur nuisible. En général on bloque en utilisant l'IP ou par les cookies. Un autre moyen consiste à vérifier qu'il s'agit d'un "vrai" utilisateur en imposant un "captcha".

Il existe plusieurs frameworks web de programmation qui aboutissent à des paradigmes de scraping très différents. 
- construction de l'adresse IP facilement lisible
- envoi d'un formulaire avec <form action>
- déclenchement d'actions tels que des clics, déplacements de souris...
Pour contrecarrer le scraping et protéger leur fonds de commerce (les données) les sites mettent au point des stratégies toujours plus complexes.<br>
MAIS en général ces mêmes sites, comme Google, mondocteur.fr ou les pages jaunes sont construits par scraping !<br>
Donc les outils de scraping évoluent au même rythme que les moyens de protection contre scraping.<br>
Même un captcha n'est pas toujours suffisant : <br>  <a href="https://www.scrapehero.com/how-to-solve-simple-captchas-using-python-tesseract/">cet article</a> utilise python+Tesseract, bien sûr Tesseract dispose également d'une API R, le package R s'appelle tesseract.<br>

Pour des besoins de scraping avancé on peut facilement trouver une liste d'outils à la pointe, par exemple <a href="https://medium.com/datadriveninvestor/best-data-scraping-tools-for-2018-top-10-reviews-558cc5a4992f">ici</a>.<br>
Pour l'anecdote, le projet EIG SocialConnect porté par la CGET est en grande partie un projet de scraping de sites d'innovateurs sociaux dans le but de les référencer dans un site central. Vous pouvez y jeter un oeil <a href="http://www.carrefourdesinnovationssociales.fr/">ici</a>.



