# Analisador de Transações Financeiras

## Descrição do desafio/App

A aplicação é um analisador de transações financeiras, com página inicial, página de upload de arquivos e página de demonstração das transações analisadas.</br> 
A aplicação é capaz de aceitar upload de arquivos no formato .tab com separação de colunas por escapes <b>\t</b>, é feito parseamento do arquivo, salvo em um banco de dados sqlite e exibidas de forma bem intuitiva as transações importadas, para exemplo e teste de utilização foram utilizados os arquivos: [Arquivo TAB 01](https://github.com/vinicius-vph/dasafio-nuuvem/blob/main/example_input.tab) [Arquivo TAB 02](https://github.com/vinicius-vph/dasafio-nuuvem/blob/main/example_input_two.tab).


<br>

## Para utilizar o projeto é necessário ter:

<table>
    <tr>
        <td>Ferramenta</td>
        <td>Versão</td>
    </tr>
    <tr>
        <td>Ruby</td>
        <td>2.6.5</td>
    </tr>
    <tr>
        <td>Rails</td>
        <td>6.0.4</td>
    </tr>
</table>

<table>
    <tr>
        <td>Banco de dados</td>
        <td>Versão</td>
    </tr>
    <tr>
        <td>Sqlite3</td>
        <td>1.4</td>
    </tr>
</table>

<br>

<p>É necessário também ter uma chave ssh válida configurada, você pode obter mais informações <a href="https://docs.github.com/pt/github/authenticating-to-github/connecting-to-github-with-ssh">Aqui</a></p>
</br>
<br>
<hr>

## Para utilizar o projeto siga os passos abaixo: 


#### Clone o repositório
```
$ git@github.com:vinicius-vph/dasafio-nuuvem.git
```

#### Acesse a pasta do projeto
```
$ cd dasafio-nuuvem
```

#### Instale as dependencias do ruby e do rails  
```
$ bundle install
```

#### Instale as dependencias do javascript 
```
$ yarn
```

#### Se necessário crie as tabelas manualmente
```
$ rails db:migrate
```

<br>

#### Inicialize o servidor do projeto localmente
```
$ rails s
```
Acesse o endereço  <a href="http://localhost:3000">http://localhost:3000</a>
