-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 25 juin 2022 à 00:17
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hackaton`
--

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `ID` int(11) NOT NULL,
  `Type` text NOT NULL,
  `SIRET` int(11) NOT NULL,
  `Nom` text NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `CP` int(11) NOT NULL,
  `Ville` text NOT NULL,
  `Taille` varchar(255) NOT NULL,
  `Activité` varchar(255) NOT NULL,
  `Bio` varchar(255) NOT NULL,
  `Logo` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `id` int(11) NOT NULL,
  `Entreprise1` int(11) NOT NULL,
  `Entreprise2` int(11) NOT NULL,
  `Accepte` tinyint(1) NOT NULL,
  `utileent1` tinyint(1) NOT NULL,
  `utileent2` tinyint(1) NOT NULL,
  `pourquoient1` text NOT NULL,
  `pourquoient2` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Entreprise1` (`Entreprise1`),
  KEY `Entreprise2` (`Entreprise2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(9999) NOT NULL,
  `Entreprise` int(11) NOT NULL,
  `Valide` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Entreprise` (`Entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `ID` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `utilisateur` varchar(255) NOT NULL,
  `reponse` text NOT NULL,
  `valide` tinyint(1) NOT NULL,
  `mis en avant` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `utilisateur` (`utilisateur`),
  KEY `thread` (`thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `soustheme`
--

DROP TABLE IF EXISTS `soustheme`;
CREATE TABLE IF NOT EXISTS `soustheme` (
  `id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Theme` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Theme` (`Theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `thread`
--

DROP TABLE IF EXISTS `thread`;
CREATE TABLE IF NOT EXISTS `thread` (
  `ID` int(11) NOT NULL,
  `soustheme` int(11) NOT NULL,
  `utilisateur` varchar(255) NOT NULL,
  `question` text NOT NULL,
  `Clos` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `soustheme` (`soustheme`),
  KEY `utilisateur` (`utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `Pseudo` varchar(255) NOT NULL,
  `Nom` text NOT NULL,
  `Prenom` text NOT NULL,
  `Fonction` int(11) NOT NULL,
  `Contact email` tinyint(1) NOT NULL,
  `Adresse email` text NOT NULL,
  `Contact tel` tinyint(1) NOT NULL,
  `Numero tel` text NOT NULL,
  `visites` tinyint(1) NOT NULL,
  `Temoignage` tinyint(1) NOT NULL,
  `Entreprise` int(11) NOT NULL,
  PRIMARY KEY (`Pseudo`),
  KEY `Entreprise` (`Entreprise`),
  KEY `Fonction` (`Fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`Entreprise1`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`Entreprise2`) REFERENCES `entreprise` (`ID`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`Entreprise`) REFERENCES `entreprise` (`ID`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`thread`) REFERENCES `thread` (`ID`),
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`Pseudo`);

--
-- Contraintes pour la table `soustheme`
--
ALTER TABLE `soustheme`
  ADD CONSTRAINT `soustheme_ibfk_1` FOREIGN KEY (`Theme`) REFERENCES `theme` (`ID`);

--
-- Contraintes pour la table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`soustheme`) REFERENCES `soustheme` (`id`),
  ADD CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`Pseudo`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`Entreprise`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`Fonction`) REFERENCES `fonction` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
