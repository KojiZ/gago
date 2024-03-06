<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nível</th>
      <th scope="col">Nome</th>
      <th scope="col">Email</th>
      <th scope="col">CPF</th>
      <th scope="col">Ativo</th>
      <th scope="col">Ações</th>
    </tr>
  </thead>
  <tbody>
    <?php
    $select = listarTabela('idusuario, adm, nome, email, senha, cpf, ativo', 'usuario', 'idusuario');
    if ($select != "Vazio") {
      foreach ($select as $ob) {
        $idusuario = $ob->idusuario;
        $adm = $ob->adm;
        $nome = $ob->nome;
        $email = $ob->email;
        $cpf = $ob->cpf;
        $ativo = $ob->ativo;
    ?>
        <tr>
          <th scope="row">
            <?php echo ($idusuario) ?>
          </th>
          <td>
            <?php echo ($adm) ?>
          </td>
          <td>
            <?php echo ($nome) ?>
          </td>
          <td>
            <?php echo ($email) ?>
          </td>
          <td>
            <?php echo ($cpf) ?>
          </td>
          <td>
            <?php echo ($ativo) ?>
          </td>
          <td>
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
              <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#vermaisusu<?php echo $idusuario ?>">Ver+</button>
              <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#alteusu<?php echo $idusuario ?>">Atualizar</button>
              <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#excluirusu<?php echo $idusuario ?>">Deletar</button>
            </div>
          </td>
        </tr>
        <!-- Modal -->
        <div class="modal fade" id="vermaisusu<?php echo $idusuario ?>" tabindex="-1" aria-labelledby="vermaisprod" aria-hidden="true">
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header bg-dark text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Ver Mais</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <p><b>ID: </b>
                  <?php echo ($idusuario) ?>
                </p>
                <p><b>Nível: </b>
                  <?php echo ($adm) ?>
                </p>
                <p><b>Nome: </b>
                  <?php echo ($nome) ?>
                </p>
                <p><b>Email: </b>
                  <?php echo ($email) ?>
                </p>
                <p><b>CPF: </b>
                  <?php echo ($cpf) ?>
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
        <div class="modal fade" id="excluirusu<?php echo $idusuario ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header text-white bg-dark">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Deletar Usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body text-danger">
                <h5>Voce tem certeza que deseja deletar ?</h5>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
                <a href="delete.php?idusuario=<?php echo $idusuario ?>" class="btn btn-danger">Sim</a>
              </div>
            </div>
          </div>
        </div>





        <!-- Modal -->
        <div class="modal fade" id="alteusu<?php echo $idusuario ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header text-white bg-dark">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Atualizar Usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="update.php" method="post">
                  <div class="mb-3">
                    <input type="text" class="form-control d-none" id="impidusuario" name="impidusuario" value="<?php echo $idusuario ?>">
                  </div>
                  <div class="mb-3">
                    <label for="impnivelusu" class="form-label">Nível:</label>
                    <input type="text" class="form-control" id="impnivelusu" name="impnivelusu" value="<?php echo $adm ?>">
                  </div>
                  <div class="mb-3">
                    <label for="impnomeusu" class="form-label">Nome:</label>
                    <input type="text" class="form-control" id="impnomeusu" name="impnomeusu" value="<?php echo $nome ?>">
                  </div>
                  <div class="mb-3">
                    <label for="impemailusu" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="impemailusu" name="impemailusu" value="<?php echo $email ?>">
                  </div>
                  <div class="mb-3">
                    <label for="impcpfusu" class="form-label">CPF:</label>
                    <input type="text" class="form-control" id="impcpfusu" name="impcpfusu" value="<?php echo $cpf ?>">
                  </div>
                  <label for="impativousu">Ativo:</label>
                  <select class="form-select" aria-label="Default select example" id="impativousu" name="impativousu">
                    <option selected><?php
                                      if ($ativo == 'A') {
                                        $ativo = 'Ativado';
                                      } else {
                                        $ativo = 'Desativado';
                                      }
                                      echo $ativo; ?></option>
                    <?php if ($ativo == 'Ativado') { ?><option value="D">Desativar</option><?php } ?>
                    <?php if ($ativo == 'Desativado') { ?><option value="A">Ativar</option><?php } ?>
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
  </tbody>
</table>