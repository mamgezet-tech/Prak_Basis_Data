-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistem_antrean_rs
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `antrian`
--

DROP TABLE IF EXISTS `antrian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antrian` (
  `id_antrian` char(10) NOT NULL,
  `nomor_antrian` int(11) NOT NULL,
  `waktu_antrian` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pendaftaran` char(10) NOT NULL,
  `lokasi_antrian` varchar(100) NOT NULL,
  PRIMARY KEY (`id_antrian`),
  UNIQUE KEY `id_pendaftaran` (`id_pendaftaran`),
  CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`nomor_antrian` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antrian`
--

LOCK TABLES `antrian` WRITE;
/*!40000 ALTER TABLE `antrian` DISABLE KEYS */;
INSERT INTO `antrian` VALUES ('AN001',1,'2026-06-01 08:00:00','DF001','Loket 1'),('AN002',2,'2026-06-01 08:05:00','DF002','Loket 2'),('AN003',3,'2026-06-01 08:10:00','DF003','Loket 3'),('AN004',4,'2026-06-01 08:15:00','DF004','Loket 4'),('AN005',5,'2026-06-01 08:20:00','DF005','Loket 1'),('AN006',6,'2026-06-02 08:00:00','DF006','Loket 2'),('AN007',7,'2026-06-02 08:05:00','DF007','Loket 3'),('AN008',8,'2026-06-02 08:10:00','DF008','Loket 4'),('AN009',9,'2026-06-02 08:15:00','DF009','Loket 1'),('AN010',10,'2026-06-03 08:00:00','DF010','Loket 2'),('AN011',11,'2026-06-03 08:05:00','DF011','Loket 3'),('AN012',12,'2026-06-03 08:10:00','DF012','Loket 4'),('AN013',13,'2026-06-03 08:15:00','DF013','Loket 1'),('AN014',14,'2026-06-04 08:00:00','DF014','Loket 2'),('AN015',15,'2026-06-04 08:05:00','DF015','Loket 3');
/*!40000 ALTER TABLE `antrian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_resep`
--

DROP TABLE IF EXISTS `detail_resep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_resep` (
  `id_resep` char(10) NOT NULL,
  `id_obat` char(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_resep`,`id_obat`),
  KEY `id_obat` (`id_obat`),
  CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`jumlah` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_resep`
--

LOCK TABLES `detail_resep` WRITE;
/*!40000 ALTER TABLE `detail_resep` DISABLE KEYS */;
INSERT INTO `detail_resep` VALUES ('RS001','OB001',5),('RS016','OB001',5);
/*!40000 ALTER TABLE `detail_resep` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_kurangi_stok_obat
AFTER INSERT
ON Detail_Resep
FOR EACH ROW
BEGIN
    UPDATE Obat
    SET stok = stok - NEW.jumlah
    WHERE id_obat = NEW.id_obat;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokter` (
  `id_dokter` char(10) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL,
  `jam_pemeriksaan` time NOT NULL,
  `id_poli` char(10) NOT NULL,
  PRIMARY KEY (`id_dokter`),
  KEY `id_poli` (`id_poli`),
  CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
INSERT INTO `dokter` VALUES ('DK001','Dr. Gia','Umum','08:00:00','PL001'),('DK002','Dr. Tirta','Anak','08:00:00','PL002'),('DK003','Dr. Jenny','Gigi','08:00:00','PL003'),('DK004','Dr. Angela','Mata','08:00:00','PL004'),('DK005','Dr. Budi','Umum','09:00:00','PL001');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obat` (
  `id_obat` char(10) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  PRIMARY KEY (`id_obat`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`stok` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`harga` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
INSERT INTO `obat` VALUES ('OB001','Paracetamol',5000.00,90,'3x1 tablet'),('OB002','Amoxicillin',10000.00,80,'3x1 kapsul'),('OB003','Vitamin C',3000.00,150,'1x1 tablet'),('OB004','Antasida',4000.00,90,'3x1 tablet'),('OB005','Ibuprofen',7000.00,70,'2x1 tablet'),('OB006','Cetirizine',6000.00,85,'1x1 tablet'),('OB007','Omeprazole',8000.00,60,'1x1 kapsul'),('OB008','OBH Combi',12000.00,50,'3x10 ml'),('OB009','Cataflam',9000.00,40,'2x1 tablet'),('OB010','Sanmol',5500.00,120,'3x1 tablet');
/*!40000 ALTER TABLE `obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasien` (
  `id_pasien` char(10) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `umur` int(11) NOT NULL,
  PRIMARY KEY (`id_pasien`),
  UNIQUE KEY `nomor_telepon` (`nomor_telepon`),
  UNIQUE KEY `idx_no_telp` (`nomor_telepon`),
  KEY `idx_nama_pasien` (`nama_pasien`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`umur` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien`
--

LOCK TABLES `pasien` WRITE;
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
INSERT INTO `pasien` VALUES ('PS001','Rayhan Aditya','2006-10-02','L','Magelang','089616200001',19),('PS002','Erny Kurniawati','2006-10-03','P','Kulon Progo','089616200002',19),('PS003','Imam Ghozali','2006-10-04','L','Temanggung','089616200003',19),('PS004','Satryana Rasyidin','2006-10-05','L','Magelang','089616200004',19),('PS005','Oktarina Putri','2006-10-06','P','Sleman','089616200005',19),('PS006','Muhammad Aufa','2006-10-07','L','Magelang','089616200006',19),('PS007','Dimas Prasetyo','2005-05-11','L','Semarang','089616200007',20),('PS008','Nabila Sari','2004-08-21','P','Yogyakarta','089616200008',21),('PS009','Rina Anggraini','2003-12-10','P','Solo','089616200009',22),('PS010','Bagus Saputra','2002-07-15','L','Purworejo','089616200010',23),('PS011','Ayu Lestari','2001-06-08','P','Magelang','089616200011',24),('PS012','Fajar Nugroho','2000-09-01','L','Klaten','089616200012',25),('PS013','Siti Rahma','1999-04-14','P','Boyolali','089616200013',26),('PS014','Andi Setiawan','1998-01-30','L','Kebumen','089616200014',27),('PS015','Dewi Kartika','1997-11-25','P','Wonosobo','089616200015',28);
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` char(10) NOT NULL,
  `id_pemeriksaan` char(10) NOT NULL,
  `total_pembayaran` decimal(10,2) NOT NULL DEFAULT 0.00,
  `metode_pembayaran` enum('Tunai','Transfer','E-Wallet','Debit','Kredit') NOT NULL,
  PRIMARY KEY (`id_pembayaran`),
  UNIQUE KEY `id_pemeriksaan` (`id_pemeriksaan`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pemeriksaan`) REFERENCES `pemeriksaan` (`id_pemeriksaan`) ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`total_pembayaran` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES ('BY001','PM001',100000.00,'Tunai'),('BY002','PM002',120000.00,'Transfer'),('BY003','PM003',200000.00,'Debit'),('BY004','PM004',175000.00,'Kredit'),('BY005','PM005',100000.00,'Tunai'),('BY006','PM006',125000.00,'Transfer'),('BY007','PM007',180000.00,'Debit'),('BY008','PM008',140000.00,'E-Wallet'),('BY009','PM009',110000.00,'Tunai'),('BY010','PM010',125000.00,'Transfer'),('BY011','PM011',190000.00,'Debit'),('BY012','PM012',150000.00,'E-Wallet'),('BY013','PM013',130000.00,'Tunai'),('BY014','PM014',120000.00,'Transfer');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemeriksaan`
--

DROP TABLE IF EXISTS `pemeriksaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemeriksaan` (
  `id_pemeriksaan` char(10) NOT NULL,
  `id_dokter` char(10) NOT NULL,
  `id_antrian` char(10) NOT NULL,
  `jenis_pemeriksaan` varchar(100) NOT NULL,
  `diagnosa` text NOT NULL,
  `tindakan` text NOT NULL,
  PRIMARY KEY (`id_pemeriksaan`),
  UNIQUE KEY `id_antrian` (`id_antrian`),
  KEY `id_dokter` (`id_dokter`),
  CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON UPDATE CASCADE,
  CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`id_antrian`) REFERENCES `antrian` (`id_antrian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemeriksaan`
--

LOCK TABLES `pemeriksaan` WRITE;
/*!40000 ALTER TABLE `pemeriksaan` DISABLE KEYS */;
INSERT INTO `pemeriksaan` VALUES ('PM001','DK001','AN001','Rawat Jalan','Demam Berdarah','Pemberian obat'),('PM002','DK002','AN002','Konsultasi','Batuk','Pemeriksaan lanjutan'),('PM003','DK003','AN003','Pemeriksaan Gigi','Gigi Berlubang','Tambal gigi'),('PM004','DK004','AN004','Pemeriksaan Mata','Mata Minus','Pemberian resep kacamata'),('PM005','DK001','AN005','Rawat Jalan','Flu','Pemberian obat'),('PM006','DK002','AN006','Konsultasi','Diare','Pemberian obat'),('PM007','DK003','AN007','Pemeriksaan Gigi','Karang Gigi','Scaling'),('PM008','DK004','AN008','Pemeriksaan Mata','Iritasi Mata','Tetes mata'),('PM009','DK001','AN009','Rawat Jalan','Sakit Kepala','Pemberian obat'),('PM010','DK002','AN010','Konsultasi','Demam','Pemberian obat'),('PM011','DK003','AN011','Pemeriksaan Gigi','Gusi Bengkak','Pembersihan gusi'),('PM012','DK004','AN012','Pemeriksaan Mata','Mata Kering','Tetes mata'),('PM013','DK001','AN013','Rawat Jalan','Asam Lambung','Obat lambung'),('PM014','DK002','AN014','Konsultasi','Pilek','Pemberian obat'),('PM015','DK003','AN015','Pemeriksaan Gigi','Sariawan','Obat kumur');
/*!40000 ALTER TABLE `pemeriksaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendaftaran`
--

DROP TABLE IF EXISTS `pendaftaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendaftaran` (
  `id_pendaftaran` char(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `tanggal_pendaftaran` date NOT NULL DEFAULT curdate(),
  `id_pasien` char(10) NOT NULL,
  `id_poli` char(10) NOT NULL,
  `jenis_pemeriksaan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pendaftaran`),
  UNIQUE KEY `nik` (`nik`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_poli` (`id_poli`),
  KEY `idx_tanggal_pendaftaran` (`tanggal_pendaftaran`),
  CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON UPDATE CASCADE,
  CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendaftaran`
--

LOCK TABLES `pendaftaran` WRITE;
/*!40000 ALTER TABLE `pendaftaran` DISABLE KEYS */;
INSERT INTO `pendaftaran` VALUES ('DF001','3371010000000001','2026-06-01','PS001','PL001','Rawat Inap'),('DF002','3371010000000002','2026-06-01','PS002','PL002','Konsultasi'),('DF003','3371010000000003','2026-06-01','PS003','PL003','Pemeriksaan Gigi'),('DF004','3371010000000004','2026-06-01','PS004','PL004','Pemeriksaan Mata'),('DF005','3371010000000005','2026-06-01','PS005','PL001','Rawat Jalan'),('DF006','3371010000000006','2026-06-02','PS006','PL002','Konsultasi'),('DF007','3371010000000007','2026-06-02','PS007','PL003','Pemeriksaan Gigi'),('DF008','3371010000000008','2026-06-02','PS008','PL004','Pemeriksaan Mata'),('DF009','3371010000000009','2026-06-02','PS009','PL001','Rawat Jalan'),('DF010','3371010000000010','2026-06-03','PS010','PL002','Konsultasi'),('DF011','3371010000000011','2026-06-03','PS011','PL003','Pemeriksaan Gigi'),('DF012','3371010000000012','2026-06-03','PS012','PL004','Pemeriksaan Mata'),('DF013','3371010000000013','2026-06-03','PS013','PL001','Rawat Jalan'),('DF014','3371010000000014','2026-06-04','PS014','PL002','Konsultasi'),('DF015','3371010000000015','2026-06-04','PS015','PL003','Pemeriksaan Gigi');
/*!40000 ALTER TABLE `pendaftaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poli`
--

DROP TABLE IF EXISTS `poli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poli` (
  `id_poli` char(10) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lokasi_poli` varchar(100) NOT NULL,
  PRIMARY KEY (`id_poli`),
  UNIQUE KEY `nama_poli` (`nama_poli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poli`
--

LOCK TABLES `poli` WRITE;
/*!40000 ALTER TABLE `poli` DISABLE KEYS */;
INSERT INTO `poli` VALUES ('PL001','Poli Umum','Gedung A'),('PL002','Poli Anak','Gedung B'),('PL003','Poli Gigi','Gedung C'),('PL004','Poli Mata','Gedung D');
/*!40000 ALTER TABLE `poli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_pembayaran_pasien`
--

DROP TABLE IF EXISTS `vw_pembayaran_pasien`;
/*!50001 DROP VIEW IF EXISTS `vw_pembayaran_pasien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_pembayaran_pasien` AS SELECT
 1 AS `id_pembayaran`,
  1 AS `nama_pasien`,
  1 AS `diagnosa`,
  1 AS `total_pembayaran`,
  1 AS `metode_pembayaran` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_pemeriksaan_pasien`
--

DROP TABLE IF EXISTS `vw_pemeriksaan_pasien`;
/*!50001 DROP VIEW IF EXISTS `vw_pemeriksaan_pasien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_pemeriksaan_pasien` AS SELECT
 1 AS `id_pemeriksaan`,
  1 AS `nama_pasien`,
  1 AS `nama_dokter`,
  1 AS `jenis_pemeriksaan`,
  1 AS `diagnosa`,
  1 AS `tindakan` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_pendaftaran_pasien`
--

DROP TABLE IF EXISTS `vw_pendaftaran_pasien`;
/*!50001 DROP VIEW IF EXISTS `vw_pendaftaran_pasien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_pendaftaran_pasien` AS SELECT
 1 AS `id_pendaftaran`,
  1 AS `id_pasien`,
  1 AS `nama_pasien`,
  1 AS `nama_poli`,
  1 AS `jenis_pemeriksaan`,
  1 AS `tanggal_pendaftaran` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_pembayaran_pasien`
--

/*!50001 DROP VIEW IF EXISTS `vw_pembayaran_pasien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pembayaran_pasien` AS select `pb`.`id_pembayaran` AS `id_pembayaran`,`ps`.`nama_pasien` AS `nama_pasien`,`pm`.`diagnosa` AS `diagnosa`,`pb`.`total_pembayaran` AS `total_pembayaran`,`pb`.`metode_pembayaran` AS `metode_pembayaran` from ((((`pembayaran` `pb` join `pemeriksaan` `pm` on(`pb`.`id_pemeriksaan` = `pm`.`id_pemeriksaan`)) join `antrian` `a` on(`pm`.`id_antrian` = `a`.`id_antrian`)) join `pendaftaran` `p` on(`a`.`id_pendaftaran` = `p`.`id_pendaftaran`)) join `pasien` `ps` on(`p`.`id_pasien` = `ps`.`id_pasien`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pemeriksaan_pasien`
--

/*!50001 DROP VIEW IF EXISTS `vw_pemeriksaan_pasien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pemeriksaan_pasien` AS select `pm`.`id_pemeriksaan` AS `id_pemeriksaan`,`ps`.`nama_pasien` AS `nama_pasien`,`d`.`nama_dokter` AS `nama_dokter`,`pm`.`jenis_pemeriksaan` AS `jenis_pemeriksaan`,`pm`.`diagnosa` AS `diagnosa`,`pm`.`tindakan` AS `tindakan` from ((((`pemeriksaan` `pm` join `antrian` `a` on(`pm`.`id_antrian` = `a`.`id_antrian`)) join `pendaftaran` `p` on(`a`.`id_pendaftaran` = `p`.`id_pendaftaran`)) join `pasien` `ps` on(`p`.`id_pasien` = `ps`.`id_pasien`)) join `dokter` `d` on(`pm`.`id_dokter` = `d`.`id_dokter`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pendaftaran_pasien`
--

/*!50001 DROP VIEW IF EXISTS `vw_pendaftaran_pasien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pendaftaran_pasien` AS select `p`.`id_pendaftaran` AS `id_pendaftaran`,`ps`.`id_pasien` AS `id_pasien`,`ps`.`nama_pasien` AS `nama_pasien`,`pd`.`nama_poli` AS `nama_poli`,`p`.`jenis_pemeriksaan` AS `jenis_pemeriksaan`,`p`.`tanggal_pendaftaran` AS `tanggal_pendaftaran` from ((`pendaftaran` `p` join `pasien` `ps` on(`p`.`id_pasien` = `ps`.`id_pasien`)) join `poli` `pd` on(`p`.`id_poli` = `pd`.`id_poli`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07 14:59:48
