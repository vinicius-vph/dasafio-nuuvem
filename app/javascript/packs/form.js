window.formSubmit = function(e) {
  console.log('passou')
  if (document.getElementById("tab_input").value == "") {
    e.preventDefault();
    alert("O campo está vazio selecione um arquivo .txt para continuar !");
  } else {
    document.getElementById('loading_box').style.display = "flex"
  }
}

// function toogle() {
//   document.getElementById('loading_box').style.display = "flex"
// }
