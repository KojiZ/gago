-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema fashionmoon
--

CREATE DATABASE IF NOT EXISTS fashionmoon;
USE fashionmoon;

--
-- Definition of table `detalhepedido`
--

DROP TABLE IF EXISTS `detalhepedido`;
CREATE TABLE `detalhepedido` (
  `iddetalhePedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproduto` int(10) unsigned NOT NULL,
  `idpedido` int(10) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `ativo` char(1) NOT NULL DEFAULT 'A',
  `cadastro` datetime NOT NULL,
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`iddetalhePedido`,`idpedido`,`idproduto`),
  KEY `FK_detalhepedido_pedido` (`idpedido`,`idproduto`),
  CONSTRAINT `FK_detalhepedido_pedido` FOREIGN KEY (`idpedido`, `idproduto`) REFERENCES `pedido` (`idpedido`, `idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalhepedido`
--

/*!40000 ALTER TABLE `detalhepedido` DISABLE KEYS */;
INSERT INTO `detalhepedido` (`iddetalhePedido`,`idproduto`,`idpedido`,`quantidade`,`ativo`,`cadastro`,`alteracao`) VALUES 
 (1,1,1,2,'A','2024-02-01 12:14:21','2024-02-24 20:34:09');
/*!40000 ALTER TABLE `detalhepedido` ENABLE KEYS */;


--
-- Definition of table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `idendereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idusuario` int(10) unsigned NOT NULL,
  `rua` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `ativo` char(1) NOT NULL DEFAULT 'A',
  `cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idendereco`,`idusuario`) USING BTREE,
  KEY `FK_endereco_usuario` (`idusuario`),
  CONSTRAINT `FK_endereco_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `endereco`
--

/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`idendereco`,`idusuario`,`rua`,`bairro`,`cidade`,`uf`,`numero`,`complemento`,`cep`,`ativo`,`cadastro`,`alteracao`) VALUES 
 (1,2,'Rua Israel Pinheiro','Centro','Governador Valadares','MG',3391,'APTO 3','35010-131','A','2024-02-28 09:00:04','2024-02-28 09:00:04');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


--
-- Definition of table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
  `idestoque` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproduto` int(10) unsigned NOT NULL,
  `qntdisponivel` int(10) unsigned NOT NULL,
  `qntminima` int(10) unsigned NOT NULL,
  `ultimaversao` datetime NOT NULL COMMENT '''Quando foi atulizzado pela ultima vez''',
  `ativo` char(1) NOT NULL,
  `cadastro` datetime NOT NULL,
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idestoque`,`idproduto`) USING BTREE,
  KEY `FK_estoque_produto` (`idproduto`),
  CONSTRAINT `FK_estoque_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estoque`
--

/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` (`idestoque`,`idproduto`,`qntdisponivel`,`qntminima`,`ultimaversao`,`ativo`,`cadastro`,`alteracao`) VALUES 
 (1,1,13,50,'2024-02-24 14:15:25','','2024-02-24 14:15:25','2024-02-24 20:16:03'),
 (2,3,25,100,'2024-02-24 14:15:25','','2024-02-24 14:15:25','2024-02-24 20:16:03'),
 (3,10,20,25,'2024-02-24 14:15:25','','2024-02-24 14:15:25','2024-02-24 20:16:05');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;


--
-- Definition of table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `idpedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproduto` int(10) unsigned NOT NULL,
  `situacao` varchar(80) NOT NULL COMMENT '''Andamento,Entregue,Enviado''',
  `dataenvio` datetime NOT NULL,
  `datafinal` datetime DEFAULT NULL,
  `ativo` char(1) NOT NULL DEFAULT 'A',
  `cadastro` datetime NOT NULL,
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idpedido`,`idproduto`) USING BTREE,
  KEY `FK_pedido_produto` (`idproduto`),
  CONSTRAINT `FK_pedido_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedido`
--

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`idpedido`,`idproduto`,`situacao`,`dataenvio`,`datafinal`,`ativo`,`cadastro`,`alteracao`) VALUES 
 (1,1,'Enviando','2024-02-24 14:15:25',NULL,'A','2024-02-24 14:15:25','2024-02-24 20:18:31'),
 (2,10,'Entregue','2023-12-25 15:25:14','2024-02-24 14:15:25','A','2023-12-25 15:25:14','2024-02-24 20:18:31'),
 (3,3,'Andamento','2023-05-12 14:32:12','2023-06-23 14:32:12','A','2023-05-12 14:32:12','2024-02-24 20:18:31'),
 (4,2,'Entregue','2023-05-12 14:32:12','2023-07-12 14:32:12','A','2023-05-12 14:32:12','2024-02-24 20:18:36');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `idproduto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) NOT NULL,
  `produto` varchar(100) NOT NULL,
  `tamanho` varchar(3) NOT NULL COMMENT 'M,P,L,XXL,GG',
  `descricao` varchar(225) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `cor` varchar(30) NOT NULL,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idproduto`,`foto`,`produto`,`tamanho`,`descricao`,`valor`,`cor`,`genero`) VALUES 
 (1,'blusa1.jpg','blusa','M','Blusa Em Meia Malha Com Manga Curta E Estampa Flor Skate','69.00','Branco Neve','Feminino'),
 (2,'blusa2.jpg','blusa','P','Blusa Em Algodão Peruano Com Gola Redonda Vermelha E Manga Curta Vermelha','59.00','Branca','Feminino'),
 (3,'blusa3.jpg','blusa','G','Blusa Alongada em Meia Malha com Estampa Borboleta Trevosa Cinza 2','70.00','Cinza','Feminino'),
 (4,'blusa4.jpg','blusa','M','Blusa Cropped Em Poliamida Canelada Com Manga Curta','80.00','Preta','Feminino'),
 (5,'blusa5.jpg','blusa','P','Blusa  Em Poliamida Canelada Com Manga Longa','75.00','Azul','Feminino'),
 (6,'blusa6.jpg','blusa','PP','Blusa Em Viscolinho Com Alça Folgada','50.00','Branco','Feminino'),
 (7,'camiseta1.jpg','camiseta','M','Camiseta Manga Curta em Meia Malha com Garfield Estampado Branco Neve 2\r\n','78.00','Branco Neve','Feminino'),
 (8,'camiseta2.jpg','camiseta','GG','Camiseta em Viscose com Estampa Listrada e Capivarinhas ','58.00','Verde','Feminino'),
 (9,'camiseta3.jpg','camiseta','P','Camiseta Em Algodão Peruano Com Gola Redonda E Manga Curta','25.00','Branca','Feminino'),
 (10,'camiseta4.jpg','camiseta','PP','Camiseta Em Meia Malha Com Estampa Aranha Poison','74.00','Branco','Feminino'),
 (11,'camiseta5.jpg','camiseta','M','Camiseta Manga Curta em Meia Malha com Estampa \r\n','82.00','Cinza','Feminino'),
 (12,'camiseta6.jpg','camiseta','G','Camiseta em Algodão Peruano com Gola Redonda e Manga Curta','45.00','Rosa  Claro','Feminino'),
 (13,'vestido1.jpg','vestido','M','Vestido Longo Ombro Só Em Linho Listrado E Fio Tinto','125.00','Beje','Feminino'),
 (14,'vestido2.jpg','vestido','G','Vestido New Midi Em Tricoline Com Lastex Nas Costas ','140.00','Verde','Feminino'),
 (15,'vestido3.jpg','vestido','P','Vestido Midi Em Linho Com Decote Coração E Listras','210.00','Verde Claro','Feminino'),
 (16,'vestido4.jpg','vestido','GG','Vestido Curto Em Viscose Com Abotoamento Frontal E Lastex Nas Costas','150.00','Preto','Feminino'),
 (17,'vestido5.jpg','vestido','P','Vestido Curto Em Viscose Transpassada Com Estampa De Bananas Capri\r\n','140.00','Branco','Feminino'),
 (18,'vestido6.jpg','vestido','PP','Vestidinho De Alça Em Sarja Com Com Abertura Frontal','130.00','Rosa','Feminino'),
 (19,'bermuda1.jpg','bermuda','M','Bermuda Em Jeans Com Bolso Cargo E Recorte ','90.00','Azul','Feminino'),
 (20,'bermuda2.jpg','bermuda','M','Bermuda Curto Jeans Com Barra Dobrada ','123.00','Azul','Feminino'),
 (21,'bermuda3.jpg','bermuda','G','Bermuda Média Em Sarja Com Botões Brasão No Cós E Bolsos Traseiros ','60.00','Preto','Feminino'),
 (22,'bermudam1.jpg','bermuda','M','Bermuda Em Sarja Lavada Com Amarração No Cós ','59.00','Verde Claro','Masculino'),
 (23,'bermudam2.jpg','bermuda','M','Bermuda Em Sarja Com Elástico No Cós E Cordão','80.00',' Cinza','Masculino'),
 (24,'croppeds1.jpg','cropped','P','Cropped Em Viscose Com Lastex ','69.00','Laranja','Feminino'),
 (25,'croppeds2.jpg','cropped','P','Cropped Em Tricô Com Ponto Diferenciado E Manga Curta ','59.00','Verde','Feminino'),
 (26,'croppeds3.jpg','cropped','M','Cropped Em Bengaline Corsetado Com Barra Assimétrica ','40.00','Vermelho','Feminino'),
 (27,'croppeds4.jpg','cropped','PP','Cropped Jeans Com Busto Marcado E Amarração No Pescoço \r\n','23.00','Azul','Feminino'),
 (28,'casaco1.jpg','casaco','M','Casaco Em Moletom Com Capuz E Cava Deslocada ','140.00','Verde','Feminino'),
 (29,'casaco2.jpg','casaco','M','Casaco Cardigan Alongado Em Tricô Com Gola De Pelinhos E Bolsos Preto','150.00','Preto','Feminino'),
 (30,'casaco3.jpg','casaco','G','Casaco Cardigan Alongado Em Chenille Com Bolsos','152.00','Marrom','Feminino'),
 (31,'casaco4.jpg','casaco','M','Casaco Alongado Em Tricô Com Manga Ampla E Estampa Abstrata ','201.00','Laranja','Feminino'),
 (32,'chapeu1.jpg','chapeu','M','Chapéu De Praia Viseira Texturizado Com Fechamento Em Velcro Off White','59.00','Branco','Feminino'),
 (33,'chapeu2.jpg','chapeu','M','Chapéu De Praia Com Aba Curvada E Tramas Texturizadas','59.00','Bege','Feminino'),
 (34,'camisa1.jpg','camisa','M','Camisa Cropped Em Linho Com Bolso Com Tonalidade\r\nForte','85.00','Laranja','Feminino'),
 (35,'camisa2.jpg','camisa','M','Camisa Viscose Com Manga  Listrada E Com Estampa Lateral \r\n','56.00','Multicor','Feminino'),
 (36,'camisa3.jpg','camisa','M','Camisa Texturizada Com Bolsos Frontais E Botões Diferenciados \r\n','80.00','Preto','Feminino'),
 (37,'regata1.jpg','regata','P','Regata Regular Em Ribana Com Gola Redonda \r\n','59.00','Preto','Masculino'),
 (38,'regata2.jpg','regata','P','Regata Comfort Em Algodão Com Textura Canelada \r\n','59.00','Branco Neve','Masculino'),
 (39,'saia1.jpg','saia','P','Short Saia Em Viscose Com Babado E Estampa Floral Liberty','70.00','Azul','Feminino'),
 (40,'saia2.jpg','saia','P','Short Saia Em Tricoline Com Listras Em Fio Tinto E Preguinhas','63.00','Azul','Feminino'),
 (41,'tenis1.jpg','tenis','37','Tênis de Cano Baixo Com Recortes','150.00','Branco','Feminino'),
 (42,'tenis2.jpg','tenis','37','Tênis Vintage Em PU Com Recortes','200.00','Preto','Feminino'),
 (43,'tenis3.jpg','tenis','40','Tênis Com Cano Médio Em Algodão Com Sola Vulcanizada ','170.00','Marrom','Feminino'),
 (44,'calca1.jpg','calça','M','Calça Jogger Cintura Alta Em Sarja Com Bolsos ','150.00','Verde Oliva\r\n','Feminino'),
 (45,'calca2.jpg','calça','M','Calça Wide Leg Cintura Média Em Jeans \r\n','170.00','Azul','Feminino'),
 (46,'calcam1.jpg','calça','M','Calça Slim Relaxed Jeans Com Bolsos Médio','89.00','Azul ','Masculino'),
 (47,'calcam2.jpg','calça','M','Calça Comfort Em Sarja Com Cordão E Bolsos','100.00','Verde','Masculino'),
 (48,'chinelo1.jpg','chinelo','37','Chinelo Havaianas Slim Com Estampa ','59.00','Cinza','Unisex'),
 (49,'chinelo2.jpg','chinelo','38','Chinelo Havaianas Slim Com Estampa ','59.00','Rosa','Unisex'),
 (50,'chinelo3.jpg','chinelo','40','Chinelo Slim Gloss Havaianas ','45.00','Azul','Unisex'),
 (51,'camisetam1.jpg','camiseta','G','Camiseta Comfort Em Meia Malha Com Estampa Tropical Summer Paradise','60.00','Verde','Masculino'),
 (52,'camisetam2.jpg','camiseta','M','Camiseta Relaxed Em Meia Malha Com Bordado E Estampa Taz Trap Nas Costas ','78.00','Marrom','Masculino'),
 (53,'tenism1.jpg','tenis','40','Tênis Street Em Couro Nobuck Com Cano Baixo E Recortes ','150.00','Marrom','Masculino'),
 (54,'tenism2.jpg','tenis','42','Tênis Mule Texturizado Com Recorte Lateral','120.00','Bege','Masculino'),
 (55,'bebe1.jpg','infantil','M','Conjunto Infantil Com Babados E Estampa Floral - Tam 0 A 18 Meses','130.00','Rosa','Infantil'),
 (56,'bebe2.jpg','infantil','M','Jardineira Infantil Longa Em Sarja - Tam 5 A 14 Anos ','75.00','Bege','Infantil'),
 (57,'bebe3.jpg','infantil','P','Jaqueta Infantil Em Moletom Com Capuz E Estampa Em Lettering NYC Frente E Costas - Tam 5 A 14 Anos','200.00','Cinza','Infantil');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adm` enum('Cliente','Usuario','Adm') NOT NULL DEFAULT 'Cliente',
  `nome` varchar(80) NOT NULL,
  `email` varchar(70) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(17) DEFAULT NULL,
  `ativo` char(1) NOT NULL DEFAULT 'A',
  `cadastro` datetime NOT NULL,
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`,`adm`,`nome`,`email`,`senha`,`cpf`,`ativo`,`cadastro`,`alteracao`) VALUES 
 (1,'Usuario','Clarisse','clarisse@gmail.com','$2y$12$W9SGyO0wtwkgrf/U5pbGVu3SMOITYyPXp6w3pMvcu7lXjxP0kq/0u','12022587412','A','2024-02-24 13:25:14','2024-02-26 13:23:26'),
 (2,'Adm','MIguel','mii@gmail.com','$2y$12$ksTCfhwTT0futtpASJ.HjeJNF3Cl79qhYoDg7ToaWi9g0qHCJVPxC','25489632512','A','2024-02-24 13:25:14','2024-02-26 13:22:17'),
 (3,'Cliente','Giovanna','gicardoso@gmail.com','$2y$12$EsPV5Vl5ERUY9dRUt7h1EOwTWbunMbGqU5vRC9Mc8b0wEaEezey/G','10236978521','A','2024-02-24 14:08:44','2024-02-26 13:24:30'),
 (4,'Cliente','asdas','asda@Qasda','$2y$12$rOb/2JrPGMMdMq2OW..hX.bjxLI7/x.AKrKb2.Tcv1Iy2tLMHZl6u',NULL,'A','0000-00-00 00:00:00','2024-02-26 14:19:44'),
 (5,'Cliente','Maria','mariaritacassia70@gmail.com','$2y$12$bV4Sfatp6tJlm/AChusx5uH/PctT0mxq0drTKH7m5N456g8LiyL0a','11180547683','A','0000-00-00 00:00:00','2024-02-26 15:12:39'),
 (6,'Cliente','Leandrinho','leandrotelles@gmail.com','$2y$12$9Jdl2SnOzMhZU/iYOW1QWOS7Hno5yjR0yZ3EgbxxHA.HPj49H8VFS','02207858642','A','0000-00-00 00:00:00','2024-02-26 15:17:35'),
 (7,'Cliente','Google','workspace@gmail.com','$2y$12$yYFrgUk4HbS4B4k1XJ.AM.i58UXSLOSS9ryYN0rIJP1pLgsgSVxZy','11111111111','A','0000-00-00 00:00:00','2024-02-26 22:37:38'),
 (8,'Cliente','Luri','lurinho@gmail.com','$2y$12$rGkI9MXLyeyUoPXbUouhaO.MhDspufUCH0bV7C48rC103ym9dvL6S','22222222222','A','0000-00-00 00:00:00','2024-02-26 22:48:22'),
 (9,'Cliente','arvorinho','calebasso@gmail.com','$2y$12$8n48pPV1WVt48cYPFQkcyObku.bkTuqyZ/9KAfB1HrLxX1qs/.YBC','33333333333','A','0000-00-00 00:00:00','2024-02-26 22:54:50');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
