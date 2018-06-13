# Webscraping
## D�j� vu
Ce n'est sans doute pas la premi�re fois que vous entendez parler de webscraping puisque c'etait le th�me du premier S�minaire GUEPARD le 14 mars 2018.
<a href="https://gitlab.com/DREES_code/OUTILS/seminaires-guepard/tree/master/scraping%20FINESS%20avec%20R">Voici la documentation de l'exemple en R</a>.<br>
<a href="https://gitlab.com/DREES_code/OUTILS/seminaires-guepard/tree/master">Voici la page de r�f�rencement des codes des diff�rents s�minaires GUEPARD</a><br>

## D�finition
Le terme est d�signait initialement l'absorption d'un site web par un "robot". C'est le travail r�alis� par un moteur de recherche qui doit ind�xer "tous" les sites web pour les restituer � l'utilisateur de mani�re coh�rente.<br>
Dans notre cas ce qui nous int�resse est souvent un �l�ment sp�cifique d'une page ou d'un formulaire web.<br>

## Exemple de scraping d'une page statique
Si on souhaite r�cup�rer une table dans une page web on peut bien s�r le faire � la main. Exemple : https://en.wikipedia.org/wiki/Lists_of_communes_of_France.<br>
Dans ce cas, le seul int�r�t d'automatiser la r�cup�ration de la page web est de garder une trace reproductible du processus.<br>
`
library(rvest)
url="https://en.wikipedia.org/wiki/Lists_of_communes_of_France"
page_wikipedia=read_html(url)
page_wikipedia%>%html_node(".wikitable")%>%html_table()
`
Comment �a marche ?

# Comprendre une page web 
## HTML, CSS, JS et navigateur web
Il existe de nombreux site proposant des cours en ligne gratuits dits MOOC (massive open online courses). <br>
<a href="https://openclassrooms.com/courses/apprenez-a-creer-votre-site-web-avec-html5-et-css3">Voici</a> un exemple d'un tel cours en fran�ais :<br> 
En acc�l�r� �a donne : 
- je tente de me connecter � une URL, par exemple google.com
- pour cela j'ouvre mon navigateur, c'est � dire un "client" web, et j'entre cette URL (sauf si c'est d�j� ma page d'accueil)
- la requ�te est transmise au bon "serveur" web par correspondance entre DNS et IP comme illustr� <a href="http://get-site-ip.com/">ici</a>
- le "serveur" web traite ma requ�te et me renvoie un ensemble de fichiers qui constituent la page web � afficher
- lorsqu'une URL est "r�solue", le serveur web renvoie une page web constitu�e de fichiers HTML, CSS et JS � mon navigateur qui s'occupe de composer le rendu final avec ces fichiers.
- disons maitenant que je souhaite rechercher quelque chose dans Google, par exemple je cherche le mot "DREES", j'effectue ma saisie dans le formulaire de recherche (`form`)
- je lance ma recherche, ce qui construit une <a href="https://www.google.fr/search?q=DREES&rlz=1C1GGRV_enFR784FR784&oq=DREES&aqs=chrome..69i57j69i60l5.1996j0j8&sourceid=chrome&ie=UTF-8">nouvelle URL</a> � resoudre
- certains site web, par exemple ceux r�alis�s en Flash, utilisent d'autres techniques pour r�soudre un formulaire sans modifier l'URL, mais pour comprendre comment �a fonctionne il faut en savoir un peu plus sur la construction d'une page web.

Le HTML d�finit le contenu statique et l'organisation de la page web.<br>
Le CSS d�finit les styles (polices, couleurs...) et la mise en page de la page web.<br>
Le JS ou javascript �x�cute des fonctions telles que l'envoie de formulaire ou l'interactivit� d'une page.<br>

## Chercher un �l�ment avec l'inspecteur d'�l�ment

Un �l�ment devenu crucial dans les navigateurs web est l'inspecteur d'�l�ments. <br>
Il permet de surveiller tout ce qui se passe dans la page web c�t� "client".<br>
Ce qui nous int�resse pour le webscraping est de comprendre la construction de la page HTML.<br>
On a besoin de quelques concepts pour s'y retrouver : 
- les balises ou tags par exemple div, a, h1, p, script, img, form, iframe (page web dans une page web)
- les identifiants des balises id qui permettent de retrouver un tag par son identifiant
- les classes des tags qui d�finissent les styles CSS � appliquer mais aussi de retrouver les �l�ments par leur classe




## Cas g�n�ral
La plupart du temps on utilise des outils de webscraping pour automatiser une proc�dure r�p�titive.<br>
Par exemple si je souhaite r�cup�rer la correspondance entre les lieux-dits et communes pour un ensemble de lieux-dits donc je ne connais pas le code commune dans le PMSI.<br>
https://territoires-fr.fr/lieux-list1.php<br>

## Ouverture
N'importe quel site web peut �tre "scrap�" mais
- L�galit� : il faut v�rifier le fichier robot.txt et lire les CGU/CGV.
- Efficience : parfois les donn�es sont d�j� mises � disposition dans un format structur�.
- Nuisance : scraper une page web c'est en g�n�ral lui imposer un volume important de requ�tes, plus important que celui d'un utilisateur qui naviguera sur la page web. Ceci peut g�n�rer un d�ni de service (DoS) qui justifie que le serveur bloque l'utilisateur nuisible. En g�n�ral on bloque en utilisant l'IP ou par les cookies. Un autre moyen consiste � v�rifier qu'il s'agit d'un "vrai" utilisateur en imposant un "captcha".

Il existe plusieurs frameworks web de programmation qui aboutissent � des paradigmes de scraping tr�s diff�rents. 
- construction de l'adresse IP facilement lisible
- envoi d'un formulaire avec <form action>
- d�clenchement d'actions tels que des clics, d�placements de souris...
Pour contrecarrer le scraping et prot�ger leur fonds de commerce (les donn�es) les sites mettent au point des strat�gies toujours plus complexes.<br>
MAIS en g�n�ral ces m�mes sites, comme Google, mondocteur.fr ou les pages jaunes sont construits par scraping !<br>
Donc les outils de scraping �voluent au m�me rythme que les moyens de protection contre scraping.<br>
M�me un captcha n'est pas toujours suffisant : <br>  <a href="https://www.scrapehero.com/how-to-solve-simple-captchas-using-python-tesseract/">cet article</a> utilise python+Tesseract, bien s�r Tesseract dispose �galement d'une API R, le package R s'appelle tesseract.<br>

Pour des besoins de scraping avanc� on peut facilement trouver une liste d'outils � la pointe, par exemple <a href="https://medium.com/datadriveninvestor/best-data-scraping-tools-for-2018-top-10-reviews-558cc5a4992f">ici</a>.<br>
Pour l'anecdote, le projet EIG SocialConnect port� par la CGET est en grande partie un projet de scraping de sites d'innovateurs sociaux dans le but de les r�f�rencer dans un site central. Vous pouvez y jeter un oeil <a href="http://www.carrefourdesinnovationssociales.fr/">ici</a>.



