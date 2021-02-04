<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html lang="pt-br">
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
        <div class="curso">
            <img src="agendamento/img/pastel-de-pizza.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Pizza</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$10,00</span>
                <span class="preco-por">R$7,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/pastel-belem.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Belem</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$10,00</span>
                <span class="preco-por">R$7,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/receitas-de-pastel-de-chocolate-0.jpg"/>
            <div class="curso-info">
                <h4>Pastel Sensação</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$13,00</span>
                <span class="preco-por">R$9,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/pastel-charque.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Charque</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$15,00</span>
                <span class="preco-por">R$10,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/country-frango-bacon.jpg"/>
            <div class="curso-info">
                <h4>Pastel Franbacon</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$15,00</span>
                <span class="preco-por">R$10,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/pastel-de-carne-seca.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Carne de Sol</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$15,00</span>
                <span class="preco-por">R$10,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/receitas-de-pastel-de-palmito-00-1200x738.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Palmito</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$15,00</span>
                <span class="preco-por">R$10,00</span>
            </div>
        </div>
        <div class="curso">
            <img src="agendamento/img/pastel-de-camarao-10-pasteis-768x307-c5f12cc0.jpg"/>
            <div class="curso-info">
                <h4>Pastel de Camarão</h4>
            </div>
            <div class="curso-preco">
                <span class="preco-de">R$18,00</span>
                <span class="preco-por">R$15,00</span>
            </div>
        </div>
    </div>
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
        }).fail(function() {
            iziToast.error({
                title: 'Error',
                message: 'Erro ao atualizar o número das pendencias',
            });
        });
    }
</script>
</body>
</html>