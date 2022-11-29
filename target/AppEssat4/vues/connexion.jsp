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
<c:set var="cxt" value="${pageContext.request.contextPath}" > </c:set>
<title>Insert title here</title>
<c:set var="session" value="${sessionScope.type }"/> <!-- //recuperer les variables qui existe en session -->
<c:set var="session" value="${sessionScope.message }"/>

</head>
<body>
 <div class="container-fluid ">
   <br><br><br>
    <div class="row mt-2">
      <div class="offset-4 col-4 bg-light border border-primary">
        <h1 style="text-align:center">Messagerie@ESSAT</h1>
		<h3 style="text-align:center">Connexion</h3>
        <form action="${cxt}/verif" method="get">
              
          	   <div class="form-group">
                <input type="text" class="form-control"  id="username" name="login" value="" placeholder="Username" required="required" />
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
          	  </div>
            	<div class="form-group">
                	<input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required" />
                	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
            	</div>

              
             <div class="form-row">
               <div class="col">
                 <input type="submit" class="btn btn-primary btn-block mb-1" id="_submit" name="_submit" value="Log in" />
               </div>
              
            </div>
        </form>
        <c:if test="${type !=null }">
        <div class="alert alert-${type} ">
        <p>${message}</p>
        
        </div>
        </c:if>
      </div>
      
    </div>
  </div>
</body>
</html>