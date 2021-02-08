<%@ page import="entidades.Usuario" %>
<%@ page import="Filtros.FiltroPaginas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="cabecalho">
    <div class="logo">
        <a href="#inicio">
            <img src="agendamento/img/logo.jpg" alt="Logo"/>
        </a>
    </div>
    <nav class="menu">
        <ul>
            <li>
                <a href="index.jsp">Início</a>
            </li>
            <li>
                <a href="#sabores" id="cardapio">Sabores</a>
            </li>
            <li>
                <a href="#sobre" id="sobre">Sobre</a>
            </li>
            <li>
                <a href="#contato" id="contato">Contato</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/login" methods="get">Sair</a>
            </li>
        </ul>
    </nav>
</header>

<!--Modal cardapio-->
<div class="modal-sabores">
    <img src="agendamento/img/logo.jpg" class="logo-sabores" width="100" height="100" alt="logo">
    <link rel="stylesheet" href="agendamento/css/sabores.css">
    <h1>Cardapio</h1>
    <table class="table-sabores">
        <thead>
        <tr>
            <th>Tradicionais</th>
            <th>Especiais</th>
            <th>Doces</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Queijo R$7,00</td>
            <td>Carne de sol R$10,00</td>
            <td>Brigadeiro c/banana R$7,00</td>
        </tr>
        <td>Frango R$7,00</td>
        <td>Charque R$10,00</td>
        <td>Brigadeiro c/castanha R$7,00</td>
        <tr>
            <td>Calabrea R$7,00</td>
            <td>Franbacon R$10,00</td>
            <td>Doce de leite R$7,00</td>
        </tr>
        <tr>
            <td>Palmito R$10,00</td>
            <td>Catupiry R$7,00</td>
            <td>Prestigio R$7,00</td>
        </tr>
        <tr>
            <td>Camarão R$15,00</td>
            <td>Cheddar R$7,00</td>
            <td>Sensação R$9,00</td>
        </tr>
        <tr>
            <td>Camarão c/catupiry R$17,00</td>
            <td>Pizza R$7,00</td>
        </tr>
        </tbody>
    </table>
</div>

<!--Modal sobre-->
<div class="modal-sobre">
    <link rel="stylesheet" href="agendamento/css/sobre.css">
    <img src="agendamento/img/logo.jpg" class="logo-sobre" width="100" height="100" alt="logo">
    <h1>Sobre</h1>
    <p>
        Por trás de um grande empreendimento, há sempre mentes visionárias, e principalmente, empreendedoras. E com
        a franquia “Pastelería” não foi diferente. Até se consolidar como a maior rede de pastéis do Brasil, a
        empresa teve muita estratégia, planejamento e momentos de readequação para hoje em dia, continuar seu
        processo de expansão. E uma das mentes por trás do sucesso da marca é Rafael Pessoni, 26 anos. Em sua vida
        pessoal, Pessoni, que é natural de Franca, em São Paulo, se mudou ainda adolescente para
        João Pessoa, cidade que reside atualmente. Técnico em informática, ele já foi atleta, gogo boy, técnico das
        categorias de base da seleção brasileira de beisebol, trabalhou com sistemas e quando estava com a vida
        tranquila, quase casando, decidiu ser empreendedor. “Em 2010, a família do Ricardo, meu
        sócio na época, tinha uma pastelaria na rodoviária de Maringá. Ele se mudou para Curitiba e abriu a Pastelería.
        Eu recebi o convite dele, e entrei no negócio para liderar a franqueadora”, relembra. Com a
        experiência de engenheiro, Pessoni contratou uma consultoria, e desde o início, investiu em capacitação.
        “Queríamos que tudo acontecesse dentro de um padrão”, disse. E esta era justamente uma das características
        da Pastelería, que mais tarde veio a ter na culinária, qualidades que diferenciasse dos concorrentes, como a
        massa de chocolate, de pimenta, pastel com bordas, etc.
    </p>
</div>

<!--Modal Contato-->
<div class="modal-contato">
    <link rel="stylesheet" href="agendamento/css/contato.css">
    <img src="agendamento/img/logo.jpg" class="logo-contato" width="100" height="100" alt="logo">
    <h1>Contatos</h1>
    <p>Telefone: (83) 3333-3333</p>
    <p>Whatsapp: (83) 99999-9999</p>
    <p>E-mail: pasteleria@past.com.br</p>
</div>

<script>
    $('.modal-sabores').hide();
    $('.modal-sobre').hide();
    $('.modal-contato').hide();

    $(document).ready(function (){
        $('#cardapio').mouseover(function (){
            $('.modal-sabores').show();
        }).mouseout(function (){
            $('.modal-sabores').hide();
        })
    })

    $(document).ready(function (){
        $('#sobre').mouseover(function (){
            $('.modal-sobre').show();
        }).mouseout(function (){
            $('.modal-sobre').hide();
        })
    })

    $(document).ready(function (){
        $('#contato').mouseover(function (){
            $('.modal-contato').show();
        }).mouseout(function (){
            $('.modal-contato').hide();
        })
    })
</script>

