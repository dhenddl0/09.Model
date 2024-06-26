<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<title>상품 목록조회</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		//Debug..
		alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		fncGetProductList(1);
	});
	
	//이렇게 하면 검색 시 엔터 키 먹음
	 $( "input[name='searchKeyword']" ).keypress(function(event) {
		    // 엔터 키 코드는 13입니다.
		    if (event.which === 13) {
		        // 엔터 키가 눌렸을 때 검색 이벤트 실행
		    	fncGetProductList(1);
		    }
		});
	});

// 	$(function(){
//    $(".ct_list_pop td:nth-child(3)").on("click", function(){
	   
// 	   /*  var menu = "${not empty param.menu ? param.menu : ''}"; */
// 	    var url;
	    
// 	    if (menu === 'manage') {
// 	        url = "/product/updateProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName} + $(this).text().trim();
// 	    } else if (menu === 'search') {
// 	        url = "/product/getProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName} + $(this).text().trim();
// 	    } else {
// 	        url = "/product/getProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName} + $(this).text().trim();
// 	    }

// 	    self.location = url;
// 	});

 $(function() {
       $(".ct_list_pop td:nth-child(3)").on("click", function() {
           var prodNo = $(".ct_list_pop td:nth-child(3)").find('input[name^="prodNo"]').val();
           // hidden input을 추가하여 form에 'prodNo' 값을 함께 전송합니다.
           $(".ct_list_pop td:nth-child(3)").append('<input type="hidden" name^="prodNo" value="' + prodNo + '">');
           // form을 제출합니다.
           $(this).closest("form").submit();
          
           self.location="/product/getProduct?menu=${param.menu}&prodNo="+prodNo;
       });


		
		$(".ct_list_pop td:nth-child(3)").css("color", "red"); // 글씨 색상 변경
		$("h7").css("color", "red");
		
		$(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
		console.log ( $(".ct_list_pop:nth-child(4)" ).html() );
		});

<!-- 자바 스크립트 부분
function fncGetProductList(currentPage){
   document.getElementById("currentPage").value = currentPage;
   document.detailForm.submit();
}
-->

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">


<table width="100%" height="37" border="0" cellpadding="0"   cellspacing="0">
   <tr>
      <td width="15" height="37">
         <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
      </td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">
          
      <%--     <%    
          if(request.getParameter("menu") != null && request.getParameter("menu").equals("manage")){   
       %>
       상품 관리
       <% }else if(request.getParameter("menu") == null || request.getParameter("menu").equals("null") || request.getParameter("menu").equals("search")) {
       %>
       상품 목록조회
       <% } %> --%>
       
       <c:if test = "${not empty param.menu and param.menu eq 'manage' }" >
          상품 관리
       </c:if>
       <c:if test = "${empty param.menu or param.menu eq 'null' or param.menu eq 'search' }">
          상품 목록조회
       </c:if>
       
               </td>
            </tr>
         </table>
      </td>
      <td width="12" height="37">
         <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      
      <td align="right">
      
         <%-- <%
      if(search.getSearchCondition() != null) {
      %> --%>
         <select name="searchCondition" class="ct_input_g" style="width:80px">
            <option value ="0" ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""  }>상품번호</option>
            <option value ="1" ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>상품명</option>
            <option value ="2" ${ ! empty search.searchCondition && search.searchCondition == 2 ? "selected" : "" } >상품가격</option>    
         <%--    <%}else{%>
                  <select name="searchCondition" class="ct_input_g" style="width:80px">
                  <option value = "0" >상품번호</option>
                  <option value = "1" >상품명</option>
                  <option value = "2" >상품가격</option>
                  
                  <% } %> --%>
             
         </select>
         
         <input type="text" name="searchKeyword" 
         value="${! empty search.searchKeyword ? search.searchKeyword : "" }" 
         class="ct_input_g" style="width:200px; height:19px" />
      </td>
      
      <td align="right" width="70">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23">
               </td>
               <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
                  <a href="javascript:fncGetProductList(1);">검색</a>
               </td>
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23">
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td colspan="11" >전체 ${resultPage.totalCount } 건수, 현재 ${ resultPage.currentPage } 페이지</td>
  
   </tr>
   <tr>
      <td class="ct_list_b" width="100">No</td>
      <td class="ct_line02"></td>
    <!--   <td class="ct_list_b" width="150">상품명</td> -->
    <td class="ct_list_b" width="150">
    상품명</br>
    	<h7> (product click:상세정보)</h7>
    </td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">가격</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">등록일</td>   
      <td class="ct_line02"></td>
      <td class="ct_list_b">현재상태</td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="808285" height="1"></td>
   </tr>
      
    <c:set var = "i" value = "0" />  
    <c:forEach var = "product" items = "${ list }" >
       <c:set var = "i" value = "${i +1 }" />
   <tr class="ct_list_pop">
      <td align="center">${ i }</td>
      <td></td>
           <td align="left">
            
            <input type="hidden" name="prodNo${i}" value="${product.prodNo }"/>${product.prodName}
            
<%--             <c:if test = "${not empty param.menu and param.menu eq 'manage' }"> --%>
<%--            		 <a href="/product/updateProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName}</a> --%>
<%--             </c:if> --%>
         
<%--        <c:if test = "${not empty param.menu and param.menu eq 'search' }"> --%>
<%--            		 <a href="/product/getProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName}</a> --%>
<%--             </c:if> --%>
            </td>
            <td></td>  

      <td align="left">${product.price}</td>
      <td></td>
    <%--   <td align="left"><%=vo.getRegDate() %></td> --%>
      <td align="left">${product.regDate} </td> 
      <td></td>
      <td align="left">
         배송중

      </td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="D6D7D6" height="1"></td>
   </tr>   
   <%--  <%} %> --%>
   </c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td align="center">

            </div> 
        </td>
   </tr>
         
         <jsp:include page="../common/pageNavigator.jsp"></jsp:include>
         
       </td>
   </tr>
</table>

<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>