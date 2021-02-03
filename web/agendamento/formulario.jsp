<%@ page import="controle.FormularioServlet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="pt-br">
<title>Cadastro</title>
<jsp:include page="headerForm.jsp" />
<style>
	.titulo-form{
		margin-top: 60px;
		text-align: center;
		color: goldenrod
	}
	.form-hotizontal {
		width: 700px;
		margin-top: 50px;
		margin: 40px auto;
	}

	.button-cadastro {
		text-align: center;
		margin: 30px;
	}

	.button-cadastro a {
		margin: 10px;
		width: 235px;
	}
	.button-cadastro button {
		margin: 10px;
		width: 235px;
	}

	.form-bt {
		margin: 20px auto;
		width: 350px;
	}
	.form-bt .form-label-bt {
		height: 0px;
		width: 400px;
		text-align: right;
	}
</style>
<body>
		<div>
			<jsp:include page="navbar/indexForm.jsp" />
		</div>
		<div class="titulo-form">
			<h1>Agendamento de Tarefas</h1>
		</div>
		<form role="form" class="form-hotizontal">
			<div>
				<label for="inTitulo">Titulo:</label>
				<input type="text" class="form-control" id="inTitulo" placeholder="preencha o titulo da sua tarefa" autofocus/>
			</div>
			<div>
				<label for="inDescricao">Descricão:</label>
				<input type="text" class="form-control" id="inDescricao" placeholder="preencha a descrição da sua tarefa"  autofocus>
			</div>
			<div>
				<label for="inData">Data:</label>
				<input type="date" class="form-control" id="inData" autofocus>
			</div>
			<div class="form-bt">
			<div class="form-label-bt">
				<label for="inNotificacao">Deseja ser notificado via email?</label>
				<input type="checkbox" name="emailDeNotificacao" id="inNotificacao" checked>
			</div>
			<div>
				<label for="inUrl">Deseja salvar a url?</label>
				<input type="checkbox" name="url" id="inUrl" checked>
			</div>
			</div>
		</form>
		<div class="button-cadastro">
			<button type="button" id="button-gravar" class="btn btn-success" onclick="cadastrarAgendamento()">Confirmar &#9673;</button>
			<a href="javascript: history.go(-1)" type="button" class="btn btn-danger" id="btRetirar">Cancelar &#10007;</a>
		</div>
	<script>
		var urlAgendamento = '${pageContext.request.contextPath}/agendamentoForm';

		function cadastrarAgendamento(){

				var assunto = $('#inTitulo').val();
				var descricao = $('#inDescricao').val();
				var data = $('#inData').val();

			function formatdata(data){
				var data = new Date(data),
						dia  = (data.getDate()+1).toString(),
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
					cmd: 'POST',
					assunto: assunto,
					descricao: descricao,
					dataAgendamento: formatdata(data),
					email: $('#inNotificacao').prop('checked') ? true : false,
					urlRedirecionamento: $('#inUrl').prop('checked') ? window.location.href : null
				}).done(function() {
					iziToast.show({
						title : 'Sucesso',
						message : 'Cadastro realizado com sucesso!',
					});
				}).fail(function() {
					iziToast
							.error({
								title : 'Error',
								message : 'Erro ao tentar cadastrar um agendamento',
							});
				});
				assunto.value = "";
				descricao.value = "";
				data.value = "";
				assunto.focus();
		}
	</script>
</body>
</html>