<?php
include_once('config/constantes.php');
$id = $_SESSION['idusuario'];
$nome = $_SESSION['nome'];
$email = $_SESSION['email'];
$adm = $_SESSION['adm'];

include_once('config/conexao.php');
include_once('func/funcoes.php');


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Locadora</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
  <link rel="stylesheet" href="css/style.css" />
  
</head>

<body class="bg-dark">
  <!-- navbar  -->
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Gêneros
            </a>
            <ul class="dropdown-menu">
              <?php
              $conn = conectar();
              $select = listarTabela('idgenero, genero, ativo', 'genero', 'idgenero');
              if ($select != "Vazio") {
                foreach ($select as $ob) {
                  $genero = $ob->genero;

              ?>
                  <li><a class="dropdown-item" href="#"><?php echo $genero; ?></a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
              <?php
                }
              };
              ?>
            </ul>
          </li>

          <li><a class="dropdown-item" href="exSession.php"><button class="btn btn-outline-danger">Sair</button></a></li>
          <li><a class="btn btn-outline-secondary" href="adm.php" style="text-decoration: none; color: black; <?php if ($adm == 'Cliente') {
                                                                                                                echo ('display: none');
                                                                                                              } ?>">ADM Page</a></li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-dark" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>

  <!-- carroseul -->

  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="8000">
        <img src="img/01-banner.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="8000">
        <img src="img/idrive.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="img/03-banner.jpg" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  </div>
  <br>

  <?php
  $conn = conectar();
  $select = listarTabela('idgenero, genero, ativo', 'genero', 'idgenero');
  if ($select != "Vazio") {
    foreach ($select as $ob) {
      $genero = $ob->genero;
  ?>
      <div class="div" style="color:white">
        <center>
          <h1 style="font-size:450%"><?php echo $genero ?></h1>
        </center>
      </div>
      <div class="container-fluid text-center ">
        <div class="row">
          <?php
          $filme = $conn->query("SELECT f.idfilme, f.filme, f.foto, f.descricao, g.genero FROM filme f JOIN genero g ON g.idgenero = f.idgenero")->fetchAll();
          foreach ($filme as $resultitem) {
            $idfilme = $resultitem['idfilme'];
            $filmeFoto = $resultitem["foto"];
            $filmeNome = $resultitem["filme"];
            $filmeDesc = $resultitem["descricao"];
            $filmeGen  = $resultitem["genero"];


            if ($genero == $filmeGen) {

          ?>
              <div class="col-md-2 mt-4 mb-5 col-sm-6  ">
                <div class="card imgf" style="width: 100%;">
                  <img src="./img/<?php echo ($filmeFoto) ?>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h3 class="card-title text-danger"><?php echo ($filmeNome); ?></h3>
                    <p class="card-text"><b>G~enero: </b><?php echo ($filmeGen) ?></p>
                    <center><button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#vermaifilm<?php echo $idfilme ?>">Ver Mais</button></center>

                  </div>
                </div>
              </div>
              <!-- Modal -->
              <div class="modal fade" id="vermaifilm<?php echo $idfilme ?>" tabindex="-1" aria-labelledby="vermaisprod" aria-hidden="true">
                    <div class="modal-dialog  modal-lg">
                      <div class="modal-content">
                        <div class="modal-header bg-dark text-white">
                          <h1 class="modal-title fs-5" id="exampleModalLabel">Ver mais</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <div class="card mb-3" style="max-width: 100%;">
                            <div class="row g-0">
                              <div class="col-md-4">
                                <img src="img/<?php echo $filmeFoto ?>" class="img-fluid rounded-start" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="card-body">
                                  <h5 class="card-title"><?php echo $filmeNome ?></h5>
                                  <p class="card-text"><?php echo $filmeDesc ?></p>
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Assistir esse filme</button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
          <?php
            }
          }
          ?>
        </div>
      </div>
  <?php
    }
  }
  ?>











  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>


</body>

</html>