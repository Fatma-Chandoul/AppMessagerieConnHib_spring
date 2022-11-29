<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<c:url var="bt" value="/files/bootstrap4" />
<link href="${bt}/css/bootstrap.min.css" rel="stylesheet">

<c:url var="fa" value="/files/fontawesome" />
<link href="${fa}/css/all.css" rel="stylesheet">
<c:set var="cxt" value="${pageContext.request.contextPath}">
</c:set>
<c:set var="user" value="${sessionScope.user }"></c:set>

<title>Insert title here</title>
</head>
<body>
	<c:if test="${user==null}">
		<c:redirect url="${cxt}/login" />
	</c:if>
	<div class="container">

		<div class="row" style="margin-top: 10px;">
			<div class="col-12">
				<div class="card bg-primary text-white">
					<div class="card-header">
						<h1>Boite de Messagerie @ESSAT</h1>
						<br />
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 10px;">
			<div class="col">
				<div class="alert alert-info">
					<h5>
						Bienvenue Mr ${user.prenom } ${user.nom} <a
							href="${cxt}/deconnexion">(se déconnecter)</a>
					</h5>
				</div>
			</div>
		</div>


		<div class="row" style="margin-top: 5px;">
			<div class="col-3">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active">
						<span class="fa fa-envelope"></span> Messages réçus <span
						class="badge badge-pill badge-warning"> <c:out
								value="${liste.size()}"></c:out>
					</span>
					</a> <a href="#" class="list-group-item list-group-item-action"> <span
						class="fa fa-paper-plane"></span> Messages envoyés <span
						class="badge badge-pill badge-info">5</span>
					</a> <a href="#" class="list-group-item list-group-item-action"> <span
						class="fa fa-th-large"></span> Messages Archivés
					</a> <a href="#" class="list-group-item list-group-item-action"> <span
						class="fa fa-trash"></span> Messages Spams
					</a>
				</div>
			</div>

			<div class="col-9">

				<form:form action="${cxt}/save" method="post" modelAttribute="m1">
					<p>
						Sujet:
						<form:input path="sujet" class="form-control" />
					</p>
					<p>
						Contenu:
						<form:textarea path="contenu" class="form-control" cols="8" />
					</p>
					<p>
						Utilisateur:
						<form:select path="userreceive.id" items="${users}"
							itemLabel="prenom" itemValue="id" class="form-control" />
					</p>

					<p>
						<input type="submit" value="Envoyer" />
					</p>



				</form:form>


			</div>

		</div>

	</div>
</body>
</html>