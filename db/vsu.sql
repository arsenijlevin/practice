-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 26 2022 г., 17:24
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vsu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `floor`
--

CREATE TABLE `floor` (
  `FloorId` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `floor`
--

INSERT INTO `floor` (`FloorId`, `Number`, `Description`) VALUES
(1, 1, 'Первый этаж (выход на улицу)'),
(2, 2, 'Второй этаж (вход от столовой)'),
(3, 3, 'Этаж на котором расположен деканат'),
(4, 4, 'Этаж с аудиториями для лекций');

-- --------------------------------------------------------

--
-- Структура таблицы `hardware`
--

CREATE TABLE `hardware` (
  `HardwareId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `MAC` varchar(50) NOT NULL,
  `Freq` int(11) NOT NULL,
  `PositionId` int(11) NOT NULL,
  `DefaultDescription` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hardware`
--

INSERT INTO `hardware` (`HardwareId`, `Name`, `MAC`, `Freq`, `PositionId`, `DefaultDescription`) VALUES
(1, 'CS-Guest-WPA', '9c:d6:43:2d:fc:61', 2412, 2, 'D LINK INTER');

-- --------------------------------------------------------

--
-- Структура таблицы `hardwareprotection`
--

CREATE TABLE `hardwareprotection` (
  `HardwareId` int(11) NOT NULL,
  `ProtectionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hardwareprotection`
--

INSERT INTO `hardwareprotection` (`HardwareId`, `ProtectionId`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `position`
--

CREATE TABLE `position` (
  `PositionId` int(11) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `FloorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `position`
--

INSERT INTO `position` (`PositionId`, `X`, `Y`, `FloorId`) VALUES
(1, 1, 20, 2),
(2, 5, 1, 2),
(3, 50, 1, 3),
(4, 21, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `protection`
--

CREATE TABLE `protection` (
  `ProtectionId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `protection`
--

INSERT INTO `protection` (`ProtectionId`, `Name`, `Description`) VALUES
(1, 'wpa', 'описание wpa'),
(2, 'wpa2', 'Описание wpa2');

-- --------------------------------------------------------

--
-- Структура таблицы `rights`
--

CREATE TABLE `rights` (
  `RightsId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rights`
--

INSERT INTO `rights` (`RightsId`, `Name`) VALUES
(1, 'Супер админ'),
(2, 'Право редактирования пользователей'),
(3, 'Право просмотров списка пользователей'),
(4, 'Право просмотра уязвимостей');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`RoleId`, `Name`, `Description`) VALUES
(2, 'Супер Админ', 'Описание супер админа'),
(3, 'Заказчик', 'Только просматривает списки');

-- --------------------------------------------------------

--
-- Структура таблицы `rolerights`
--

CREATE TABLE `rolerights` (
  `RoleId` int(11) NOT NULL,
  `RightsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rolerights`
--

INSERT INTO `rolerights` (`RoleId`, `RightsId`) VALUES
(2, 1),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `RoleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`UserId`, `Login`, `Password`, `RoleId`) VALUES
(1, 'admin', 'admin_password_hash_here', 2),
(2, 'customer', 'заказчик_password_hash_here', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `vulnerabilities`
--

CREATE TABLE `vulnerabilities` (
  `VulnerabilitieId` int(11) NOT NULL,
  `VulnerabilitieStatusId` int(11) NOT NULL,
  `Description` int(11) DEFAULT NULL,
  `HardwareId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vulnerabilities`
--

INSERT INTO `vulnerabilities` (`VulnerabilitieId`, `VulnerabilitieStatusId`, `Description`, `HardwareId`) VALUES
(1, 2, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `vulnerabilitiestatus`
--

CREATE TABLE `vulnerabilitiestatus` (
  `VulnerabilitieStatusId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vulnerabilitiestatus`
--

INSERT INTO `vulnerabilitiestatus` (`VulnerabilitieStatusId`, `Name`) VALUES
(2, 'Обработано'),
(3, 'Не обработано');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`FloorId`);

--
-- Индексы таблицы `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`HardwareId`),
  ADD KEY `PositionId` (`PositionId`);

--
-- Индексы таблицы `hardwareprotection`
--
ALTER TABLE `hardwareprotection`
  ADD KEY `HardwareId` (`HardwareId`,`ProtectionId`),
  ADD KEY `ProtectionId` (`ProtectionId`);

--
-- Индексы таблицы `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`PositionId`),
  ADD KEY `Floor` (`FloorId`),
  ADD KEY `FloorId` (`FloorId`);

--
-- Индексы таблицы `protection`
--
ALTER TABLE `protection`
  ADD PRIMARY KEY (`ProtectionId`);

--
-- Индексы таблицы `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`RightsId`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Индексы таблицы `rolerights`
--
ALTER TABLE `rolerights`
  ADD KEY `RoleId` (`RoleId`),
  ADD KEY `RightsId` (`RightsId`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Индексы таблицы `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  ADD PRIMARY KEY (`VulnerabilitieId`),
  ADD KEY `HardwareId` (`HardwareId`),
  ADD KEY `VulnerabilitieStatusId` (`VulnerabilitieStatusId`);

--
-- Индексы таблицы `vulnerabilitiestatus`
--
ALTER TABLE `vulnerabilitiestatus`
  ADD PRIMARY KEY (`VulnerabilitieStatusId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `floor`
--
ALTER TABLE `floor`
  MODIFY `FloorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `hardware`
--
ALTER TABLE `hardware`
  MODIFY `HardwareId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `position`
--
ALTER TABLE `position`
  MODIFY `PositionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `protection`
--
ALTER TABLE `protection`
  MODIFY `ProtectionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rights`
--
ALTER TABLE `rights`
  MODIFY `RightsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  MODIFY `VulnerabilitieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `vulnerabilitiestatus`
--
ALTER TABLE `vulnerabilitiestatus`
  MODIFY `VulnerabilitieStatusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `hardware_ibfk_1` FOREIGN KEY (`PositionId`) REFERENCES `position` (`PositionId`);

--
-- Ограничения внешнего ключа таблицы `hardwareprotection`
--
ALTER TABLE `hardwareprotection`
  ADD CONSTRAINT `hardwareprotection_ibfk_1` FOREIGN KEY (`ProtectionId`) REFERENCES `protection` (`ProtectionId`),
  ADD CONSTRAINT `hardwareprotection_ibfk_2` FOREIGN KEY (`HardwareId`) REFERENCES `hardware` (`HardwareId`);

--
-- Ограничения внешнего ключа таблицы `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`FloorId`) REFERENCES `floor` (`FloorId`);

--
-- Ограничения внешнего ключа таблицы `rolerights`
--
ALTER TABLE `rolerights`
  ADD CONSTRAINT `rolerights_ibfk_1` FOREIGN KEY (`RightsId`) REFERENCES `rights` (`RightsId`),
  ADD CONSTRAINT `rolerights_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`);

--
-- Ограничения внешнего ключа таблицы `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  ADD CONSTRAINT `vulnerabilities_ibfk_1` FOREIGN KEY (`HardwareId`) REFERENCES `hardware` (`HardwareId`),
  ADD CONSTRAINT `vulnerabilities_ibfk_2` FOREIGN KEY (`VulnerabilitieStatusId`) REFERENCES `vulnerabilitiestatus` (`VulnerabilitieStatusId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
