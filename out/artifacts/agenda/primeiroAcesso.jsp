<%--
  Created by IntelliJ IDEA.
  User: unip03
  Date: 05/02/2021
  Time: 08:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt-br">
<jsp:include page="agendamento/header.jsp" />
    <title>Primeiro Acesso</title>
<body class="body-primeiroAcesso">
        <div class="formulario" id="container">
            <img src="agendamento/img/logo.jpg" class="usuario" width="100" height="100" alt="Logo">
            <h1>Formulario</h1>
            <form action="<%=request.getContextPath()%>/primeiroAcesso" method="post">
                <p>Nome</p>
                <input type="text" name="nome" id="inUsuario">
                <p>Email</p>
                <input type="text" name="email" id="inEmail">
                <p>Senha</p>
                <input type="password" name="senha" id="inSenha">
                <input type="submit" name="" value="Confirmar">
            </form>
        </div>
</body>
</html>
