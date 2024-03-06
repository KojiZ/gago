<?php
include_once("./config/conexao.php");
include_once("./config/constantes.php");
include_once("./func/funcoes.php");


$conn = conectar();
if (isset($_POST['impcadfilm'])) {
    $name = $_POST['impcadfilm'];
    $genero = $_POST['impcadgen'];
    $foto = $_POST['impcadfoto'];
    $descricao = $_POST['impcaddec'];

    $stmt = $conn->prepare("INSERT INTO `bdlocadora`.`filme` (`idgenero`, `filme`, `foto`, `descricao`) VALUES (?, ?, ?, ?)");
    $stmt->bindParam(1, $genero);
    $stmt->bindParam(2, $name);
    $stmt->bindParam(3, $foto);
    $stmt->bindParam(4, $descricao);

    $conn->beginTransaction();
    $stmt->execute();
    $conn->commit();
    header('location:adm.php?page=filmes&alert=sucess');


}


if (isset($_POST['impgener'])) {
    $genero = $_POST['impgener'];


    $stmt = $conn->prepare("INSERT INTO `bdlocadora`.`genero` (`genero`) VALUES (?)");
    $stmt->bindParam(1, $genero);
    $conn->beginTransaction();
    $stmt->execute();
    $conn->commit();
    header('location:adm.php?page=genero&alert=sucess');


}

