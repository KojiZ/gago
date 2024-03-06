const cep = document.querySelector("#cep");
const logradouro = document.querySelector("#logradouro");
const bairro = document.querySelector("#bairro");
const localidade = document.querySelector("#localidade");
const uf = document.querySelector("#uf");
const showData = (result) => {
  for (const campo in result) {
    if (document.querySelector("#" + campo)) {
      document.querySelector("#" + campo).value = result[campo]
    }
  }
}
cep.addEventListener("blur", (e) => {
  let search = cep.value.replace("-", "");
  const options = {
    method: 'GET',
    mode: 'cors',
    cache: 'default'
  }
  fetch(`https://viacep.com.br/ws/${search}/json/`, options)
    .then(response => {
      response.json()
        .then(data => showData(data))
    })
    .catch(e => console.log('Deu erro: ' + e, message))
});
