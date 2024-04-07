-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 07. Apr 2024 um 13:40
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
-- Datenbank: `OpenWeatherMap`
--

DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`root`@`%` PROCEDURE `create_location_table` ()   BEGIN
    DROP TABLE IF EXISTS location_table;
    CREATE TABLE IF NOT EXISTS location_table (
        location_id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key', 
        country varchar(50) NOT NULL COMMENT 'Country', 
        canton varchar(50) NOT NULL COMMENT 'Canton', 
        city varchar(50) NOT NULL COMMENT 'City', 
        lon float NOT NULL COMMENT 'Longitude', 
        lat float NOT NULL COMMENT 'Latitude', 
        tz float NOT NULL COMMENT 'Time Zone'
    );
END$$

--
-- Funktionen
--
CREATE DEFINER=`root`@`%` FUNCTION `dewpoint` (`Tc` FLOAT, `RH` FLOAT) RETURNS FLOAT DETERMINISTIC BEGIN
    DECLARE T FLOAT;
    SET T = (237.7 * (LOG(RH / 100) + ((17.27 * Tc) / (Tc + 237.7)))) / (17.27 - (LOG(RH / 100) + ((17.27 * Tc) / (Tc + 237.7))));
    RETURN T;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location_table`
--

CREATE TABLE `location_table` (
  `location_id` int NOT NULL COMMENT 'Primary Key',
  `country` varchar(50) NOT NULL COMMENT 'Country',
  `canton` varchar(50) NOT NULL COMMENT 'Canton',
  `city` varchar(50) NOT NULL COMMENT 'City',
  `lon` float NOT NULL COMMENT 'Longitude',
  `lat` float NOT NULL COMMENT 'Latitude',
  `tz` float NOT NULL COMMENT 'Time Zone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weather_data`
--

CREATE TABLE `weather_data` (
  `id` int NOT NULL,
  `city` varchar(40) DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `weather_main` varchar(25) DEFAULT NULL,
  `weather_desc` varchar(25) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `temperature_min` float DEFAULT NULL,
  `temperature_max` float DEFAULT NULL,
  `temperature_feels_like` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `wind_speed` float DEFAULT NULL,
  `wind_direction` float DEFAULT NULL,
  `rain_down_1h` float DEFAULT NULL,
  `clouds` float DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `canton` varchar(25) DEFAULT NULL,
  `dt` timestamp NULL DEFAULT NULL,
  `sunrise` timestamp NULL DEFAULT NULL,
  `sunset` timestamp NULL DEFAULT NULL,
  `tz` float DEFAULT NULL,
  `time_inserted` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weather_data_it`
--

CREATE TABLE `weather_data_it` (
  `id` int NOT NULL,
  `city` varchar(40) DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `weather_main` varchar(25) DEFAULT NULL,
  `weather_desc` varchar(25) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `temperature_min` float DEFAULT NULL,
  `temperature_max` float DEFAULT NULL,
  `temperature_feels_like` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `wind_speed` float DEFAULT NULL,
  `wind_direction` float DEFAULT NULL,
  `rain_down_1h` float DEFAULT NULL,
  `clouds` float DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `canton` varchar(25) DEFAULT NULL,
  `dt` timestamp NULL DEFAULT NULL,
  `sunrise` timestamp NULL DEFAULT NULL,
  `sunset` timestamp NULL DEFAULT NULL,
  `tz` float DEFAULT NULL,
  `time_inserted` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `location_table`
--
ALTER TABLE `location_table`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `time_messung` (`dt`),
  ADD KEY `city_index` (`city`),
  ADD KEY `time_inserted` (`time_inserted`) USING BTREE,
  ADD KEY `canton` (`city`,`canton`,`country`,`dt`) USING BTREE;

--
-- Indizes für die Tabelle `weather_data_it`
--
ALTER TABLE `weather_data_it`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_timestamp` (`time_inserted`),
  ADD KEY `idx_city` (`city`),
  ADD KEY `idx_canton` (`canton`),
  ADD KEY `idx_country` (`country`),
  ADD KEY `idx_dt` (`dt`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `location_table`
--
ALTER TABLE `location_table`
  MODIFY `location_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT für Tabelle `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `weather_data_it`
--
ALTER TABLE `weather_data_it`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
