<%@ page import="controle.ControleAgendamento" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

</body>
<script>
    function buscarTodosAgendamentos(done){
        $.get(urlAgendamento, {
            cmd:'<%=ControleAgendamento.methods.listAll.toString()%>',
            pagina: 1
        }).done(function (data){
            done(data);
        }).fail(function (){
            iziToast.error({
                title: 'Error',
                message: 'Erro ao tentar buscar a lista de agendamentos',
            });
        });
    }
</script>
</html>