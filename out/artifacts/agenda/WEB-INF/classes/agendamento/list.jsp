<%@page import="java.util.Comparator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entidades.Agendamento" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>


<ul class="card-list">
    <%

        ArrayList<Agendamento> agendamentos = ((ArrayList<Agendamento>) request.getAttribute("agendamentos"));
        if (agendamentos != null && !agendamentos.isEmpty()) {
            agendamentos.sort(Comparator.comparing(Agendamento::getDataAgendamento));
            for (Agendamento agendamento : agendamentos) {
    %>
    <li>
        <div class="assunto card-header">
                        <span>
                            <%=agendamento.getAssunto()%> -
                            <%=new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(agendamento.getDataAgendamento())%>
                        </span>
            <%if (agendamento.getUrlRedirecionamento() != null && agendamento.getUrlRedirecionamento() != "") { %>
            <span onclick="redirecionarParaURl('<%=agendamento.getUrlRedirecionamento()%>')"
                  class="material-icons action-icon">launch</span>
            <%}%>
        </div>
        <div class="card-content"><%=agendamento.getDescricao()%>
        </div>
        <div class="card-footer">
            <% if (agendamento.getIdStatus() == 1) { %>
            <span class="tag tag-warning"
                  title="<%=agendamento.getDescricaoStatus()%>"><%=agendamento.getDescricaoStatus()%></span>
            <% } else if (agendamento.getIdStatus() == 2) { %>
            <span class="tag tag-success"
                  title="<%=agendamento.getDescricaoStatus()%>"><%=agendamento.getDescricaoStatus()%></span>
            <% } else if (agendamento.getIdStatus() == 3) { %>
            <span class="tag tag-none"
                  title="<%=agendamento.getDescricaoStatus()%>"><%=agendamento.getDescricaoStatus()%></span>
            <% } else if (agendamento.getIdStatus() == 4) { %>
            <span class="tag tag-error"
                  title="<%=agendamento.getDescricaoStatus()%>"><%=agendamento.getDescricaoStatus()%></span>
            <% } else if (agendamento.getIdStatus() == 5) { %>
            <span class="tag tag-info"
                  title="<%=agendamento.getDescricaoStatus()%>"><%=agendamento.getDescricaoStatus()%></span>
            <%}%>
            <div class="actions">
                <span title="Marcar como resolvido" class="material-icons icon-check"
                      onclick="atualizarStatus(<%=agendamento.getIdAgendamento()%>, 2, 'Você realmente deseja marcar esta tarefa como resolvida?')">check</span>
            </div>
        </div>

    </li>
    <%
        }
    } else {
    %>
    <li>Nenhum agendamento para hoje :D</li>
    <%
        }
    %>
</ul>


