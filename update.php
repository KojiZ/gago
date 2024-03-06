<?php
include_once("./config/conexao.php");
include_once("./config/constantes.php");
include_once("./func/funcoes.php");
$conn = conectar();

if (isset($_POST['impidusuario'])) {
    $id = $_POST['impidusuario'];
    $adm = $_POST['impnivelusu'];
    $nome = $_POST['impnomeusu'];
    $email = $_POST['impemailusu'];
    $cpf = $_POST['impcpfusu'];
    $ativo = $_POST['impativousu'];
    $update = "UPDATE usuario SET idusuario = :idusuario, adm = :adm, nome = :nome, email = :email, cpf = :cpf, ativo = :ativo WHERE idusuario = :idusuario";
    $update = $conn->prepare($update);
    $update->bindParam(':idusuario', $id);
    $update->bindParam(':adm', $adm);
    $update->bindParam(':nome', $nome);
    $update->bindParam(':email', $email);
    $update->bindParam(':cpf', $cpf);  
    $update->bindParam(':ativo', $ativo); 
    $conn->beginTransaction();
    $update->execute();
    $conn->commit();
    header('location:adm.php?page=usuario&alt=alter');
  }
  

  
if (isset($_POST['impidfilm'])) {
    $id = $_POST['impidfilm'];
    $filme = $_POST['impfilme'];
    $foto = $_POST['impfoto'];
    $descricao = $_POST['impdesc'];
    $ativo = $_POST['impativo'];
    $update = "UPDATE filme SET idfilme = :idfilme, filme = :filme, foto = :foto, descricao = :descricao, ativo = :ativo WHERE idfilme = :idfilme";
    $update = $conn->prepare($update);
    $update->bindParam(':idfilme', $id);
    $update->bindParam(':filme', $filme);
    $update->bindParam(':foto', $foto);
    $update->bindParam(':descricao', $descricao);
    $update->bindParam(':ativo', $ativo);
    $conn->beginTransaction();
    $update->execute();
    $conn->commit();
    header('location:adm.php?page=filmes&alt=alter');
  }

  if (isset($_POST['impgenero'])) {
    $id =  $_POST['impidgenero'] ;
    $genero = $_POST['impgenero'];
    $ativo = $_POST['impgenativo'];
    $update = "UPDATE genero SET idgenero = :idgenero, genero = :genero, ativo = :ativo WHERE idgenero = :idgenero";
    $update = $conn->prepare($update);
    $update->bindParam(':idgenero', $id);
    $update->bindParam(':genero', $genero);
    $update->bindParam(':ativo', $ativo);
    $conn->beginTransaction();
    $update->execute();
    $conn->commit();
    header('location:adm.php?page=genero&alt=alter');
  }



  
