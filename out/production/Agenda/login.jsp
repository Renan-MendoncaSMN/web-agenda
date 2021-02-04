<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt-br">
<title>Login</title>
<jsp:include page="agendamento/header.jsp" />
<body class="login-body">
<div class="login" id="container">
    <img src="agendamento/img/logo.jpg" class="usuario" width="100" height="100" alt="Logo">
    <h1>Login</h1>
    <form action="<%=request.getContextPath()%>/login" method="post">
        <p>Usuario</p>
        <input type="text" name="email">
        <p>Senha</p>
        <input type="password" name="senha">
        <input type="submit" name="" value="Login">
        <a href="#">Primeiro acesso?</a>
    </form>
</div>
</body>
</html>
