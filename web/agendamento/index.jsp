<%@ page import="entidades.Agendamento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html>
    <jsp:include page="header.jsp" />
    <title>Lista Pendente</title>
<style>
    .titulo {
    margin-top: 60px;
    margin-inline: auto;
    font-family: 'Oswald';
    color: goldenrod;
    text-align: center;
    }

    td {
        text-align: center;
    }

    .button-pendente {
        text-align: center;
        margin: 30px;
    }

    .button-pendente a {
        margin: 10px;
        width: 235px;
    }

    .table {
        margin-top: 50px;
    }

</style>
<body>
<div>
    <jsp:include page="navbar/index.jsp" />
</div>
<div id="titulo-pendente">
<h1 class="titulo">Tarefas Pendentes</h1>
</div>
<table id="table-pend"  class="table" border="1" id="agendamento-pendentes">
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-sm-4">
                    <thead class="table-light" id="tbTarefasPendentes">
                    <tr>
                        <th>Assunto:</th>
                        <th>Descrição:</th>
                        <th>Data do Agendamento:</th>
                        <th colspan="4">Status:</th>
                    </tr>
                    </thead>
                    <tbody id="corpo-tabela">
                    <%
                        Object parametro = request.getAttribute("agendamentosPendentes");
                        if (parametro != null) {
                            ArrayList<Agendamento> agendamentos = (ArrayList<Agendamento>) parametro;
                            for (Agendamento agenda : agendamentos) {
                    %>
                    <tr>
                        <td><%=agenda.getAssunto()%></td>
                        <td><%=agenda.getDescricao()%></td>
                        <td><%=new java.text.SimpleDateFormat("dd/MM/yyyy").format(agenda.getDataAgendamento())%></td>
                        <td><%=agenda.getDescricaoStatus()%></td>
                        <td><button style="background-color: green; color: aliceblue;" onclick="resolverTarefa(<%=agenda.getIdAgendamento()%>, 3)">&#10003;</button></td>
                        <td><button style="background-color: red; color: aliceblue;" onclick="cancelarTarefa(<%=agenda.getIdAgendamento()%>, 2)">&#10005;</button></td>
                        <td><a href="<%=agenda.getUrlRedirecionamento()%>"><img src="agendamento/img/url.png" alt="url"/></a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </div>
            </div>
        </div>
    </div>
</table>
<div class="button-pendente">
    <a href="agendamento/formulario.jsp"  type="button" class="btn btn-success">Cadastra Novo</a>
    <a href="agendamentoListAll?pagina=1"  methods="get" type="button" class="btn btn-info">Mostrar Todos</a>
</div>
<script>
    var urlAgendamento = '${pageContext.request.contextPath}/agendamentoList';

    function reloadList() {
        $.get(urlAgendamento, {
            pagina: 1
        }).done(function (data){
            $('#corpo-tabela').html($(data).find('#corpo-tabela').html());
        }).fail(function (){
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar atualizar a lista de agendamentos',
            });
        })
    }

    var urlStatus = '${pageContext.request.contextPath}/agendamentoStatus';

    function resolverTarefa(idAgendamento, idStatus){
        let result = confirm("Deseja marcar como resolvida?");
        if(result)
        $.post(urlStatus,{
            idAgendamento: idAgendamento,
            idStatus: idStatus,
        }).done(function (){
            reloadList();
        }).fail(function () {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar atualizar a lista de agendamentos',
            });
        })
    }

    function cancelarTarefa(idAgendamento, idStatus){
        let result = confirm("Deseja mesmo cancelar?");
        if(result)
        $.post(urlStatus,{
            idAgendamento: idAgendamento,
            idStatus: idStatus,
        }).done(function (){
            reloadList();
        }).fail(function () {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar atualizar a lista de agendamentos',
            });
        })
    }
</script>
</body>
</html>