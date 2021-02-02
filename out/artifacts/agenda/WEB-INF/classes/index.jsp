<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html>
    <title>Home</title>
    <jsp:include page="agendamento/header.jsp" />
<style>
    #span-numero-pendencias {
        position: absolute;
        right: 58px;
        top: 50px;
        background: #F44336;
        color: white;
        border-radius: 50%;
        line-height: 18px;
        font-size: 11px;
        width: 16px;
        text-align: center;
    }

    #icon {
        text-align: center;
        right: 65px;
        top: 30px;
        position: absolute;
    }

    .icone-tarefa a:hover {
        cursor: pointer;
        transform: translateY(-5px);
        box-shadow: 4px 30px 16px 0px rgba(50, 50, 50, 0.45);
    }

    .curso:hover {
        cursor: pointer;
        transform: translateY(-5px);
        box-shadow: 4px 30px 16px 0px rgba(50, 50, 50, 0.45);
    }

</style>
<body>
<div>
    <jsp:include page="agendamento/navbar/index.jsp" />
</div>
<aside>
    <div class="icone-tarefa" >
        <a type="button" href="agendamentoList" methods="get" id="icon">
            <img src="agendamento/img/agenda_icon_129512.png" alt="Logo"/>
        </a>
        <span id="span-numero-pendencias" ><%=request.getAttribute("quantidadeAgendamentos")%></span>
    </div>
</aside>
<div>
    <h1 class="alinhamentoH1" style="margin-top: 60px">Card Promocional</h1>
    <div class="grid-card" style="margin-top: 50px">
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
</div>
<div>
    <jsp:include page="agendamento/footer/index.jsp" />
</div>
<script>
    var urlAgendamento = '${pageContext.request.contextPath}/agendamentoIcon';

    function quantidadesPendentes(){
        $.get(urlAgendamento, {
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
        }).done(function(data) {
            $('#span-numero-pendencias').html($(data).find('#span-numero-pendencias').html());
        }).fail(function(xhr) {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao atualizar o número das pendencias',
            });
        });
    }
</script>
</body>
</html>