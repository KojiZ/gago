<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Gênero</th>
      <th scope="col">Ativo</th>
      <th scope="col">Ações</th>
      <th scope="col" class="text-dark"><a href="cad.php" name="impregister" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#cadastrogenero">Cadastrar</a></th>
    </tr>
  </thead>
  <tbody>
    <?php
    $select = listarTabela('idgenero, genero, ativo', 'genero', 'idgenero');
    if ($select != "Vazio") {
      foreach ($select as $ob) {
        $idgenero = $ob->idgenero;
        $genero = $ob->genero;
        $ativo = $ob->ativo;

    ?>
        <tr>
          <th scope="row">
            <?php echo ($idgenero) ?>
          </th>
          <td>
            <?php echo ($genero) ?>
          </td>
          <td>
            <?php echo ($ativo) ?>
          </td>
          <td>
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
              <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#vermaisgene<?php echo $idgenero ?>">Ver+</button>
              <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#altegene<?php echo $idgenero ?>">Atualizar</button>
              <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#excluigene<?php echo $idgenero ?>">Deletar</button>
            </div>
          </td>
        </tr>
        <!-- Modal -->
        <div class="modal fade" id="vermaisgene<?php echo $idgenero ?>" tabindex="-1" aria-labelledby="vermaisprod" aria-hidden="true">
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header bg-dark text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Ver Mais</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <p><b>ID: </b>
                  <?php echo ($idgenero) ?>
                </p>
                <p><b>Gênero: </b>
                  <?php echo ($genero) ?>
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
        <div class="modal fade" id="excluigene<?php echo $idgenero ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header text-white bg-dark">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Deletar Gênero</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body text-danger">
                <h5>Voce tem certeza que deseja excluir ??!</h5>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
                <a href="delete.php?idgenero=<?php echo $idgenero ?>" class="btn btn-danger">Sim</a>
              </div>
            </div>
          </div>
        </div>





        <!-- Modal -->
        <div class="modal fade" id="altegene<?php echo $idgenero ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header text-white bg-dark">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Atualizar Gênero</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="update.php" method="post">
                  <div class="mb-3">
                    <input type="text" class="form-control d-none" id="impidgenero" name="impidgenero" value="<?php echo $idgenero ?>">
                  </div>
                  <div class="mb-3">
                    <label for="impgenero" class="form-label">Gênero:</label>
                    <input type="text" class="form-control" id="impgenero" name="impgenero" value="<?php echo $genero ?>">
                  </div>
                  <label for="impgenativo">Ativo:</label>
                  <select class="form-select" aria-label="Default select example" id="impgenativo" name="impgenativo">
                    <option selected><?php
                                      if ($ativo == 'A') {
                                        $ativo = 'Ativado';
                                      } else {
                                        $ativo = 'Desativado';
                                      }
                                      echo $ativo; ?></option>
                    <?php if ($ativo == 'Ativado') { ?><option value="D">Desativado</option><?php } ?>
                    <?php if ($ativo == 'Desativado') { ?><option value="A">Ativo</option><?php } ?>
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
    }
    ?>


 <!-- Modal -->
 <div class="modal fade" id="cadastrogenero" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header text-white bg-dark">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Gênero</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="cad.php" method="post">

              <label for="impgener" class="form-label">Gênero:</label>
              <input type="text" class="form-control" id="impgener" name="impgener">

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            <button type="submit" class="btn btn-success">Cadastrar</a></button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </tbody>
</table>