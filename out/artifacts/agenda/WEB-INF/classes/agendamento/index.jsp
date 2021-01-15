<%@page import="controle.ControleAgendamento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="entidades.Agendamento" %>


<!DOCTYPE html>
<html lang="pt-Br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Tarefas Pendentes</title>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="row">
            <div class="col-sm-4">
                <img src="img/logo.jpg" class="img-thumbnail" alt="imgProg">
            </div>
            <div id="div-acesso-agendamentos">
                <h1>Tarefas Pendentes</h1>
                <table class="table table-striped" id="tbTarefasPendentes">
                    <tr>
                        <th>Assunto</th>
                        <th>Descrição</th>
                        <th>Data do Agendamento</th>
                        <th>Status</th>
                        <th>
                            <label><input type="checkbox" id="ckConfirmar"></label>
                            <label><input type="checkbox" id="ckCancelar"></label> <label><input
                                type="checkbox" name="" id=""></label></th>
                    </tr>

                </table>
                <p class="aDireita">


                    <a href="form.jsp" type="button" class="btn btn-primary">Cadastrar
                        Novo</a>
                    <a href="grid.jsp" type="button" class="btn btn-secondary" onclick="buscarTodosAgendamentos()">Mostrar
                        Todos</a>

                </p>

            </div>
        </div>

    </div>

</div>
</body>

<script>

var urlAgendamento = '${pageContext.request.contextPath}/agendamento';

    window.onhashchange = function (e) {
        const oldURL = e.oldURL.split('#')[1]
        const newURL = e.newURL.split('#')[1]
        console.log(oldURL, newURL)
        const oldLink = document.querySelector(`. a[href='#${oldURL}']`)
        const newLink = document.querySelector(`.menu a[href='#${oldURL}']`)
        oldMenu && oldMenu.classList.remove('selected')
        newMenu && newMenu.classList.add('selected')
    }
    
    
    function buscarLista(){
        $.get(urlAgendamento,{
            cmd: '<%=ControleAgendamento.methods.list.toString()%>',
        }).success(function(data) {
            $('#div-acesso-agendamentos .body').html(data);
            atualizarNumeroPendencias();
        }).fail(function() {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao buscar a lista de agendamentos',
            });
        });
    }
    
    function buscarTodosAgendamentos(success){
        $.get(urlAgendamento,{
            cmd: '<%=ControleAgendamento.methods.listAll.toString()%>',
            pagina: 1
        }).success(function(data) {
            success(data);
        }).fail(function() {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar buscar a lista de agendamentos',
            });
        });
    }
</script>

</html>