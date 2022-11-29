<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<c:url var="bt" value="/files/bootstrap4"/>
<link href="${bt}/css/bootstrap.min.css" rel="stylesheet">

<c:url var="fa" value="/files/fontawesome"/>
<link href="${fa}/css/all.css" rel="stylesheet">
<c:set var="cxt" value="${pageContext.request.contextPath}" > </c:set>
<c:set var="user" value="${sessionScope.user }"></c:set>

<title>Insert title here</title>
</head>
<body>
<c:if test="${user==null}">
<c:redirect url="${cxt}/login"/>
</c:if>
<div class="container">

    <div class="row" style="margin-top:10px;">
        <div class="col-12">
            <div class="card bg-primary text-white">
                <div class="card-header">
                    <h1>Boite de Messagerie @ESSAT</h1><br/>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top:10px;">
        <div class="col">
            <div class="alert alert-info">
                <h5>Bienvenue Mr ${user.prenom } ${user.nom}
                <a href="${cxt}/deconnexion">(se déconnecter)</a> </h5>
                <a href="${cxt}/envoyer" class="btn btn-danger">Send message</a>
            </div>
        </div>
    </div>


    <div class="row" style="margin-top:5px;">
        <div class="col-3">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action active">
                    <span class="fa fa-envelope"></span>
                    Messages réçus
                    <span class="badge badge-pill badge-warning">
                    <c:out value="${liste.size()}"></c:out>
                    </span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="fa fa-paper-plane"></span>
                    Messages envoyés
                    <span class="badge badge-pill badge-info">5</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="fa fa-th-large"></span>
                    Messages Archivés
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="fa fa-trash"></span>
                    Messages Spams
                </a>
            </div>
        </div>

        <div class="col-9">
            <div class="col">
                <div class="alert alert-danger">
                   <h4> Vous avez  <c:out value="${liste.size()}"></c:out>
 nouveaux messages</h4>
                </div>
            </div>
            <div class="col">
                <div class="card text-white">
                    <div class="card-header bg-primary"> Liste des Massages Réçus</div>
                    <table class="table table-hover">
                        <thead class="thead-light">
                          <tr><th>De</th> <th>Sujet</th>
                          <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${liste}" var="m">
                            <tr class="bg-info">
                                <td>${m.usersend.prenom} ${m.usersend.nom }</td>
                             
                                <td>${m.sujet}</td>
                                <td>
                                    <button class="btn btn-danger">
                                        <span class="fa fa-trash"></span>
                                    </button>
                                    <button class="btn btn-success">
                                        <span class="fa fa-edit"></span>
                                    </button>
                                </td>
                            </tr>
                          
                       </c:forEach>
                       
                   
                        </tbody>

                    </table>

                </div>

            </div>


        </div>

    </div>

</div>
</body>
</html>