<?php
include_once("config/conexao.php");
include_once("config/constantes.php");
include_once("func/funcoes.php");

$conn = conectar();
?>
<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Filmes</th>
      <th scope="col">Gêneros</th>
      <th scope="col">Descrição</th>
      <th scope="col">Ativo</th>
      <th scope="col">Ações</th>
      <th scope="col" class="text-dark"><a href="cad.php" name="impregister" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#cadastrofilme">Cadastrar</a></th>
    </tr>
  </thead>
  <tbody>
    <?php

    $select = "SELECT f.idfilme , g.genero , f.filme , f.foto , f.descricao , f.ativo FROM filme f INNER JOIN genero g ON f.idgenero = g.idgenero ORDER BY f.idfilme";
    $select = $conn->prepare($select);
    $conn->beginTransaction();
    $select->execute();
    $conn->commit();
    foreach ($select as $tabela) {
      $idfilme = $tabela['idfilme'];
      $genero = $tabela['genero'];
      $filme = $tabela['filme'];
      $foto = $tabela['foto'];
      $descricao = $tabela['descricao'];
      $ativo = $tabela['ativo'];

    ?>
      <tr>
        <th scope="row"><?php echo ($idfilme); ?></th>
        <td><?php echo ($filme); ?></td>
        <td><?php echo ($genero); ?></td>
        <td><?php echo ($descricao); ?></td>
        <td><?php echo ($ativo); ?></td>

        <td>
          <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#vermaiend<?php echo $idfilme ?>">Ver+</button>
            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#alteend<?php echo $idfilme ?>">Atualizar</button>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#excluirend<?php echo $idfilme ?>">Deletar</button>
          </div>
        </td>
      </tr>
      <!-- Modal -->
      <div class="modal fade" id="vermaiend<?php echo $idfilme ?>" tabindex="-1" aria-labelledby="vermaisprod" aria-hidden="true">
        <div class="modal-dialog ">
          <div class="modal-content">
            <div class="modal-header bg-dark text-white">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Ver Mais</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <p><b>ID: </b>
                <?php echo ($idfilme) ?>
              </p>
              <p><b>Gênero: </b>
                <?php echo ($genero) ?>
              </p>
              <p><b>Nome: </b>
                <?php echo ($filme) ?>
              </p>
              <p><b>Foto: </b>
                <?php echo ($foto) ?>
              </p>
              <p><b>Descição: </b>
                <?php echo ($descricao) ?>
              </p>
              <p><b>Ativo: </b>
                <?php echo ($ativo) ?>
              </p>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal-exluir-->
      <div class="modal fade" id="excluirend<?php echo $idfilme ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header text-white bg-dark">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Deletar Filme</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-danger">
              <h5>Voce tem certeza que deseja excluir ??!</h5>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
              <a href="delete.php?idfilme=<?php echo $idfilme ?>" class="btn btn-danger">Sim</a>
            </div>
          </div>
        </div>
      </div>



      <!-- Modal -->
      <div class="modal fade" id="alteend<?php echo $idfilme ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header text-white bg-dark">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Atualizar Filme</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="update.php" method="post">
                <div class="mb-3">
                  <input type="text" class="form-control d-none" id="impidfilm" name="impidfilm" value="<?php echo $idfilme ?>">
                </div>
                <div class="mb-3">
                  <label for="impfilme" class="form-label">Nome:</label>
                  <input type="text" class="form-control" id="impfilme" name="impfilme" value=" <?php echo ($filme) ?>">
                </div>
                <div class="mb-3">
                  <label for="formFile" class="form-label">Foto:</label>
                  <input class="form-control" type="file" id="impfoto" name="impfoto" value="<?php echo ($foto) ?>">
                </div>
                <div class="mb-3">
                  <label for="impdesc" class="form-label">Descrição:</label>
                  <input type="text" class="form-control" id="impdesc" name="impdesc" value="<?php echo ($descricao) ?>">
                </div>
                <label for="impativoend">Ativo:</label>
                <select class="form-select" aria-label="Default select example" id="impativo" name="impativo">
                  <option selected><?php
                                    if ($ativo == 'A') {
                                      $ativo = 'Ativado';
                                    } else {
                                      $ativo = 'Desativado';
                                    }
                                    echo $ativo; ?></option>
                  <?php if ($ativo == 'Ativado') { ?><option value="D">Desativado</option><?php } ?>
                  <?php if ($ativo == 'Desativado') { ?><option value="A">Ativado</option><?php } ?>
                </select>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
              <button type="submit" class="btn btn-success">Salvar Mudanças</a></button>
              </form>
            </div>
          </div>
        </div>
      </div>


    <?php
    }
    ?>

    <!-- Modal -->
    <div class="modal fade" id="cadastrofilme" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header text-white bg-dark">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Filme</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="cad.php" method="post">
              <div class="mb-3">
                <label for="impcadfilm" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="impcadfilm" name="impcadfilm" placeholder="Informe o nome do filme">
              </div>
              <label for="impcadgen" class="form-label">Gênero:</label>
              <select class="form-select" aria-label="Default select example" id="impcadgen" name="impcadgen">
                <?php
                 $select = listarTabela('idgenero, genero, ativo', 'genero', 'idgenero');
                 if ($select != "Vazio") {
                   foreach ($select as $ob) {
                    $idgenero = $ob->idgenero;
                    $genero = $ob->genero;
                   
                 ?>
                <option value="<?php echo $idgenero ?>"><?php echo $genero ?></option>
                <?php
                  
                   }}
                ?>
              </select>
              <div class="mb-3">
                <label for="impcadfoto" class="form-label">Foto:</label>
                <input class="form-control" type="file" id="impcadfoto" name="impcadfoto" >
              </div>
              <div class="mb-3">
                <label for="impcaddec" class="form-label">Descrição:</label>
                <input type="text" class="form-control" id="impcaddec" name="impcaddec" placeholder="Descreva seu filme">
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            <button type="submit" class="btn btn-success">Cadastra</a></button>
            </form>
          </div>
        </div>
      </div>
    </div>

  </tbody>
</table>