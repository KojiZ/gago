<?php
include_once("config/conexao.php");
include_once("config/constantes.php");
include_once("func/funcoes.php");
if (isset($_SESSION['idusuario'])) {
  $id = $_SESSION['idusuario'];
  $nome = $_SESSION['nome'];
  $email = $_SESSION['email'];
  $adm = $_SESSION['adm'];
}
$options = [
  'cost' => 12
];
$conn = conectar();
if (isset($_POST['impnomecad'])) { // Registro no site
  $impnome = $_POST['impnomecad'];
  $impemail = $_POST['impemailcad'];
  $impsenha = $_POST['impsenhacad'];
  $impcpf = $_POST['impcpfcad'];
  $hashPass = password_hash($impsenha, PASSWORD_BCRYPT, $options);
  $register = "INSERT INTO usuario (nome, email, senha, cpf) VALUES (:impnome, :impemail, :impsenha, :impcpf)";
  $insert = $conn->prepare($register);
  $insert->bindParam(':impnome', $impnome);
  $insert->bindParam(':impemail', $impemail);
  $insert->bindParam(':impsenha', $hashPass);
  $insert->bindParam(':impcpf', $impcpf);
  $conn->beginTransaction();
  $insert->execute();
  $conn->commit();
  header("Location: index.php?cad=sucesso");
}
if (isset($_POST['cep'])) {
  $cep = $_POST['cep'];
  $logradouro = $_POST['logradouro'];
  $numero = $_POST['numero'];
  $bairro = $_POST['bairro'];
  $localidade = $_POST['localidade'];
  $uf = $_POST['uf'];
  $complemento = $_POST['complementos'];
  $registro = "INSERT INTO endereco (idusuario, rua, bairro, cidade, uf, numero, complemento, cep) VALUES (:idusuario, :rua, :bairro, :localidade, :uf, :numero, :complemento, :cep)";
  $insert = $conn->prepare($registro);
  $insert->bindParam(':idusuario', $id);
  $insert->bindParam(':rua', $logradouro);
  $insert->bindParam(':bairro', $bairro);
  $insert->bindParam(':localidade', $localidade);
  $insert->bindParam(':uf', $uf);
  $insert->bindParam(':numero', $numero);
  $insert->bindParam(':complemento', $complemento);
  $insert->bindParam(':cep', $cep);
  $conn->beginTransaction();
  $insert->execute();
  $conn->commit();
  header("Location: home.php?cad=sucesso");
}
 