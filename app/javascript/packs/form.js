window.formSubmit = function(event) {
  if (document.getElementById('transaction_tab_input').value == '') {
    event.preventDefault();
    alert('O campo está vazio, selecione um arquivo do tipo .txt e clique em enviar para continuar !');
  } else {
    document.getElementById('form_box').style.display = 'none';
    document.getElementById('loading_box').style.display = 'flex';
  }
};