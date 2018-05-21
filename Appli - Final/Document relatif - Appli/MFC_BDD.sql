-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 21 mai 2018 à 19:41
-- Version du serveur :  5.6.38
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `gestion_MFC`
--

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `IdClient` int(11) NOT NULL,
  `Prenom` varchar(20) DEFAULT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Adresse` varchar(25) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL,
  `Mail` varchar(25) DEFAULT NULL,
  `Tel` varchar(12) DEFAULT NULL,
  `id_entreprise` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`IdClient`, `Prenom`, `Nom`, `Adresse`, `CP`, `Mail`, `Tel`, `id_entreprise`) VALUES
(1, 'Ventus', 'Ouragan', '9 avenue de la tempête', 67432, 'ventus.ouragan@test.fr', '0132859357', 2),
(2, 'Test', 'Again', '901 boulevard des Champs', 89098, 'test.again@test.com', '0823491321', 3),
(3, 'Bonbon', 'Candy', '129 rue du Sucre', 12390, 'bonbon.candy@hotmail.com', '0389127438', 5),
(4, 'Billet', 'Banque', '29 rue Brinks', 99999, 'billet.banque@.net', '0999999999', 3),
(5, 'Naruto', 'Uzumaki', '1 avenue du Ramen', 12345, 'naruto.uzumaki@.jp', '0812364798', 5),
(6, 'Joke', 'Blague', '101 bis rue du cirque', 66633, 'joke.blague@.net', '0123456789', 1),
(7, 'Futur', 'Passé', '29 boulevard du Présent', 14790, 'futur.passé@.net', '8888888888', 4),
(10, 'Jimmy', 'Rakotomalala', 'Rue Du fougère', 89900, 'rakot@gmail.com', '601135673', 1),
(11, 'Bob', 'Raswoski', '30 rue de la Porte', 89900, 'bob.raswoski@tv.com', '600000000', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE `Entreprise` (
  `IdEntreprise` int(11) NOT NULL,
  `NomEntreprise` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Entreprise`
--

INSERT INTO `Entreprise` (`IdEntreprise`, `NomEntreprise`) VALUES
(1, 'Philips'),
(2, 'Sony'),
(3, 'Google'),
(4, 'Apple'),
(5, 'BTS');

-- --------------------------------------------------------

--
-- Structure de la table `Fiche_d_inscription`
--

CREATE TABLE `Fiche_d_inscription` (
  `IdFiche` int(11) NOT NULL,
  `DateInscription` date DEFAULT NULL,
  `IdClient` int(11) NOT NULL,
  `idSessions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Fiche_d_inscription`
--

INSERT INTO `Fiche_d_inscription` (`IdFiche`, `DateInscription`, `IdClient`, `idSessions`) VALUES
(1, '2018-01-01', 2, 2),
(2, '2018-05-04', 1, 1),
(4, '2018-05-15', 3, 1),
(5, '2018-05-16', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Formateurs`
--

CREATE TABLE `Formateurs` (
  `IdFormateur` int(11) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `Adresse` varchar(25) DEFAULT NULL,
  `CodePostal` int(11) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Formateurs`
--

INSERT INTO `Formateurs` (`IdFormateur`, `Nom`, `Prenom`, `Adresse`, `CodePostal`, `Email`, `Tel`) VALUES
(1, 'Mathématique', 'Algèbre', '0 rue du cercle', 12345, 'math.alg@ecole.net', 128475938),
(2, 'Français', 'Grammaire', '20 rue de la conjugaison', 35802, 'fran.gram@.fr', 603050906),
(3, 'Sport', 'Tennis', '18 rue du Green', 92222, 'Tennis.sport@te.te', 909098765);

-- --------------------------------------------------------

--
-- Structure de la table `Formations`
--

CREATE TABLE `Formations` (
  `IdFormation` int(11) NOT NULL,
  `Libelle` varchar(25) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Niveau` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Formations`
--

INSERT INTO `Formations` (`IdFormation`, `Libelle`, `Description`, `Niveau`) VALUES
(1, 'Figure de style', 'Figures de styles', 'Intermédiaire'),
(2, 'Géométrie dans l\'espace', 'Surprise', 'Avancé');

-- --------------------------------------------------------

--
-- Structure de la table `Salles`
--

CREATE TABLE `Salles` (
  `IdSalle` int(11) NOT NULL,
  `NomSalle` varchar(25) DEFAULT NULL,
  `NbPlace` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Salles`
--

INSERT INTO `Salles` (`IdSalle`, `NomSalle`, `NbPlace`) VALUES
(1, 'Bleue', 23),
(2, 'Rouge', 10),
(3, 'Verte', 50),
(4, 'Jaune', 30);

-- --------------------------------------------------------

--
-- Structure de la table `Sessions`
--

CREATE TABLE `Sessions` (
  `idSessions` int(11) NOT NULL,
  `Lieu` varchar(25) DEFAULT NULL,
  `DateDebSession` date DEFAULT NULL,
  `DateFinSession` date DEFAULT NULL,
  `IdSalle` int(11) NOT NULL,
  `IdFormateur` int(11) NOT NULL,
  `IdFormation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Sessions`
--

INSERT INTO `Sessions` (`idSessions`, `Lieu`, `DateDebSession`, `DateFinSession`, `IdSalle`, `IdFormateur`, `IdFormation`) VALUES
(1, 'IMCP Français', '2018-03-05', '2018-05-17', 2, 2, 1),
(2, 'IMCP Calculette', '2018-06-05', '2018-06-06', 3, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `identifiant` varchar(30) NOT NULL,
  `mdp` varchar(30) NOT NULL,
  `Type` enum('autorise','refuse') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_utilisateur`, `identifiant`, `mdp`, `Type`) VALUES
(1, 'Jimmy', 'rakotomalala', 'autorise'),
(2, 'Joanna', 'rakotomalala', 'refuse');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`IdClient`),
  ADD KEY `FK_Client_id_entreprise` (`id_entreprise`);

--
-- Index pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  ADD PRIMARY KEY (`IdEntreprise`);

--
-- Index pour la table `Fiche_d_inscription`
--
ALTER TABLE `Fiche_d_inscription`
  ADD PRIMARY KEY (`IdFiche`),
  ADD KEY `FK_Fiche_d_inscription_IdClient` (`IdClient`),
  ADD KEY `FK_Fiche_d_inscription_idSessions` (`idSessions`);

--
-- Index pour la table `Formateurs`
--
ALTER TABLE `Formateurs`
  ADD PRIMARY KEY (`IdFormateur`);

--
-- Index pour la table `Formations`
--
ALTER TABLE `Formations`
  ADD PRIMARY KEY (`IdFormation`);

--
-- Index pour la table `Salles`
--
ALTER TABLE `Salles`
  ADD PRIMARY KEY (`IdSalle`);

--
-- Index pour la table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`idSessions`),
  ADD KEY `FK_Sessions_IdFormateur` (`IdFormateur`),
  ADD KEY `FK_Sessions_IdSalle` (`IdSalle`),
  ADD KEY `FK_Sessions_IdFormations` (`IdFormation`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `IdClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  MODIFY `IdEntreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Fiche_d_inscription`
--
ALTER TABLE `Fiche_d_inscription`
  MODIFY `IdFiche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Formateurs`
--
ALTER TABLE `Formateurs`
  MODIFY `IdFormateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Formations`
--
ALTER TABLE `Formations`
  MODIFY `IdFormation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Salles`
--
ALTER TABLE `Salles`
  MODIFY `IdSalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Sessions`
--
ALTER TABLE `Sessions`
  MODIFY `idSessions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `FK_Client_id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `Entreprise` (`IdEntreprise`);

--
-- Contraintes pour la table `Fiche_d_inscription`
--
ALTER TABLE `Fiche_d_inscription`
  ADD CONSTRAINT `FK_Fiche_d_inscription_IdClient` FOREIGN KEY (`IdClient`) REFERENCES `Client` (`IdClient`),
  ADD CONSTRAINT `FK_Fiche_d_inscription_idSessions` FOREIGN KEY (`idSessions`) REFERENCES `Sessions` (`idSessions`);

--
-- Contraintes pour la table `Sessions`
--
ALTER TABLE `Sessions`
  ADD CONSTRAINT `FK_Sessions_IdFormateur` FOREIGN KEY (`IdFormateur`) REFERENCES `Formateurs` (`IdFormateur`),
  ADD CONSTRAINT `FK_Sessions_IdFormations` FOREIGN KEY (`IdFormation`) REFERENCES `Formations` (`IdFormation`),
  ADD CONSTRAINT `FK_Sessions_IdSalle` FOREIGN KEY (`IdSalle`) REFERENCES `Salles` (`IdSalle`);