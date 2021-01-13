<%@page import="entidades.ControleAgendamento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>

<html>
<style>
#span-numero-pendencias {
        position: absolute;
        bottom: -2px;
        right: -4px;
        background: #F44336;
        color: white;
        border-radius: 50%;
        line-height: 20px;
        font-size: 12px;
        width: 20px;
        text-align: center;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="agendamento/css/estilos.css">
</head>
<body>
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
                <a href="#inicio">Início</a>
            </li>
            <li>
                <a href="#sabores">Sabores</a>
            </li>
            <li>
                <a href="#sobre">Sobre</a>
            </li>
            <li>
                <a href="#contato">Contato</a>
            </li>
        </ul>
    </nav>
    <aside class="autenticacao">
       <div>
        <a href="agendamento/index.jsp" class="botao destaque">Agendamentos
        </a>
        <span id="span-numero-pendencias"><%=request.getAttribute("quantidadeAgendamentos") %>></span>
        </div>
    </aside>
</header>
<script>
    window.onhashchange = function (e) {
        const oldURL = e.oldURL.split('#')[1]
        const newURL = e.newURL.split('#')[1]
        console.log(oldURL, newURL)
        const oldLink = document.querySelector(`.menu a[href='#${oldURL}']`)
        const newLink = document.querySelector(`.menu a[href='#${oldURL}']`)
        oldMenu && oldMenu.classList.remove('selected')
        newMenu && newMenu.classList.add('selected')
    }
    
    function atualizarNumeroPendencias(){
        $.get(urlAgendamento,{
            cmd: "<%=ControleAgendamento.metodos.icon.toString()%>",
        }).success(function(data) {
            $('#span-numero-pendencias').html(jQuery(data).find('#span-numero-pendencias').html());
        }).fail(function(xhr) {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao atualizar o número das pendencias',
            });
        });
    }
</script>
</body>
<body>
<h1 class="alinhamentoH1">Card Promocional</h1>

<div>
    <div class="curso">
        <img src="agendamento/img/pastel-de-frango-com.jpg"/>
        <div class="curso-info">
            <h4>Pastel de Frango</h4>
        </div>
        <div class="curso-preco">
            <span class="preco-de">R$10,00</span>
            <span class="preco-por">R$7,00</span>
        </div>
    </div>
    <div class="curso">
        <img src="agendamento/img/pastel-de-carne.jpg"/>
        <div class="curso-info">
            <h4>Pastel de Carne</h4>
        </div>
        <div class="pastel-preco">
            <span class="preco-de">R$10,00</span>
            <span class="preco-por">R$7,00</span>
        </div>
    </div>
    <div class="curso">
        <img src="agendamento/img/pastel-de-queijo.jpg"/>
        <div class="curso-info">
            <h4>Pastel de Queijo</h4>
        </div>
        <div class="curso-preco">
            <span class="preco-de">R$10,00</span>
            <span class="preco-por">R$7,00</span>
        </div>
    </div>
    <div class="curso">
        <img src="agendamento/img/pastel-misto.jpg"/>
        <div class="curso-info">
            <h4>Pastel de Misto</h4>
        </div>
        <div class="curso-preco">
            <span class="preco-de">R$10,00</span>
            <span class="preco-por">R$7,00</span>
        </div>
    </div>
</div>
</body>


</html>