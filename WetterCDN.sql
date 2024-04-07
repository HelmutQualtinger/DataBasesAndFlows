-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 07. Apr 2024 um 13:46
-- Server-Version: 8.3.0
-- PHP-Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `WetterCDN`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WetterRebstein`
--

CREATE TABLE `WetterRebstein` (
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL,
  `pressure` float NOT NULL,
  `light` float NOT NULL,
  `frequency` float NOT NULL,
  `duty` float NOT NULL,
  `proctemp` float NOT NULL,
  `led` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WetterÖsterreich`
--

CREATE TABLE `WetterÖsterreich` (
  `id` int NOT NULL,
  `insert_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location` varchar(35) NOT NULL,
  `state` varchar(25) NOT NULL,
  `altitude` float NOT NULL,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL,
  `wind_speed` float NOT NULL,
  `wind_direction` varchar(10) NOT NULL,
  `windpeak` float NOT NULL,
  `raindown` float NOT NULL,
  `sun` float NOT NULL,
  `airpressure` float NOT NULL,
  `airpressure_trend` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `weather_time` timestamp NOT NULL,
  `weather_timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `WetterRebstein`
--
ALTER TABLE `WetterRebstein`
  ADD PRIMARY KEY (`datetime`),
  ADD KEY `time` (`datetime`);

--
-- Indizes für die Tabelle `WetterÖsterreich`
--
ALTER TABLE `WetterÖsterreich`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `city_state` (`location`,`state`),
  ADD KEY `timeindex` (`weather_time`,`location`,`state`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `WetterÖsterreich`
--
ALTER TABLE `WetterÖsterreich`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
