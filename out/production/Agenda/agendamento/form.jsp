<%@page import="controle.ControleAgendamento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/iziToast.min.css">
<script src="css/iziToast.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>agendamento</title>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<img src="img/logo.jpg" alt="Agenda" class="imgProg">
			</div>

			<div class="col-sm-8" id="divQuadro">
				<h1>Agendamento de Tarefas</h1>
				<form role="form" class="form-hotizontal">
					<p>
						<label for="inTitulo">Titulo:</label> <input type="text"
							class="form-control" id="inTitulo" autofocus>
					</p>
					<p>
						<label for="inDescricao">Descricão:</label> <input type="text"
							class="form-control" id="inDescricao" autofocus>
					</p>
					<p>
						<label for="inData">Data:</label> <input type="date"
							class="form-control" id="inData" autofocus>
					</p>
					<p>
						<label for="inNotificacao">Deseja ser notificado via
							email?</label> <input type="checkbox" name="emailDeNotificacao"
							id="inNotificacao" checked>
					</p>
					<p>
						<label for="inUrl">Deseja salvar a url?</label> <input
							type="checkbox" name="url" id="inUrl" checked>
					</p>
					<p>
						<button type="button" class="btn btn-success"
							onclick="cadastrarAgendamento()">Gravar &#9673;</button>
						<a href="javascript: history.go(-1)" type="button"
							class="btn btn-danger" id="btRetirar">Cancelar &#10007;</a>
					</p>
				</form>
			</div>
		</div>
	</div>
	<script>	
var urlAgendamento = '${pageContext.request.contextPath}/agendamento';




function cadastrarAgendamento(){
	
		
    	var assunto = $('#inTitulo').val();
        var descricao = $('#inDescricao').val();
        var data = $('#inData').val();

	function formatdata(data){
		var data = new Date(),
				dia  = data.getDate().toString(),
				diaF = (dia.length == 1) ? '0'+dia : dia,
				mes  = (data.getMonth()+1).toString(), //+1 pois no getMonth Janeiro começa com zero.
				mesF = (mes.length == 1) ? '0'+mes : mes,
				anoF = data.getFullYear();
		return anoF+'/'+mesF+'/'+diaF;
	}


  if(!assunto || !descricao || !data)
            return iziToast.error({
                title: 'Error',
                message: 'Todos os campos são obrigatórios',
            });

        $.post(urlAgendamento, {
            cmd: '<%=ControleAgendamento.methods.post.toString()%>',
								assunto : assunto,
								descricao : descricao,
								dataAgendamento : formatdata(data),
								email : $('#inNotificacao').prop('checked') ? 1
										: null,
								urlRedirecionamento : $('#inUrl').prop(
										'checked') ? window.location.href
										: null
							})
					.done(function(data) {
						iziToast.show({
							title : 'Sucesso',
							message : 'Cadastro realizado com sucesso!',
						});
					})
					.fail(
							function() {
								iziToast
										.error({
											title : 'Error',
											message : 'Erro ao tentar cadastrar um agendamento',
										});
							});

		}
	</script>
</body>

</html>