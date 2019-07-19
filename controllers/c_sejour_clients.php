<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');
	
	$oSmarty->assign('allClients', 		SejoursClients::getAll				($pdo, $param['paramkey']));
	$oSmarty->assign('allPrestations', 	SejoursClients::getSejourLines		($pdo, $param['paramkey']));
	$oSmarty->assign('paramindex', 		( isset($param['paramindex']) ? $param['paramindex'] : '0' ) );		// repositionnement sur client
	
// 	$oSmarty->assign('addClients', 		Clients::getAllIn	($pdo));
	$oSmarty->assign('addPrestations', 	Prestations::getAll	($pdo));

/*
 * 
- nom :  tout majuscules
- prénom : 1ère majuscule+minuscules
- ville : majuscules

* suivi séjours
  /- remplacement acompte par règlement simple, avec saisie date (jour
    par défaut), montant > 0
  /- numérotation des participants
  /- ajout de colonnes participants : total commande/facture, solde
  /- ajout d'un  bouton édition des factures (soldées)
  /- suppression des écrans de confirmation, sauf édition
  /- ajout des participants par combo/recherche

* séjours
  /- ajout d'un bouton 'Réédition des factures'
    
* clients
  /- combo 'ajouter au séjour' sur client existant
  /- export format Excel CSV sans sélection

* règlements
  /- saisie de la date (jour par défaut)
  /- montant libre y compris négatif (avoirs)
  
  
 * 
 * Au sujet du point 20, vous pouvez supprimer la colonne "ville" et "mail individuel" mais je dois conserver un bouton
 *   "Mail" qui m'ouvre une fenêtre
 * 
 * Dans la fiche "suivi de séjour", il manque dans le tableau des participants les 2 colonnes : "Total" et "solde" 
 * (différence entre total et total réglé). C'est une vue globale des participants en fin de séjour qui nous permet
 *  de demander les réglements avant l'édition des factures
 *  
 *  En dehors de la confirmation de l'édition définitive de la facture et de la suppression d'un client, 
 *  je n'ai pas besoin de toutes les fenêtres intermédiaires de confirmation de suppression 
 *  (suppression de prestation, attribution de règlement…)
 *  
 *  Lorsque je modifie le profil d'un client , je n'ai plus accès à la combo box  :" inscrire au séjour"
 *  
 *  Normalement j'utilise la fonction "saisie d'un règlement" uniquement pour gérer les réglements multiples
 *   de plusieurs curistes. Tous les réglements "simples" sont ajoutés dans la fiche "suivi de séjour" 
 *   à la place de "Acompte".Pouvez-vous remplacer le terme "Acompte" par règlement et laisser cette option 
 *   tant que le solde du curiste n'est pas réglé?. Il faut remplacer "validez vous l'acompte et la confirmation
 *    de l'inscription ?" par "validez-vous ce règlement" ?. Au 1er réglement, la personne est confirmée. 
 *    Je peux ainsi de nouveau gérer tous les curistes et les réglements depuis la fiche "suivi du séjour"
 *    
 * Dans la fiche "suivi de séjour" :lorsque tous les soldes sont à 0 dans le tableau des participants, 
 * j'avais un bouton, "édition des factures" qui 
 * me permettais d'éditer toutes les factures en même temps sans repasser un par un sur tous les clients.
 * 
 * 
Tout au long du séjour, les clients commandent des prestations, soins, produits.
Je ne prépare donc pas les devis en début de séjour car cela change en permanence.
Je prépare les devis globaux le vendredi matin (j'ai ~une heure pour le faire avec l'édition des devis) entre l'accueil
 des curistes puis les soins.
Je dois ensuite éditer les factures définitives le vendredi soir après ma conférence.
C'est à dire que je rentre vers 21h00 mini et que j'ai encore 1h de travail et de concentration maxi.
Le samedi matin, je démarre à 8h00 ou 7h00 selon la saison et les factures doivent être prêtes pour être distribuées 
aux curistes qui partent entre 10h00 et 13h00.

A chaque fois j'ai ceci à faire pour 16 ou 17 curistes.
Chaque minute est précieuse surtout lorsque vous le faites tard le soir ou tôt le matin et que vous avez aussi 
une vie de famille.
Tous les points décrits ci-dessous sont une optimisation de mon temps qui existait dans le précédent logiciel et 
c'est vraiment dommage que vous n'ayez pas retrouvé ces fonctions à la reprise.
Le point 17 est très utile pour moi car il me permet d'ajouter les règlements depuis la fiche du curiste lorsque 
je prépare les devis ou factures et de ne pas repartir en fonction recherche dans l'ajout des règlements
Le point 18 est très utile car à la réception des fiches clientes, je dois ajouter en général la date de naissance 
ou autres données et que je peux les inscrire au séjour sans repasser par "liste des séjours, rechercher..."
Le point 19 me fait perdre du temps.
Le point 20 et 21 est indispensable pour la gestion de notre travail.
 */
?>