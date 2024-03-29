<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ page import="com.model2.mvc.service.domain.User" %> --%>

<%-- <%
	User user=(User)session.getAttribute("user");
%> --%>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
	
	$("td[width = '115']:contains('login')").on("click", function(){
		
		//Debug 확인
		alert($("td[width = '115']:contains('login')").html());
		
		$(window.parent.frames["rightFrame"].location).attr("href", "/user/login");
		// -> jQuery 사용시
		
		//window.location.href = "/user/login";
		//jQuery 안쓰면 이렇게도 가능
		
		//frames["rightFrame"].location.href = "/user/login";
	});
	
	$("td[width = '56']:contains('logout')").on("click", function(){
		
		//Debug 확인
		alert($("td[width = '56']:contains('logout')").html());
		
		$(window.parent.document.location).attr("href", "/user/logout");
		
		});
	
	});
	
	
	</script>


</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td height="10"></td>
	<td height="10" >&nbsp;</td>
  </tr>
  <tr>
    <td width="800" height="30"><h2>Model2 MVC Shop</h2></td>
  </tr>
  <tr>
    <td height="20" align="right" background="/images/img_bg.gif">
	    <table width="200" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td width="115">
		          <%-- <%	if(user == null) { %> --%>
		          	<c:if test="${empty user }">
		            <%--   <a href="/user/login" target="rightFrame">login</a>   
		          <%}%>    --%>
		          login  
		         </c:if>   
	          </td>
	          <td width="14">&nbsp;</td>
	          <td width="56">
		          <%-- <% if(user != null) {  %>
		            	<a href="/user/logout" target="_parent">logout</a>  
		           <% } %> --%>
		           <c:if test="${ ! empty user }">
		           logout
		          </c:if>
	          </td>
	        </tr>
	      </table>
      </td>
    <td height="20" background="/images/img_bg.gif">&nbsp;</td>
  </tr>
</table>

</body>
</html>