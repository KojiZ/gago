<?php
include_once("./config/conexao.php");
include_once("./config/constantes.php");
include_once("./func/funcoes.php");
$conn = conectar();

if (isset($_GET['idfilme'])) {
  $id = $_GET['idfilme'];
  $delete = "DELETE FROM filme WHERE idfilme = :id";
  $delete = $conn->prepare($delete);
  $delete->bindParam(':id', $id);
  $conn->beginTransaction();
  $delete->execute();
  $conn->commit();
  header('location:adm.php?page=filmes&del=delet');
}

if (isset($_GET['idusuario'])) {
    $id = $_GET['idusuario'];
    $delete = "DELETE FROM usuario WHERE idusuario = :id";
    $delete = $conn->prepare($delete);
    $delete->bindParam(':id', $id);
    $conn->beginTransaction();
    $delete->execute();
    $conn->commit();
    header('location:adm.php?page=usuario&del=delet');
  }


  if (isset($_GET['idgenero'])) {
    $id = $_GET['idgenero'];
    $delete = "DELETE FROM genero WHERE idgenero = :id";
    $delete = $conn->prepare($delete);
    $delete->bindParam(':id', $id);
    $conn->beginTransaction();
    $delete->execute();
    $conn->commit();
    header('location:adm.php?page=genero&del=delet');
  }




