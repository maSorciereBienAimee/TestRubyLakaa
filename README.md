# README

Used versions: 
ruby 3.0.2p107
@vue/cli 5.0.8
Rails 6.1.7
yarn 1.22.19

Pour lancer l'application, lancer le backend depuis la racine avec la commande 
$ rails s
puis lancer le backend :
$ cd vuejs && yarn dev

On peut egalement utiliser le script ./start
Une fois lancee, rendez vous dans un navigateur sur l' addresse indiquee sur le terminal frontend.

On entre par une page d' acceuille tres rudimentaires qui nous oriente vers 2 pages : AddCollect qui permet d' ajouter une collecte, et SeeCollect qui permet de voir l' ensemble des collect et d' ajouter et d' enlever des indicateur (cela se fait via une popup)

L' affichage est a ameliorer (pas de gestion des overflow de page, affichage rudimentaire, peu lisible, l' application n' est pas responsive)

L' application doit recevoir des am'eliorations, notamment d' optimisation, et de securite.



Elle utilise une base de donnee possedant 2 tables, une pour les collectes et l' autre pour les indicateurs.
chaques collectes pouvant avoir des indicateurs differents, la derniere colonne de la table collect recoit une string qui peut eventuellement contenir l' ensemble de indicateurs. J' ai trouve cette technique plus flexible et peut etre moins lourde qu' une relation many-to-many. Cela reste a discuter. On pourrait aussi parvenir a stocker l' information directement en json plutot que sous forme de string.
Les indicateurs sont eux meme ajoute sous forme de string, on pourrait permettre de laisser le choix a l' utilisateur de donner un type particulier a un indicateur.