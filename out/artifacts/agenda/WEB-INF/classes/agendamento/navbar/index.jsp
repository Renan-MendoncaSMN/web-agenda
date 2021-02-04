<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="cabecalho">
    <div class="logo">
        <a href="#inicio">
            <img src="agendamento/img/logo.jpg" alt="Logo"/>
        </a>
    </div>
    <button class="menu-toggle">
        <i class="fa fa-lg fa-bars"></i>
    </button>
    <nav class="menu">
        <ul>
            <li>
                <a href="index.jsp">Início</a>
            </li>
            <li>
                <a id="sadores" >Sabores</a>
            </li>
            <li>
                <a href="#sobre">Sobre</a>
            </li>
            <li>
                <a href="#contato">Contato</a>
            </li>
        </ul>
    </nav>
</header>

<!--Modal-->
<div class="modal">
    <link rel="stylesheet" href="agendamento/css/sabores.css">
    <span class="close">&times;</span>
    <h1>Cardapio</h1>
    <table class="table-sabores">
        <thead>
        <tr>
            <th>Tradicionais</th>
            <th>Especiais</th>
            <th>Doces</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Queijo R$7,00</td>
            <td>Carne de sol R$10,00</td>
            <td>Brigadeiro c/banana R$7,00</td>
        </tr>
        <td>Frango R$7,00</td>
        <td>Charque R$10,00</td>
        <td>Brigadeiro c/castanha R$7,00</td>
        <tr>
            <td>Calabrea R$7,00</td>
            <td>Franbacon R$10,00</td>
            <td>Doce de leite R$7,00</td>
        </tr>
        <tr>
            <td>Palmito R$10,00</td>
            <td>Catupiry R$7,00</td>
            <td>Prestigio R$7,00</td>
        </tr>
        <tr>
            <td>Camarão R$15,00</td>
            <td>Cheddar R$7,00</td>
            <td>Sensação R$9,00</td>
        </tr>
        <tr>
            <td>Camarão c/catupiry R$17,00</td>
            <td>Pizza R$7,00</td>
        </tr>
        </tbody>
    </table>
</div>

<script>
    $('.modal').hide();
</script>

