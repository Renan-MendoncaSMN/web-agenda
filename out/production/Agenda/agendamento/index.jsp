<%@page import="controle.ControleAgendamento"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Agendamento" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="pt-Br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/iziToast.min.css">
    <script src="css/iziToast.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Tarefas Pendentes</title>
</head>

<table>
<div class="container-fluid">
    <div class="row">
        <div class="row">
            <div class="col-sm-4">
                <img src="img/logo.jpg" class="img-thumbnail" alt="imgProg">
            </div>
            <div>
                <h1>Tarefas Pendentes</h1>
                    <tr>
                        <th>Assunto</th>
                        <th>Descrição</th>
                        <th>Data do Agendamento</th>
                        <th>Status</th>
                        <th>
                            <label><input type="checkbox" id="ckConfirmar"></label>
                            <label><input type="checkbox" id="ckCancelar"></label> <label><input type="checkbox" name="" id=""></label>
                        </th>
                    </tr>
                <%ArrayList<Agendamento> agendamentos = ((ArrayList<Agendamento>)request.getAttribute("agendamentos"));
                for(int i = 0; i < agendamentos.size(); i += 1) {
                %>
                <tr>
                        <td><%=agendamentos.get(i).getAssunto()%></td>
                        <td><%=agendamentos.get(i).getDescricao()%></td>
                        <td><%=agendamentos.get(i).getDataAgendamento()%></td>
                        <td><%=agendamentos.get(i).getDescricaoStatus()%></td>
                </tr>
                <%}%>


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
</table>

<script>

var urlAgendamento = '${pageContext.request.contextPath}/agendamento';


</script>

</html>