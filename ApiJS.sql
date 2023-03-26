-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 26 mars 2023 à 18:27
-- Version du serveur : 8.0.30-0ubuntu0.22.04.1
-- Version de PHP : 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ApiJS`
--

-- --------------------------------------------------------

--
-- Structure de la table `restauranttable`
--

CREATE TABLE `restauranttable` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `restauranttable`
--

INSERT INTO `restauranttable` (`id`, `created_at`, `modified_at`, `name`) VALUES
(1, '2023-03-22 10:41:31', '2023-03-22 10:41:31', 'Table 1');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shiftType` tinyint(1) NOT NULL DEFAULT '0',
  `shiftClosed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `created_at`, `modified_at`, `shiftType`, `shiftClosed`) VALUES
(1, '2023-03-22 10:40:16', '2023-03-26 16:23:52', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `serviceusers`
--

CREATE TABLE `serviceusers` (
  `id` int NOT NULL,
  `id_service` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `serviceusers`
--

INSERT INTO `serviceusers` (`id`, `id_service`, `id_user`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tabletips`
--

CREATE TABLE `tabletips` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tips` int DEFAULT NULL,
  `id_restaurantTable` int DEFAULT NULL,
  `id_service` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tabletips`
--

INSERT INTO `tabletips` (`id`, `created_at`, `modified_at`, `tips`, `id_restaurantTable`, `id_service`) VALUES
(1, '2023-03-22 13:18:28', '2023-03-26 16:24:50', 100, 1, 1),
(2, '2023-03-26 15:36:01', '2023-03-26 16:24:54', 500, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tipspayments`
--

CREATE TABLE `tipspayments` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int DEFAULT NULL,
  `id_user` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tipspayments`
--

INSERT INTO `tipspayments` (`id`, `created_at`, `modified_at`, `amount`, `id_user`) VALUES
(1, '2023-03-22 13:19:43', '2023-03-26 16:26:46', 20, 1),
(2, '2023-03-26 16:17:29', '2023-03-26 16:27:18', 1000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `total_restaurant_tips`
--

CREATE TABLE `total_restaurant_tips` (
  `id` int NOT NULL,
  `total_tips` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `total_restaurant_tips`
--

INSERT INTO `total_restaurant_tips` (`id`, `total_tips`, `created_at`, `modified_at`) VALUES
(1, 860, '2023-03-26 16:07:59', '2023-03-26 16:17:29');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `created_at`, `modified_at`, `firstname`, `lastname`, `status`, `active`) VALUES
(1, '2023-03-22 09:16:23', '2023-03-26 16:26:25', 'John', 'Doe', 0, 1),
(2, '2023-03-22 10:51:42', '2023-03-26 16:26:29', 'Naruto', 'Uzumaki', 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `restauranttable`
--
ALTER TABLE `restauranttable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `serviceusers`
--
ALTER TABLE `serviceusers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tabletips`
--
ALTER TABLE `tabletips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tableTips_restaurantTable` (`id_restaurantTable`),
  ADD KEY `fk_tableTips_services` (`id_service`);

--
-- Index pour la table `tipspayments`
--
ALTER TABLE `tipspayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipsPayments_users` (`id_user`);

--
-- Index pour la table `total_restaurant_tips`
--
ALTER TABLE `total_restaurant_tips`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `restauranttable`
--
ALTER TABLE `restauranttable`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `serviceusers`
--
ALTER TABLE `serviceusers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tabletips`
--
ALTER TABLE `tabletips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `tipspayments`
--
ALTER TABLE `tipspayments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `total_restaurant_tips`
--
ALTER TABLE `total_restaurant_tips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tabletips`
--
ALTER TABLE `tabletips`
  ADD CONSTRAINT `fk_tableTips_restaurantTable` FOREIGN KEY (`id_restaurantTable`) REFERENCES `restauranttable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tableTips_services` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tipspayments`
--
ALTER TABLE `tipspayments`
  ADD CONSTRAINT `fk_tipsPayments_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
