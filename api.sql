-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 19 mars 2023 à 19:37
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `api`
--

-- --------------------------------------------------------



CREATE TABLE `restauranttable` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shiftType` tinyint(1) NOT NULL DEFAULT 0,
  `shiftClosed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `serviceusers` (
  `id_service` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENG
INE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `tabletips` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tips` int(11) DEFAULT NULL,
  `id_restaurantTable` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `tipspayments` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `restauranttable`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `serviceusers`
  ADD KEY `fk_serviceUsers_services` (`id_service`),
  ADD KEY `fk_serviceUsers_users` (`id_user`);

ALTER TABLE `tabletips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tableTips_restaurantTable` (`id_restaurantTable`),
  ADD KEY `fk_tableTips_services` (`id_service`);

ALTER TABLE `tipspayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipsPayments_users` (`id_user`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `restauranttable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tabletips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipspayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `serviceusers`
  ADD CONSTRAINT `fk_serviceUsers_services` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_serviceUsers_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `tabletips`
  ADD CONSTRAINT `fk_tableTips_restaurantTable` FOREIGN KEY (`id_restaurantTable`) REFERENCES `restauranttable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tableTips_services` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `tipspayments`
  ADD CONSTRAINT `fk_tipsPayments_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

INSERT INTO `services` (`id`, `created_at`, `modified_at`, `shiftType`, `shiftClosed`) VALUES
(1, '2023-03-19 18:32:17', '2023-03-19 18:32:17', 1, 0);



-- Déchargement des données de la table `users`
--
--
-- Index pour les tables déchargées
--

--
-- Index pour la table `restauranttable`
--

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `serviceusers`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
INSERT INTO `users` (`id`, `created_at`, `modified_at`, `firstname`, `lastname`, `status`, `active`) VALUES
(1, '2023-03-12 17:58:32', '2023-03-12 17:58:32', 'endrick', 'Losange', 0, 1);