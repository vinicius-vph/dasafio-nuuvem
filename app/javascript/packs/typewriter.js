window.onload = () => {
  function typeWriter() {
    const title = document.querySelector('#interativetext');
    const textoArray = title.innerHTML.split('');      
    title.innerHTML = '';      
    textoArray.forEach((letra, i) => {      
      setTimeout(() =>      
      title.innerHTML += letra, 150 * i);
    });
  };
  setInterval(() => typeWriter(), 10000);
};