-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 25 juin 2022 à 10:36
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
(1, 'Entreprise', '32167789000022', 'SOCIETE D\'EXPLOITATION ET DE REAMENAGEMENT DE LA FOSSE MARMITAINE', 'CHE RURAL DU GAL', '76410', 'TOURVILLE-LA-RIVIERE', '', 'Traitement et élimination des déchets dangereux', 'Leader Européen du traitement et de la valorisation des déchets dangereux\r\nVeolia crée SARPI en 1975 pour répondre aux besoins impérieux de traitement des déchets industriels dangereux pour préserver la ressource en eau potable.', 'http://voxworld.thelair.fr/logos/Sarpi_logo.png'),
(2, 'Entreprise', '31194640400044', 'Citeos Rouen', '2 RUE DU STADE', '76140', 'LE PETIT-QUEVILLY', '', 'Autres travaux d\'installation n.c.a.', 'CITEOS Rouen propose et met en œuvre des solutions innovantes,\r\nrespectueuse de l’environnement et adaptées à vos attentes en termes\r\nde performance énergétiques, de mobilité décarbonée, de valorisation et\r\nde protection de l’espace urbain.', 'http://voxworld.thelair.fr/logos/Citeos_logo.png'),
(3, 'Entreprise', '43165406000034', 'Initiales 3D', 'RUE MARYSE BASTIE', '76520', 'BOOS', '', 'Fabrication d\'appareils d\'éclairage électrique', 'INITIALES 3D conçoit, réalise et pose :\r\n\r\nDes solutions de communication visuelle\r\nDes enseignes lumineuses\r\nDe la signalétique \r\nDes façades \r\nDes totems', 'http://voxworld.thelair.fr/logos/initiales3D_logo.png');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `nom`) VALUES
(1, 'Dirigeant'),
(2, 'Responsable RSE'),
(3, 'Responsable énergie'),
(4, 'Responsable QHSE');

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Structure de la table `prestataire`
--

DROP TABLE IF EXISTS `prestataire`;
CREATE TABLE IF NOT EXISTS `prestataire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `theme` int(11) NOT NULL,
  `bio` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `theme` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prestataire`
--

INSERT INTO `prestataire` (`ID`, `nom`, `theme`, `bio`) VALUES
(1, 'Normandie Energies', 2, 'Filière d\'excellence, Normandie Énergies soutient le développement économique du territoire en fédérant plus de 230 acteurs normands de l\'énergie.'),
(2, 'Metropole Rouen Normandie', 7, '');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(9999) NOT NULL,
  `soustheme` int(11) NOT NULL,
  `Entreprise` int(11) NOT NULL,
  `prestataire` int(11) NOT NULL,
  `Valide` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Entreprise` (`Entreprise`),
  KEY `prestataire` (`prestataire`),
  KEY `soustheme` (`soustheme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`ID`, `Nom`, `Description`, `soustheme`, `Entreprise`, `prestataire`, `Valide`) VALUES
(1, 'Panneaux photovoltaïques tracker', 'En décembre 2017, l\'entreprise Citeos a fait installer 350 m2 de panneaux photovoltaiques tracker sur la toiture de son atelier. \r\nIls produisent de l\'électricité depuis mai 2018. Ces panneaux ont la particularité de suivre la course du soleil.\r\n\r\nNous avons été accompagné par la société Normandie Energie.\r\n\r\nNous vous présenterons avec plaisir notre installation sur notre site du Petit Quevilly où nous pourrons également vous faire un retour sur l’installation, l’usage, la rentabilité etc…\r\n', 6, 2, 1, 1),
(2, 'Plan de déplacement d\'entreprise', 'Seraf a mis en place en juin 2021 en collaboration avec la métropole Rouen Normandie un PDE (plan de déplacement d\'entreprise).\r\nNous avons dans ce cadre mis à disposition du personnel des vélos électriques pour leurs trajets domiciles travail ainsi que pour les visites de chantier.\r\n\r\nL\'accompagnement de la métropole nous a permis de bien appréhender les problématiques d\'assurance notamment.\r\n\r\nN\'hésitez pas à entrer en contact avec nous pour échanger plus en détail sur la démarche\r\n', 13, 1, 2, 1);

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
-- Structure de la table `ressources`
--

DROP TABLE IF EXISTS `ressources`;
CREATE TABLE IF NOT EXISTS `ressources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` text NOT NULL,
  `Url` text NOT NULL,
  `Soustheme` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Soustheme` (`Soustheme`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ressources`
--

INSERT INTO `ressources` (`ID`, `Nom`, `Url`, `Soustheme`) VALUES
(1, 'Gestion de l\'eau', 'http://voxworld.thelair.fr//Hackathon_Metropole/ressources/Brochure_GIEC_eau.pdf', 3),
(2, 'Engagement économie circulaire', 'http://voxworld.thelair.fr//Hackathon_Metropole/ressources/Publication-Entreprises-ENTREPRISES-ENGAGEZ-VOUS.pdf', 4),
(3, 'Efficacité énergétique et climat', 'http://voxworld.thelair.fr//Hackathon_Metropole/ressources/Brochure_GIEC_Climat.pdf', 6),
(4, 'Mobilités pour demain', 'http://voxworld.thelair.fr//Hackathon_Metropole/ressources/Brochure_populations_locales.pdf\r\n', 13),
(5, 'Potager urbain', 'https://www.youtube.com/watch?v=t2d40i_rqvU', 11),
(6, 'Mobilité connectée', 'https://youtu.be/GqVH8_gf9uE', 14),
(7, 'Construction bois', 'https://youtu.be/iIl2Qv3y2dw', 5),
(8, 'Rénovation énergétique', 'https://youtu.be/JtjL1_pbGGM', 1);

-- --------------------------------------------------------

--
-- Structure de la table `soustheme`
--

DROP TABLE IF EXISTS `soustheme`;
CREATE TABLE IF NOT EXISTS `soustheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Theme` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Theme` (`Theme`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `soustheme`
--

INSERT INTO `soustheme` (`id`, `Nom`, `Theme`) VALUES
(1, 'Rénovation énergétique', 1),
(2, 'Sobriété énergétique', 2),
(3, 'Gestion différenciée', 3),
(4, 'Economie circulaire', 4),
(5, 'Construction', 1),
(6, 'Efficacité énergétique', 2),
(7, 'Ecopaturage', 3),
(8, 'Gestion des déchets', 4),
(9, 'Green for tech', 5),
(10, 'Tech for human', 5),
(11, 'Circuits courts', 6),
(12, 'Alimentation bio', 6),
(13, 'Mobilités douces', 7),
(14, 'Travail hybride', 7);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`ID`, `Nom`) VALUES
(1, 'Batiment'),
(2, 'Energie'),
(3, 'Biodiversité et Gestion des espaces verts'),
(4, 'Economie circulaire et gestion des déchets'),
(5, 'Numérique responsable'),
(6, 'Alimentation durable'),
(7, 'Mobilité');

-- --------------------------------------------------------

--
-- Structure de la table `thread`
--

DROP TABLE IF EXISTS `thread`;
CREATE TABLE IF NOT EXISTS `thread` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `soustheme` int(11) NOT NULL,
  `utilisateur` int(255) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `Clos` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `soustheme` (`soustheme`),
  KEY `utilisateur` (`utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `thread`
--

INSERT INTO `thread` (`ID`, `soustheme`, `utilisateur`, `titre`, `question`, `Clos`) VALUES
(1, 1, 3, 'Isolation d\'un bâtiment industriel', 'Bonjour,\r\nNous souhaiterions améliorer l\'isolation de notre usine, 1000m2 en structure métallique. Nous avons aujourd\'hui des problèmes d\'inconfort de nos salariés en été avec des températures élevées et une facture \r\nAussi nous souhaiterions avoir des retours d\'expérience sur les chantiers les plus intéressants à mener à ce niveau.d\'énergie très élevée l\'hiver pour maintenir une température acceptable.\r\n', 0);

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
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`Entreprise1`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`Entreprise2`) REFERENCES `entreprise` (`ID`);

--
-- Contraintes pour la table `prestataire`
--
ALTER TABLE `prestataire`
  ADD CONSTRAINT `prestataire_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `theme` (`ID`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`Entreprise`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`prestataire`) REFERENCES `prestataire` (`ID`),
  ADD CONSTRAINT `projet_ibfk_3` FOREIGN KEY (`soustheme`) REFERENCES `soustheme` (`id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`thread`) REFERENCES `thread` (`ID`),
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`ID`);

--
-- Contraintes pour la table `ressources`
--
ALTER TABLE `ressources`
  ADD CONSTRAINT `ressources_ibfk_1` FOREIGN KEY (`Soustheme`) REFERENCES `soustheme` (`id`);

--
-- Contraintes pour la table `soustheme`
--
ALTER TABLE `soustheme`
  ADD CONSTRAINT `soustheme_ibfk_1` FOREIGN KEY (`Theme`) REFERENCES `theme` (`ID`);

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
