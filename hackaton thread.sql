-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 25 juin 2022 à 09:40
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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateurs` (`ID`),
  ADD CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`soustheme`) REFERENCES `soustheme` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
