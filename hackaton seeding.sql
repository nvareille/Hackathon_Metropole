-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 25 juin 2022 à 07:55
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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` text NOT NULL,
  `SIRET` varchar(14) NOT NULL,
  `Nom` text NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `CP` text NOT NULL,
  `Ville` text NOT NULL,
  `Taille` varchar(255) NOT NULL,
  `Activité` varchar(255) NOT NULL,
  `Bio` varchar(255) NOT NULL,
  `Logo` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`ID`, `Type`, `SIRET`, `Nom`, `Adresse`, `CP`, `Ville`, `Taille`, `Activité`, `Bio`, `Logo`) VALUES
(1, 'Entreprise', '32167789000022', 'SOCIETE D\'EXPLOITATION ET DE REAMENAGEMENT DE LA FOSSE MARMITAINE', 'CHE RURAL DU GAL', '76410', 'TOURVILLE-LA-RIVIERE', '', 'Traitement et élimination des déchets dangereux', 'Leader Européen du traitement et de la valorisation des déchets dangereux\r\nVeolia crée SARPI en 1975 pour répondre aux besoins impérieux de traitement des déchets industriels dangereux pour préserver la ressource en eau potable.', ''),
(2, 'Entreprise', '31194640400044', 'Citeos Rouen', '2 RUE DU STADE', '76140', 'LE PETIT-QUEVILLY', '', 'Autres travaux d\'installation n.c.a.', 'CITEOS Rouen propose et met en œuvre des solutions innovantes,\r\nrespectueuse de l’environnement et adaptées à vos attentes en termes\r\nde performance énergétiques, de mobilité décarbonée, de valorisation et\r\nde protection de l’espace urbain.', ''),
(3, 'Entreprise', '43165406000034', 'Initiales 3D', 'RUE MARYSE BASTIE', '76520', 'BOOS', '', 'Fabrication d\'appareils d\'éclairage électrique', 'INITIALES 3D conçoit, réalise et pose :\r\n\r\nDes solutions de communication visuelle\r\nDes enseignes lumineuses\r\nDe la signalétique \r\nDes façades \r\nDes totems', '');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(9999) NOT NULL,
  `Entreprise` int(11) NOT NULL,
  `Valide` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Entreprise` (`Entreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`ID`, `Nom`, `Description`, `Entreprise`, `Valide`) VALUES
(1, 'Panneaux photovoltaïques tracker', 'En décembre 2017, l\'entreprise Citeos a fait installer 350 m2 de panneaux photovoltaiques tracker sur la toiture de son atelier. \r\nIls produisent de l\'électricité depuis mai 2018. Ces panneaux ont la particularité de suivre la course du soleil.\r\n\r\nNous avons été accompagné par la société Normandie Energie.\r\n\r\nNous vous présenterons avec plaisir notre installation sur notre site du Petit Quevilly où nous pourrons également vous faire un retour sur l’installation, l’usage, la rentabilité etc…\r\n', 2, 1),
(2, 'Plan de déplacement d\'entreprise', 'Seraf a mis en place en juin 2021 en collaboration avec la métropole Rouen Normandie un PDE (plan de déplacement d\'entreprise).\r\nNous avons dans ce cadre mis à disposition du personnel des vélos électriques pour leurs trajets domiciles travail ainsi que pour les visites de chantier.\r\n\r\nL\'accompagnement de la métropole nous a permis de bien appréhender les problématiques d\'assurance notamment.\r\n\r\nN\'hésitez pas à entrer en contact avec nous pour échanger plus en détail sur la démarche\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `thread` int(11) NOT NULL,
  `utilisateur` int(255) NOT NULL,
  `reponse` text NOT NULL,
  `valide` tinyint(1) NOT NULL,
  `mis en avant` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `utilisateur` (`utilisateur`),
  KEY `thread` (`thread`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`ID`, `thread`, `utilisateur`, `reponse`, `valide`, `mis en avant`) VALUES
(1, 1, 1, 'Mettez des pulls l\'hiver et ne travaillez pas en période de canicule !', 0, 0),
(2, 1, 2, 'Pour lutter contre les fortes chaleurs estivales, vous pourriez faire repeindre le toit de votre usine en blanc avec le prestataire cool roof qui nous a accompagné dans cette démarche: https://www.coolroof-france.com/?gclid=CjwKCAjwwdWVBhA4EiwAjcYJEOFoA467hSi4yej70bUAp21U7N6zCnKZqn4SPgSf-b7OirrPmiJNjhoCLncQAvD_BwE\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `thread`
--

DROP TABLE IF EXISTS `thread`;
CREATE TABLE IF NOT EXISTS `thread` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `soustheme` int(11) NOT NULL,
  `utilisateur` int(255) NOT NULL,
  `question` text NOT NULL,
  `Clos` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `soustheme` (`soustheme`),
  KEY `utilisateur` (`utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `thread`
--

INSERT INTO `thread` (`ID`, `soustheme`, `utilisateur`, `question`, `Clos`) VALUES
(1, 1, 3, 'Bonjour,\r\nNous souhaiterions améliorer l\'isolation de notre usine, 1000m2 en structure métallique. Nous avons aujourd\'hui des problèmes d\'inconfort de nos salariés en été avec des températures élevées et une facture \r\nAussi nous souhaiterions avoir des retours d\'expérience sur les chantiers les plus intéressants à mener à ce niveau.d\'énergie très élevée l\'hiver pour maintenir une température acceptable.\r\n', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
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
  PRIMARY KEY (`ID`),
  KEY `Entreprise` (`Entreprise`),
  KEY `Fonction` (`Fonction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID`, `pseudo`, `Nom`, `Prenom`, `Fonction`, `Contact email`, `Adresse email`, `Contact tel`, `Numero tel`, `visites`, `Temoignage`, `Entreprise`) VALUES
(1, 'Cedric', 'L\'elchat', 'Cédric', 2, 0, '', 1, '0607080910', 1, 0, 1),
(2, 'FX', 'Joannard', 'François-Xavier', 1, 1, 'FX@citeosrouen.fr', 0, '', 1, 1, 2),
(3, 'PascalB', 'Bossey', 'Pascal', 1, 1, 'pb@ini.fr', 0, '', 0, 0, 3);

--
-- Contraintes pour les tables déchargées
--

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
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`ID`);

--
-- Contraintes pour la table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`ID`),
  ADD CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`soustheme`) REFERENCES `soustheme` (`id`);

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
