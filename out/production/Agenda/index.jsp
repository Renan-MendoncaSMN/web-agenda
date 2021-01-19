<%@page import="controle.ControleAgendamento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>

<html>
<style>
    #span-numero-pendencias {
        position: absolute;
        right: 40px;
        top: 55px;
        background: #F44336;
        color: white;
        border-radius: 50%;
        line-height: 30px;
        font-size: 13px;
        width: 20px;
        text-align: center;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="agendamento/css/iziToast.min.css">
    <script src="agendamento/css/iziToast.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="agendamento/css/estilos.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        <a style="background-color: goldenrod;" href="agendamento/index.jsp" class="botao destaque" onclick="buscarLista()">Agendamentos</a>
        <span id="span-numero-pendencias" ><%=request.getAttribute("quantidadeAgendamentos")%></span>
        </div>
    </aside>
</header>
<script>
    var urlAgendamento = '${pageContext.request.contextPath}/agendamento';

    function quantidadesPendentes(){
        $.get(urlAgendamento, {
            cmd: '<%=ControleAgendamento.methods.icon.toString()%>',
        }).done(function(data) {
            $('#span-numero-pendencias').html($(data).find('#span-numero-pendencias').html());
        }).fail(function(xhr) {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao atualizar o número das pendencias',
            });
        });
    }

    quantidadesPendentes();

    function atualizarNumeroPendencias(){
        $.get(urlAgendamento,{
            cmd: '<%=ControleAgendamento.methods.icon.toString()%>',
        }).success(function(data) {
            $('#span-numero-pendencias').html($(data).find('#span-numero-pendencias').html());
        }).fail(function(xhr) {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao atualizar o número das pendencias',
            });
        });
    }
    function buscarLista(){
        $.get(urlAgendamento,{
            cmd: '<%=ControleAgendamento.methods.list.toString()%>',
        }).done(function(data) {
            $('#div-acesso-agendamentos .body').html(data);
            atualizarNumeroPendencias();
        }).fail(function() {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao buscar a lista de agendamentos',
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