-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mediclearning
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `idcategorie` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Nourrisson'),(2,'Enfant'),(3,'Adulte'),(4,'Senior');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `idcorrelation` int(11) NOT NULL AUTO_INCREMENT,
  `idMaladie` int(11) NOT NULL,
  `idSymptome` int(11) NOT NULL,
  PRIMARY KEY (`idcorrelation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
INSERT INTO `correlation` VALUES (1,1,208),(2,1,332),(3,1,396),(4,1,397),(5,1,398),(6,1,399),(7,1,400),(8,5,332),(9,5,390),(10,5,401),(11,5,402),(12,5,403),(13,5,404),(14,5,405);
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `douleurLocalise`
--

DROP TABLE IF EXISTS `douleurLocalise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `douleurLocalise` (
  `iddouleurLocalise` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddouleurLocalise`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `douleurLocalise`
--

LOCK TABLES `douleurLocalise` WRITE;
/*!40000 ALTER TABLE `douleurLocalise` DISABLE KEYS */;
INSERT INTO `douleurLocalise` VALUES (1,'Abdomen'),(2,'Aine'),(3,'Autre'),(4,'Bouche et Gorge'),(5,'Bras et Mains'),(6,'Cou et Gorge'),(7,'Dos'),(8,'Fesses'),(9,'Jambes et pieds'),(10,'Mains et Pieds'),(11,'Nez et Bouche'),(12,'Oreilles'),(13,'Peau'),(14,'Tête'),(15,'Thorax'),(16,'Visage'),(17,'Yeux');
/*!40000 ALTER TABLE `douleurLocalise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maladie`
--

DROP TABLE IF EXISTS `maladie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maladie` (
  `idmaladie` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`idmaladie`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maladie`
--

LOCK TABLES `maladie` WRITE;
/*!40000 ALTER TABLE `maladie` DISABLE KEYS */;
INSERT INTO `maladie` VALUES (1,'Œdème pulmonaire'),(2,'Aboulie'),(3,'Absence de menstruation (Aménorrhée)'),(4,'Acanthosis nigricans'),(5,'Accident vasculaire cérébral'),(6,'Achondroplasie'),(7,'Acné'),(8,'Acné rosacée'),(9,'Acouphènes'),(10,'Acromégalie'),(11,'Acrophobie'),(12,'Adénomyose'),(13,'Adénopathie'),(14,'Aérophagie'),(15,'Agoraphobie'),(16,'Agranulocytose'),(17,'Albinisme'),(18,'Alcoolisme chronique'),(19,'Algie vasculaire de la face'),(20,'Algodystrophie'),(21,'Alimentation'),(22,'Allergies'),(23,'Allergies alimentaires'),(24,'Alopécie'),(25,'Alopécie en plaques (Pelade)'),(26,'Alvéolite'),(27,'Alzheimer'),(28,'Amblyopie'),(29,'Aménorrhée'),(30,'Amnésie'),(31,'Amoa (Oligoastrocytome anaplasique)'),(32,'Amylose'),(33,'Andropause'),(34,'Anémie'),(35,'Anémie à hématies falciformes'),(36,'Anémie aplasique'),(37,'Anémie de Biermer'),(38,'Anémie ferriprive'),(39,'Anémie hémolytique'),(40,'Anémie par carence en acide folique'),(41,'Anémie par carence en fer'),(42,'Anémie par carence en vitamine B12'),(43,'Anémie pernicieuse'),(44,'Angine'),(45,'Angine de poitrine'),(46,'Angiocholite'),(47,'Angiome du foie'),(48,'Angiomes'),(49,'Anisocytose'),(50,'Ankylose'),(51,'Anorexie mentale'),(52,'Anurie'),(53,'Anxiété'),(54,'Anxiété chronique'),(55,'Aphasie'),(56,'Aphtes'),(57,'Aplasie médullaire'),(58,'Apnée du sommeil'),(59,'Aponévrosite plantaire'),(60,'Apoplexie'),(61,'Appendicite'),(62,'Artériosclérose'),(63,'Artérite oblitérante des membres inférieurs'),(64,'Arthrite'),(65,'Arthrite juvénile'),(66,'Arthrite rhumatoïde (Polyarthrite rhumatoïde)'),(67,'Arthrose (Ostéoarthrite)'),(68,'Arthrose cervicale'),(69,'Arythmie cardiaque'),(70,'Asbestose'),(71,'Aspergillose'),(72,'Asphyxie'),(73,'Asthénie'),(74,'Asthénospermie'),(75,'Asthme'),(76,'Astigmatisme'),(77,'Ataxie'),(78,'Ataxie cérébelleuse'),(79,'Athérosclérose'),(80,'Atrésie'),(81,'Augmentation et reconstruction mammaire'),(82,'Autisme'),(83,'AVC (accident vasculaire cérébral)'),(84,'Avortement'),(85,'Azoospermie'),(86,'Baisse de libido (femme)'),(87,'Baisse de libido (homme)'),(88,'Balanite'),(89,'Bartholinite'),(90,'Basse pression artérielle (Hypotension)'),(91,'Bigorexie'),(92,'Bilharziose'),(93,'Bipolaires'),(94,'Blennorragie'),(95,'Blépharite'),(96,'Blépharospasme'),(97,'Blessures musculaires'),(98,'Borderline'),(99,'Botulisme'),(100,'Boulimie'),(101,'Bradycardie'),(102,'Bridge'),(103,'Bronchiolite'),(104,'Bronchite aiguë'),(105,'Bronchite chronique et emphysème (BPCO)'),(106,'Brossettes interdentaires'),(107,'Brucellose'),(108,'Brûlures d estomac'),(109,'Burnout'),(110,'Bursite'),(111,'Calculs biliaires'),(112,'Calculs rénaux'),(113,'Calvitie'),(114,'Camptocormie'),(115,'Canal carpien'),(116,'Cancer'),(117,'Cancer de l endomètre'),(118,'Cancer de l estomac'),(119,'Cancer de l oesophage'),(120,'Cancer de la gorge'),(121,'Cancer de la langue'),(122,'Cancer de la peau'),(123,'Cancer de la plèvre'),(124,'Cancer de la prostate'),(125,'Cancer de la thyroïde'),(126,'Cancer de la vessie'),(127,'Cancer des os'),(128,'Cancer des testicules'),(129,'Cancer du cerveau'),(130,'Cancer du col de l utérus'),(131,'Cancer du colon (cancer colorectal)'),(132,'Cancer du foie'),(133,'Cancer du pancréas'),(134,'Cancer du poumon'),(135,'Cancer du rein'),(136,'Cancer du sein'),(137,'Cancer du testicule'),(138,'Candidose'),(139,'Capsulite rétractile'),(140,'Cardiomyopathie'),(141,'Carie dentaire'),(142,'Cataracte'),(143,'Cavernome'),(144,'Cécité'),(145,'Cellulite'),(146,'Cervicalgie'),(147,'Chalazion'),(148,'Chancre mou'),(149,'Cheveux (Perte de)'),(150,'Chikungunya'),(151,'Chlamydia'),(152,'Cholangiocarcinome'),(153,'Cholécystite'),(154,'Choléra'),(155,'Cholestase'),(156,'Cholestérol'),(157,'Cholestérol et triglycérides: hyperlipidémie'),(158,'Chondrocalcinose'),(159,'Chondropathie fémoro-patellaire'),(160,'Chondrosarcome'),(161,'Cicatrice chéloïde'),(162,'Cirrhose'),(163,'Cirrhose biliaire primitive'),(164,'Claquage (déchirure)'),(165,'Claustrophobie'),(166,'Cocaïnomanie'),(167,'Coeliaque (Maladie)'),(168,'Coeur (maladies du)'),(169,'Colique hepatique'),(170,'Colique néphrétique'),(171,'Coliques du nourrisson'),(172,'Colite'),(173,'Colobome'),(174,'Côlon irritable (Syndrome du)'),(175,'Colopathie fonctionnelle'),(176,'Complications du diabète'),(177,'Condylomes (verrues génitales)'),(178,'Conflit sous-acromial'),(179,'Conjonctivite'),(180,'Constipation'),(181,'Coqueluche'),(182,'Cors'),(183,'Cou (Douleurs au)'),(184,'Coude du golfeur'),(185,'Coude du joueur de tennis'),(186,'Couperose'),(187,'Coxarthrose'),(188,'Crampes'),(189,'Craniopharyngiome'),(190,'Crise d angoisse'),(191,'Crohn (Maladie de)'),(192,'Cruralgie'),(193,'Cyclothymie'),(194,'Cyphose'),(195,'Cystite (Infection urinaire)'),(196,'Cystite interstitielle'),(197,'Cytomégalovirus'),(198,'Dacryocystite'),(199,'Dartres'),(200,'Déchaussement'),(201,'Dégénérescence maculaire'),(202,'Delirium tremens'),(203,'Dengue'),(204,'Dent de Lait'),(205,'Dent sur pivot'),(206,'Dépression'),(207,'Dépression saisonnière'),(208,'Dermatite atopique'),(209,'Dermatomyosite'),(210,'Dermatophytose'),(211,'Dermite séborrhéique'),(212,'Déshydratation'),(213,'Desmodontite'),(214,'Diabète'),(215,'Diabète gestationnel'),(216,'Diabète insipide'),(217,'Diarrhée'),(218,'Diastasis'),(219,'Diphtérie'),(220,'Discarthrose'),(221,'Discopathie'),(222,'Diverticulite'),(223,'Dorsalgie'),(224,'Mal de Dos'),(225,'Douleurs au cou'),(226,'Douleurs lombaires (Lombalgie)'),(227,'Douleurs menstruelles'),(228,'Durillon'),(229,'Dysarthrie'),(230,'Dysfonction érectile'),(231,'Dysfonction sexuelle féminine'),(232,'Dysfonction sexuelle masculine'),(233,'Dysgraphie'),(234,'Dyshidrose'),(235,'Dyslexie'),(236,'Dyslipidémies'),(237,'Dysménorrhée'),(238,'Dysmorphophobie'),(239,'Dysorthographie'),(240,'Dyspaneurie'),(241,'Dyspepsie'),(242,'Dysphasie'),(243,'Dyspraxie'),(244,'Dystonie'),(245,'Dystrophie musculaire'),(246,'Ebola'),(247,'Echolalie'),(248,'Eczéma'),(249,'Ejaculation précoce'),(250,'Eléphantiasis'),(251,'Embolie graisseuse'),(252,'Embolie pulmonaire'),(253,'Emphysème'),(254,'Emphysème pulmonaire'),(255,'Encéphalite'),(256,'Encéphalomyélite myalgique'),(257,'Encoprésie'),(258,'Endocardite'),(259,'Endométriose'),(260,'Engelures'),(261,'Enthésopathie'),(262,'Entorse'),(263,'Entorse cervicale'),(264,'Epidermolyse bulleuse'),(265,'Epididymite'),(266,'Epiglottite'),(267,'Erysipèle'),(268,'Erythème noueux'),(269,'Escarre'),(270,'Ethmoïdite'),(271,'Exostose'),(272,'Extrasystole'),(273,'Énurésie'),(274,'Épicondylalgies'),(275,'Épicondylite'),(276,'Épilepsie'),(277,'Épine calcanéenne'),(278,'Épine de Lenoir'),(279,'Épitrochléite'),(280,'Épuisement professionnel'),(281,'Facettes dentaires'),(282,'Fasciite plantaire et épine calcanéenne'),(283,'Fatigue chronique'),(284,'Fausse couche'),(285,'Fécondation In Vitro (FIV)'),(286,'Fente palatine'),(287,'Feu sauvage (Herpès labial)'),(288,'Fibrome utérin'),(289,'Fibromyalgie'),(290,'Fibrose kystique (mucoviscidose)'),(291,'Fibrose pulmonaire'),(292,'Fièvre jaune'),(293,'Fièvre typhoïde'),(294,'Fissure anale'),(295,'Fistule'),(296,'Fistule dentaire'),(297,'Fracture de fatigue'),(298,'Fractures comminutives'),(299,'Frigidité'),(300,'Furoncle'),(301,'Gale'),(302,'Gangrène'),(303,'Gastrite'),(304,'Gastro-entérite'),(305,'Gastroparésie'),(306,'Genu valgum'),(307,'Genu varum'),(308,'Gingivite'),(309,'Glaucome'),(310,'Glioblastome'),(311,'Glomérulonéphrite'),(312,'Glossite'),(313,'Goitre'),(314,'Gonarthrose'),(315,'Gonorrhée'),(316,'Gougerot-Sjögren (Syndrome)'),(317,'Goutte'),(318,'Grippe'),(319,'Grippe A (H1N1)'),(320,'Grippe aviaire'),(321,'Grossesse'),(322,'Grossesse extra-utérine (GEU)'),(323,'Grossesse nerveuse'),(324,'Gynécomastie'),(325,'Halitose (Mauvaise haleine)'),(326,'Hallux rigidus'),(327,'Hallux valgus'),(328,'Hamartome'),(329,'Haute pression artérielle (Hypertension)'),(330,'Hémangiome'),(331,'Hémiparésie'),(332,'Hémiplégie'),(333,'Hémochromatose'),(334,'Hémopathie maligne'),(335,'Hémophilie'),(336,'Hémorragie'),(337,'Hémorragie digestive'),(338,'Hémorroïdes'),(339,'Hépatite A'),(340,'Hépatite B'),(341,'Hépatite C'),(342,'Hermaphrodisme'),(343,'Hernie de Spiegel'),(344,'Hernie diaphragmatique'),(345,'Hernie discale'),(346,'Hernie hiatale'),(347,'Hernie inguinale'),(348,'Herpès génital'),(349,'Herpès labial'),(350,'Hétérochromie'),(351,'Hirsutisme'),(352,'Hoquet'),(353,'Hydarthrose'),(354,'Hydrocéphalie'),(355,'Hyperactivité'),(356,'Hypercalcémie'),(357,'Hypercholestérolémie'),(358,'Hyperhidrose (Transpiration excessive)'),(359,'Hyperkaliémie'),(360,'Hyperlaxité'),(361,'Hyperlipidémie'),(362,'Hypermétropie'),(363,'Hyperphagie'),(364,'Hyperphagie'),(365,'Hyperphagie'),(366,'Hypersomnie'),(367,'Hypertension artérielle'),(368,'Hypertension portale'),(369,'Hypertension pulmonaire'),(370,'Hyperthermie'),(371,'Hyperthyroïdie'),(372,'Hypertrichose'),(373,'Hypertriglycéridémie'),(374,'Hypertriglycéridémie'),(375,'Hypertrophie bénigne de la prostate'),(376,'Hypochromie'),(377,'Hypocondrie'),(378,'Hypoglycémie'),(379,'Hypokaliémie'),(380,'Hypospadias'),(381,'Hypotension'),(382,'Hypothermie'),(383,'Hypothyroïdie'),(384,'Hypoxie'),(385,'Ictus Amnésique'),(386,'Immunité (Renforcer son système immunitaire)'),(387,'Impatiences dans les jambes'),(388,'Impétigo'),(389,'Impuissance masculine'),(390,'Incontinence urinaire'),(391,'Indigestion'),(392,'Infarctus du myocarde'),(393,'Infection au VIH et sida'),(394,'Infection des ongles par un champignon (Onychomycose)'),(395,'Infection urinaire'),(396,'Infections à Hantavirus'),(397,'Infertilité (stérilité)'),(398,'Inflammation des intestins'),(399,'Insolation (Coup de chaleur)'),(400,'Insomnie (troubles du sommeil)'),(401,'Insuffisance cardiaque'),(402,'Insuffisance hypophysaire'),(403,'Insuffisance ovarienne'),(404,'Insuffisance rénale chronique et aigüe'),(405,'Insuffisance respiratoire'),(406,'Insuffisance veineuse'),(407,'Intertrigo'),(408,'Intestin irritable'),(409,'Intolérance au lactose'),(410,'Intoxication alimentaire'),(411,'Intoxication au plomb'),(412,'Invagination intestinale'),(413,'Jambes sans repos (Syndrome des)'),(414,'Jaunisse'),(415,'Kératite'),(416,'Kératose actinique'),(417,'Kyste'),(418,'Kyste au sein'),(419,'Kyste ovarien'),(420,'Kyste Pilonidal'),(421,'Kyste sébacé'),(422,'Kyste synovial'),(423,'Kystes dentaires'),(424,'L asthme d effort'),(425,'L ectropion'),(426,'La clinophilie'),(427,'La dysplasie fémoro-patellaire'),(428,'La dyspnée'),(429,'La maladie de l homme de pierre'),(430,'La perlèche'),(431,'La polykystose rénale'),(432,'La précordialgie'),(433,'La pyélonéphrite'),(434,'La salpingite : l inflammation des trompes de Fallope'),(435,'Labyrinthite'),(436,'Laparoschisis'),(437,'Laryngite'),(438,'Le bégaiement'),(439,'Le syndrome des loges'),(440,'Légionellose (Maladie du légionnaire)'),(441,'Leishmaniose'),(442,'Lèpre'),(443,'Leptospirose'),(444,'Les fractures du rocher'),(445,'Les troubles du comportement alimentaire (TCA)'),(446,'Les tumeurs osseuses'),(447,'Lésion malpighienne intraépithéliale de bas grade'),(448,'Leucémie'),(449,'Leucodystrophie'),(450,'Leucopénie'),(451,'Leucoplasie'),(452,'Libido'),(453,'Lichen plan'),(454,'Lipodystrophie'),(455,'Lipome'),(456,'Liposarcome'),(457,'Listériose'),(458,'Lithiase biliaire'),(459,'Lithiase rénale'),(460,'Lithiase urinaire'),(461,'Lombalgie'),(462,'Lombosciatique'),(463,'Lucite'),(464,'Lumbago'),(465,'Lupus'),(466,'Luxation de l’épaule'),(467,'Lymphoedème'),(468,'Lymphome de Burkitt'),(469,'Lymphome du manteau'),(470,'Lymphome folliculaire'),(471,'Lymphome non hodgkinien'),(472,'Lymphopénie'),(473,'Mal de dos'),(474,'Mal de gorge'),(475,'Mal de tête (céphalée)'),(476,'Maladie à corps de Lewy'),(477,'Maladie coeliaque'),(478,'Maladie coeliaque (Intolérance au gluten)'),(479,'Maladie d Addison'),(480,'Maladie d Alzheimer'),(481,'Maladie de basedow'),(482,'Maladie de Bowen'),(483,'Maladie de Charcot'),(484,'Maladie de Creutzfeld-Jacob'),(485,'Maladie de Crohn'),(486,'Maladie de Dupuytren'),(487,'Maladie de Fabry'),(488,'Maladie de Gaucher'),(489,'Maladie de Gilbert'),(490,'Maladie de Hirschsprung'),(491,'Maladie de Hodgkin'),(492,'Maladie de Horton'),(493,'Maladie de Huntington'),(494,'Maladie de Kahler'),(495,'Maladie de Kawasaki'),(496,'Maladie de Krabbe'),(497,'Maladie de La Peyronie'),(498,'Maladie de Lapeyronie'),(499,'Maladie de Ledderhose'),(500,'Maladie de Lyme'),(501,'Maladie de Ménière'),(502,'Maladie de Paget'),(503,'Maladie de Parkinson'),(504,'Maladie de Pompe'),(505,'Maladie de Raynaud'),(506,'Maladie de Recklinghausen'),(507,'Maladie de Sandhoff'),(508,'Maladie de Scheuermann'),(509,'Maladie de Sever'),(510,'Maladie de Still'),(511,'Maladie de Vaquez'),(512,'Maladie de Verneuil'),(513,'Maladie de Wegener'),(514,'Maladie de Whipple'),(515,'Maladie de Wilson'),(516,'Maladie des griffes du chat'),(517,'Maladie du Charbon'),(518,'Maladie du sommeil'),(519,'Maladie pulmonaire obstructive chronique (MPOC)'),(520,'Maladies cardiaques'),(521,'Maladies du coeur'),(522,'Malaise'),(523,'Malaise Vagal'),(524,'Maniaco-dépression'),(525,'Mastocytose'),(526,'Mélanome'),(527,'Mélanome de la peau'),(528,'Mélasma'),(529,'Méléna'),(530,'Ménière'),(531,'Méningiome'),(532,'Méningite'),(533,'Ménopause'),(534,'Ménopause précoce'),(535,'Ménorragie'),(536,'Métastase osseuse'),(537,'Métrorragie'),(538,'Microcéphalie'),(539,'Micropénis'),(540,'Migraine'),(541,'Migraine avec aura'),(542,'Molluscum Contagiosum'),(543,'Mononucléose'),(544,'MPOC (Maladie pulmonaire obstructive chronique )'),(545,'MST'),(546,'Mucoviscidose (Fibrose kystique (mucoviscidose))'),(547,'Myalgie'),(548,'Myasthénie'),(549,'Mycoses'),(550,'Myocardite'),(551,'Myoclonie'),(552,'Myodésopsie'),(553,'Myofasciite à macrophages'),(554,'Myopathie'),(555,'Myopie'),(556,'Nanisme'),(557,'Narcolepsie'),(558,'Nécrose dentaire'),(559,'Neurasthénie'),(560,'Neurinome'),(561,'Neuroblastome'),(562,'Neurofibromatose'),(563,'Neuronite vestibulaire (labyrinthite)'),(564,'Neuropathie'),(565,'Neutropénie'),(566,'Névralgie dentaire'),(567,'Névralgie faciale (trijumeau)'),(568,'Névralgie intercostale'),(569,'Névrite optique'),(570,'Névrome de Morton'),(571,'Névrose'),(572,'Nodule pulmonaire'),(573,'Nodule thyroïdien'),(574,'Noma'),(575,'Nomophobie'),(576,'Nycturie'),(577,'Nystagmus'),(578,'Obésité'),(579,'Occlusion dentaire'),(580,'Occlusion intestinale'),(581,'Ochlophobie'),(582,'Oedème de Quincke'),(583,'Oedème des jambes'),(584,'Oesophagite'),(585,'Oligospermie'),(586,'Omphalocèle'),(587,'Ongles incarnés'),(588,'Onychomycose'),(589,'Oreillons'),(590,'Orgelet'),(591,'Orthorexie'),(592,'Ostéoarthrite'),(593,'Ostéochondrite'),(594,'Ostéogenèse imparfaite'),(595,'Ostéomalacie'),(596,'Ostéopénie'),(597,'Ostéoporose'),(598,'Ostéosarcome'),(599,'Otite externe'),(600,'Otite moyenne'),(601,'Paludisme'),(602,'Panaris'),(603,'Pancolite'),(604,'Pancréatite'),(605,'Papillomavirus'),(606,'Paranoïa'),(607,'Paraparésie'),(608,'Parasomnie'),(609,'Parkinson'),(610,'Parodontite'),(611,'Parurésie'),(612,'Peau sèche'),(613,'Pectus excavatum'),(614,'Pédiculose'),(615,'Pelade'),(616,'Pemphigoïde bulleuse'),(617,'Périarthrite'),(618,'Périarthrite scapulo-humérale'),(619,'Péricardite'),(620,'Péritonite'),(621,'Personnalité schizoïde'),(622,'Perte de cheveux'),(623,'Perte de désir sexuel (femme)'),(624,'Perte de désir sexuel (homme)'),(625,'Pervers narcissique'),(626,'Peste'),(627,'Peyronie'),(628,'Pharyngite'),(629,'Phénylcétonurie'),(630,'Phimosis'),(631,'Phlébite'),(632,'Phlegmon amygdalien'),(633,'Phobie'),(634,'Phobie sociale'),(635,'Photophobie'),(636,'Pied bot'),(637,'Pied d athlète'),(638,'Pinguécula'),(639,'Pityriasis rosé de Gibert'),(640,'Pityriasis versicolor'),(641,'Plagiocéphalie'),(642,'Pleurésie'),(643,'Pneumocystose'),(644,'Pneumonie'),(645,'Pneumopathie'),(646,'Pneumothorax'),(647,'Poil incarné'),(648,'Poliomyélite (Polio)'),(649,'Polyarthrite rhumatoïde'),(650,'Polydactylie'),(651,'Polykystose rénale'),(652,'Polymyosite'),(653,'Polynévrite'),(654,'Polypes intestinaux'),(655,'Poux'),(656,'Prééclampsie'),(657,'Presbyacousie'),(658,'Presbytie'),(659,'Progéria'),(660,'Prognathisme'),(661,'Prolapsus génital'),(662,'Prosopagnosie'),(663,'Prostatite'),(664,'Prurigo'),(665,'Pseudomonas aeruginosa'),(666,'Psoriasis'),(667,'Psychose'),(668,'Ptérygion'),(669,'Pubalgie'),(670,'Puberté'),(671,'Pulpite'),(672,'Purpura'),(673,'Purpura Fulminans'),(674,'Rachitisme'),(675,'Rage'),(676,'Rage de dents'),(677,'Rectite'),(678,'Rectocolite hémorragique (RCH ou colite ulcéreuse)'),(679,'Reflux gastro-oesophagien'),(680,'Règles douloureuses (dysménorrhée)'),(681,'Rétention d eau'),(682,'Rétinite pigmentaire'),(683,'Rétinoblastome'),(684,'Rétinopathie'),(685,'Rhinite allergique'),(686,'Rhinopharyngite'),(687,'Rhizarthrose'),(688,'Rhumatisme psoriasique'),(689,'Rhumatismes'),(690,'Rhume'),(691,'Rhume de hanche'),(692,'Rhume des foins (Rhinite allergique)'),(693,'Ronflement'),(694,'Rosacée'),(695,'Roséole infantile'),(696,'Rougeole'),(697,'Rubéole'),(698,'Rupture d anévrisme'),(699,'Salmonellose'),(700,'Sarcoïdose'),(701,'Sarcome d Ewing'),(702,'Sarcome de Kaposi'),(703,'Sarcopénie'),(704,'Saturnisme'),(705,'Scarlatine'),(706,'Schizophrénie'),(707,'Sciatique'),(708,'Sclérodermie'),(709,'Sclérose en plaques'),(710,'Sclérose tubéreuse de Bourneville'),(711,'Scoliose'),(712,'Scorbut'),(713,'Scotome'),(714,'Septicémie'),(715,'Sida/VIH'),(716,'Sigmoïdite'),(717,'Sinusite'),(718,'Situs Inversus'),(719,'Somnanbulisme'),(720,'Source des troubles urinaires'),(721,'Spasmophilie'),(722,'Spina-bifida'),(723,'SPM (Syndrome prémenstruel)'),(724,'Spondylarthrite'),(725,'Spondylarthrite ankylosante (spondylite)'),(726,'Spondylolisthésis'),(727,'Staphylocoque'),(728,'Sténose du canal lombaire'),(729,'Stéréotypie'),(730,'Stérilité'),(731,'Stomatite'),(732,'Stomatite aphteuse (Aphtes)'),(733,'Strabisme'),(734,'Stress'),(735,'Syllogomanie'),(736,'Syncope'),(737,'Syndrome d Angelman'),(738,'Syndrome d Ehlers-Danlos'),(739,'Syndrome d’Asperger'),(740,'Syndrome de Brugada'),(741,'Syndrome de Costen'),(742,'Syndrome de Cushing'),(743,'Syndrome de Dravet'),(744,'Syndrome de Gougerot-Sjögren'),(745,'Syndrome de Guillain-Barré'),(746,'Syndrome de l intestin irritable'),(747,'Syndrome de la queue de cheval'),(748,'Syndrome de Little'),(749,'Syndrome de Lyell'),(750,'Syndrome de Lynch'),(751,'Syndrome de Maigne'),(752,'Syndrome de Marfan'),(753,'Syndrome de Noonan'),(754,'Syndrome de Poland'),(755,'Syndrome de Protée'),(756,'Syndrome de Rett'),(757,'Syndrome de Reye'),(758,'Syndrome de Turner'),(759,'Syndrome de west'),(760,'Syndrome de Williams'),(761,'Syndrome des jambes sans repos'),(762,'Syndrome des ovaires polykystiques (SOPK)'),(763,'Syndrome du canal carpien'),(764,'Syndrome du côlon irritable'),(765,'Syndrome fémoro-rotulien'),(766,'Syndrome Gilles de la Tourette'),(767,'Syndrome méningé'),(768,'Syndrome métabolique (Syndrome X)'),(769,'Syndrome Munchausen'),(770,'Syndrome myélodysplasique'),(771,'Syndrome prémenstruel'),(772,'Syndrome pyramidal'),(773,'Syphilis'),(774,'Syringomyélie'),(775,'Tabagisme'),(776,'Taches brunes'),(777,'Tachycardie'),(778,'Tartre'),(779,'Tassement de vertèbres'),(780,'Teigne'),(781,'Télangiectasie'),(782,'Tendinite'),(783,'Tendinite'),(784,'Tendinite au genou'),(785,'Tendinite de l épaule'),(786,'Tennis elbow'),(787,'Ténosynovite'),(788,'Tératome'),(789,'Tératospermie'),(790,'Terreur nocturne'),(791,'Tétanos'),(792,'Tétraplégie'),(793,'Thalassémie'),(794,'Thanatophobie'),(795,'Thrombocytémie'),(796,'Thrombocytopenie'),(797,'Thrombocytose'),(798,'Thrombopénie'),(799,'Thrombophilie'),(800,'Thrombophlébite'),(801,'Thrombose'),(802,'Thyroïde'),(803,'Torsion testiculaire'),(804,'Torticolis'),(805,'Toux grasse'),(806,'Toxémie gravidique'),(807,'Toxocarose'),(808,'Toxoplasmose'),(809,'Trachéite'),(810,'Transpiration excessive'),(811,'Traumatisme crânien'),(812,'Triglycérides'),(813,'Trisomie 18'),(814,'Trisomie 21'),(815,'Trouble affectif saisonnier'),(816,'Trouble de déficit de l attention / hyperactivité (TDAH)'),(817,'Trouble de l érection'),(818,'Trouble de la personnalité limite (borderline)'),(819,'Troubles anxieux'),(820,'Troubles bipolaires'),(821,'Troubles cardiaques (maladies cardio-vasculaires)'),(822,'Troubles de l estime de soi'),(823,'Troubles digestifs'),(824,'Troubles musculosquelettiques de l épaule'),(825,'Troubles musculosquelettiques de la main et du poignet'),(826,'Troubles musculosquelettiques du cou'),(827,'Troubles musculosquelettiques du coude'),(828,'Troubles musculosquelettiques du genou'),(829,'Troubles Obsessionnels Compulsifs (TOC)'),(830,'Trypophobie'),(831,'Tuberculose'),(832,'Tularémie'),(833,'Tumeur cérébrale'),(834,'Turista (tourista)'),(835,'Ulcérations buccales'),(836,'Ulcère de l estomac et ulcère duodénal'),(837,'Ulcère de la cornée'),(838,'Ulcère veineux'),(839,'Urétrite'),(840,'Urticaire'),(841,'Uvéite'),(842,'Vaginisme'),(843,'Vaginite'),(844,'Varicelle'),(845,'Varices'),(846,'Varicocèle'),(847,'Variole'),(848,'Vascularités'),(849,'Ver solitaire'),(850,'Vergetures'),(851,'Verrues vulgaires et plantaires'),(852,'Vers intestinaux'),(853,'Vertiges'),(854,'Vessie hyperactive'),(855,'VIH/Sida (Sida/VIH)'),(856,'Vitiligo'),(857,'Xeroderman pigmentosum : la maladie des enfants de la lune '),(858,'Yeux secs'),(859,'Zika'),(860,'Zona');
/*!40000 ALTER TABLE `maladie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexe` (
  `idSexe` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Homme'),(2,'Femme');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptome`
--

DROP TABLE IF EXISTS `symptome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptome` (
  `idsymptome` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idsymptome`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptome`
--

LOCK TABLES `symptome` WRITE;
/*!40000 ALTER TABLE `symptome` DISABLE KEYS */;
INSERT INTO `symptome` VALUES (161,'Acouphènes'),(162,'Adénomégalie'),(163,'Aérophagie'),(164,'Agnosie'),(165,'Agueusie'),(166,'Akinésie'),(167,'Alopécie'),(168,'Amaigrissement'),(169,'Aménorrhée'),(170,'Amyotrophie'),(171,'Angoisses'),(172,'Aniscorie'),(173,'Anosmie'),(174,'Anosognosie'),(175,'Apathie'),(176,'Aphtes'),(177,'Apraxie'),(178,'Arythmie cardiaque'),(179,'Ascite'),(180,'Ataxie'),(181,'Ballonnements'),(182,'Blocage du genou'),(183,'Bouche sèche'),(184,'Bouffées de chaleur'),(185,'Boule ou grosseur à l aine'),(186,'Boule ou grosseur au sein'),(187,'Bouton au menton'),(188,'Bouton sur le nez'),(189,'Boutons'),(190,'Bronchospasme'),(191,'Brûlures'),(192,'Cellulite'),(193,'Changement de couleur de l urine'),(194,'Cheveux blancs'),(195,'Cheville enflée'),(196,'Claudication'),(197,'Coliques du nourrisson'),(198,'Colopathie fonctionnelle'),(199,'Conjonctivite'),(200,'Constipation'),(201,'Constipation chez bébé'),(202,'Convulsions'),(203,'Courbatures'),(204,'Crampe au mollet'),(205,'Crampes'),(206,'Crise d angoisse'),(207,'Croûtes dans le nez'),(208,'Cyanose'),(209,'Déformation des doigts'),(210,'Déformation des doigts'),(211,'Délire'),(212,'Démangeaisons'),(213,'Démangeaisons de l anus'),(214,'Démangeaisons de la vulve'),(215,'Dépression'),(216,'Déprime'),(217,'Desquamation'),(218,'Difficulté à avaler'),(219,'Difficulté à marcher'),(220,'Difficulté à respirer'),(221,'Diplopie (vision double)'),(222,'Douleur à l estomac'),(223,'Douleur à la cheville'),(224,'Douleur au nombril'),(225,'Douleur au pied'),(226,'Douleur au talon'),(227,'Douleur aux gencives'),(228,'Douleur coccyx'),(229,'Douleurs à la colonne vertébrale'),(230,'Douleurs à la poitrine'),(231,'Douleurs au bras'),(232,'Douleurs aux seins'),(233,'Douleurs Cervicales'),(234,'Douleurs de l épaule'),(235,'Douleurs de la hanche'),(236,'Douleurs des jambes'),(237,'Douleurs du pied et de la cheville'),(238,'Douleurs et crampes abdominales'),(239,'Douleurs et craquements des articulations'),(240,'Douleurs et gonflements des testicules'),(241,'Douleurs lors des relations sexuelles chez la femme'),(242,'Douleurs pelviennes'),(243,'Dysfonction sexuelle masculine'),(244,'Dysgueusie'),(245,'Dyspareunie'),(246,'Dysphonie'),(247,'Dysphorie'),(248,'Dysurie'),(249,'Ecchymoses et hématomes'),(250,'Engourdissements et fourmillements'),(251,'Enrouement'),(252,'Eructations'),(253,'Essoufflement'),(254,'Eternuement'),(255,'Etourdissements et vertiges'),(256,'Exophtalmie'),(257,'Expectorations'),(258,'Extinction de voix'),(259,'Énurésie'),(260,'Faiblesse musculaire'),(261,'Fatigue'),(262,'Fatigue chronique'),(263,'Fatigue des yeux'),(264,'Fièvre'),(265,'Fièvre de bébé'),(266,'Flatulences'),(267,'Fourmis dans les mains'),(268,'Frissons'),(269,'Galactorrhée'),(270,'Ganglion de la gorge'),(271,'Ganglions'),(272,'Gargouillement'),(273,'Gonalgie'),(274,'Halitose (Mauvaise haleine)'),(275,'Hallucinations'),(276,'Hémianopsie'),(277,'Hémoptysie'),(278,'Hépatomégalie'),(279,'Hippocratisme digital'),(280,'Hoquet'),(281,'Hyperacousie'),(282,'Hyperhidrose (Transpiration excessive)'),(283,'Hypertension artérielle'),(284,'Hyperventilation'),(285,'Hypoacousie'),(286,'Hypoesthésie'),(287,'Hypogueusie'),(288,'Hypotension'),(289,'Hypoventilation'),(290,'Incontinence urinaire'),(291,'Infertilité (stérilité)'),(292,'Insomnie (troubles du sommeil) '),(293,'Jambes lourdes'),(294,'Kyste'),(295,'Langue blanche'),(296,'Langue jaune'),(297,'Langue noire'),(298,'Libido'),(299,'Lipothymie'),(300,'Logorrhée'),(301,'Lombalgie'),(302,'Lumbago'),(303,'Main gonflée'),(304,'Mains et pieds froids'),(305,'Mains qui tremblent'),(306,'Mal à la mâchoire'),(307,'Mal au coeur'),(308,'Mal au poignet'),(309,'Mal au talon'),(310,'Mal au ventre'),(311,'Mal aux oreilles'),(312,'Mal de dent'),(313,'Mal de dos'),(314,'Mal de gorge'),(315,'Mal de tête (céphalée)'),(316,'Migraine'),(317,'Nausées'),(318,'Nausées et vomissements'),(319,'Nausées et vomissements de la grossesse'),(320,'Nez bouché'),(321,'Nez qui coule'),(322,'Nodule thyroïdien'),(323,'Obsessions'),(324,'Odeurs vaginales'),(325,'Odynophagie'),(326,'Oedème'),(327,'Oedème des jambes'),(328,'Oeil qui pleure'),(329,'Oligurie'),(330,'Oreille bouchée'),(331,'Oreille qui gratte'),(332,'Pâleur'),(333,'Palpitations'),(334,'Papules et pustules'),(335,'Paralysie'),(336,'Paupières qui tremblent'),(337,'Peau grasse'),(338,'Peau sèche'),(339,'Pellicules dans les cheveux'),(340,'Perte d appétit'),(341,'Perte d équilibre'),(342,'Perte de mémoire'),(343,'Poches sous les yeux'),(344,'Pollakiurie'),(345,'Polydipsie'),(346,'Polypnée'),(347,'Polyurie'),(348,'Présence de sang dans le sperme'),(349,'Problèmes d audition'),(350,'Problèmes de la région anale'),(351,'Problèmes de prostate'),(352,'Problèmes du vagin'),(353,'Ptosis'),(354,'Pupilles dilatées'),(355,'Rectorragie'),(356,'Reflux gastro-oesophagien'),(357,'Règles douloureuses (dysménorrhée)'),(358,'Régurgitations du nourrisson'),(359,'Respiration sifflante'),(360,'Ronflement'),(361,'Rougeurs au visage'),(362,'Saignement du nez'),(363,'Saignements en dehors des règles'),(364,'Salivation excessive'),(365,'Sang dans l urine'),(366,'Sciatique (névralgie)'),(367,'Sécheresse vaginale'),(368,'Sécrétions et mucus'),(369,'Selles anormales'),(370,'Selles noires'),(371,'Somnolence'),(372,'Souffle au coeur'),(373,'Splénomégalie'),(374,'Sueurs nocturnes'),(375,'Symptômes des troubles urinaires'),(376,'Syncope'),(377,'Tachycardie'),(378,'Tachypnée'),(379,'Toux grasse'),(380,'Toux sèche'),(381,'Transpiration des pieds'),(382,'Tristesse'),(383,'Trouble de déficit de l attention / hyperactivité (TDAH)'),(384,'Troubles de la miction'),(385,'Troubles du langage'),(386,'Troubles musculosquelettiques du cou'),(387,'Troubles musculosquelettiques du coude'),(388,'Urine trouble'),(389,'Vaginisme'),(390,'Vertiges'),(391,'Vieillissement de la peau'),(392,'Vomir du sang'),(393,'Yeux qui piquent'),(394,'Yeux rouges'),(395,'Yeux secs'),(396,'Anxiété'),(397,'Dyspnée'),(398,'Agitation'),(399,'Toux'),(400,'Transpiration'),(401,'étourdissements'),(402,'Engourdissement'),(403,'Vision trouble'),(404,'Mal de tête'),(405,'Vomissement');
/*!40000 ALTER TABLE `symptome` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-14 15:32:13
