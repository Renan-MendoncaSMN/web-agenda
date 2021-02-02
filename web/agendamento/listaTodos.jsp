<%@ page import="entidades.Agendamento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="pt-br">
    <jsp:include page="header.jsp" />
    <title>Lista de Tarefas</title>
<style>
    td {
        text-align: center;
    }

    .titulo {
        margin-top: 60px;
        margin-inline: auto;
        font-family: 'Oswald';
        color: goldenrod;
        text-align: center;
    }

    .table {
        margin-top: 50px;
    }
</style>
<body>
        <div>
            <jsp:include page="navbar/index.jsp" />
        </div>
        <div>
            <h1 class="titulo">Agendamentos</h1>
        </div>
            <table class="table" id="agendamento-grid" border="1">
                <thead class="table-light">
                <tr>
                    <th>Assunto:</th>
                    <th>Descrição:</th>
                    <th>Data de Agendamento:</th>
                    <th>Status:</td>
                    <th colspan="3">
                        <select id="filtroStatus" class="form-select form-select-lg" aria-label=".form-select-lg example">
                        <option selected>Filtro</option>
                            <option class="" value="<%=Agendamento.status.Pendente.toString()%>"><%=Agendamento.status.Pendente.toString()%></option>
                            <option class="" value="<%=Agendamento.status.Cancelada.toString()%>"><%=Agendamento.status.Cancelada.toString()%></option>
                            <option class="" value="<%=Agendamento.status.Resolvida.toString()%>"><%=Agendamento.status.Resolvida.toString()%></option>
                            <option class="" value="<%=Agendamento.status.Atrasada.toString()%>"><%=Agendamento.status.Atrasada.toString()%></option>
                            <option class="" value="<%=Agendamento.status.Futura.toString()%>"><%=Agendamento.status.Futura.toString()%></option>
                        </select>
                    </th>
                </tr>
                </thead>
        <tbody id="corpo-tabela">
            <%
                Object parametro = request.getAttribute("agendamentos");
                if(parametro != null)
                {
                    ArrayList<Agendamento> agendamentos = (ArrayList<Agendamento>)parametro ;
                    for(Agendamento agenda : agendamentos) {
            %>
                        <tr>
                            <td><%=agenda.getAssunto()%></td>
                            <td><%=agenda.getDescricao()%></td>
                            <td><%=new java.text.SimpleDateFormat("dd/MM/yyyy").format(agenda.getDataAgendamento())%></td>
                            <% if (agenda.getIdStatus()  == 1 ) { %>
                            <td><%=agenda.getDescricaoStatus()%></td>
                            <% } else if (agenda.getIdStatus()  == 2 ) { %>
                            <td><%=agenda.getDescricaoStatus()%></td>
                            <% } else if (agenda.getIdStatus()  == 3 ) { %>
                            <td><%=agenda.getDescricaoStatus()%></td>
                            <% } else if (agenda.getIdStatus()  == 4 ) { %>
                            <td><%=agenda.getDescricaoStatus()%></td>
                            <% } else if (agenda.getIdStatus()  == 5 ) { %>
                            <td><%=agenda.getDescricaoStatus()%></td>
                            <%}%>
                            <td><button style="background-color: green; color: aliceblue;" onclick="resolverTarefa(<%=agenda.getIdAgendamento()%>, 3)">&#10003;</button></td>
                            <td><button style="background-color: red; color: aliceblue;" onclick="cancelarTarefa(<%=agenda.getIdAgendamento()%>, 2)">&#10005;</button></td>
                            <td><a href="<%=agenda.getUrlRedirecionamento()%>"><img src="agendamento/img/url.png" alt="url"/></a></td>
                        </tr>
            <%
                    }
                }
            %>

        </tbody>
    </table>
<script>

    var urlAgendamento = '${pageContext.request.contextPath}/agendamentoListAll';

    function reloadList() {
        $.get(urlAgendamento, {
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

    $(document).ready(function (){
        $('#filtroStatus').change(function (){
            var filtroId = $('#filtroStatus option:selected').val();
            $.get(urlAgendamento, {
            }).done( function (data){
                $('#corpo-tabela').html($(data).find('#corpo-tabela').html());
            })
        })
    })


   /* function filtroStatus() {
        $.get(urlAgendamento, {
        }).done(function (data){
                filter(status => status.idStatus == filtro);
               console.log(data)
        }).fail(function (){
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar atualizar a lista de agendamentos',
            });
        })
        $(document).on('change', '#filtroStatus', function (){
            var filtro = $(this).val();
            console.log(filtro);
        })
    }
*/


/*
    $(document).ready(function (){
        carregaStatus('filtroStatus');
        function carregaStatus(id, filtro) {

            $.get(urlAgendamento, function (data){
                $('#corpo-tabela').html($(data).find('#corpo-tabela').html());
                console.log(data);
                if(id == 'filtroStatus'){
                    for(var i = 0; i < data.idStatus.length; i++){
                        $('#corpo-tabela').html($(data).find('#corpo-tabela').html());
                    }
                }else{
                    for(var i = 0; i < data.idStatus.length; i++){
                        if(data.idStatus[i] == filtro ){
                            for(var y = 0; y <data.idStatus[i].length; y++){
                                $('#corpo-tabela').html($(data).find('#corpo-tabela').html());
                            }
                        }
                    }
                }
                $('#' + id).html()
            })
        }

    $(document).on('change', '#filtroStatus', function (){
        var filtro = $(this).val();
        console.log(filtro);
    })
    })*/
</script>
</body>
</html>