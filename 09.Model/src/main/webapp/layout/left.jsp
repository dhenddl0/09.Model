<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>
<link href="/css/left.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    // JavaScript 함수 이름 변경
   function history(){
			popWin = window.open("/history.jsp",
														"popWin",
														"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}

    $(function(){
    	
    	$( ".Depth03:contains('개인정보조회')" ).on("click" , function() {
			
    		//Debug..
			alert(  $( ".Depth03:contains('개인정보조회')" ).html() );
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
		});
    	
    	/* frames 객체를 사용하면 해당 창에 로드된 모든 프레임에 접근할 수 있으므로, window.parent를 사용할 필요가 없음
		window.parent는 현재 창의 부모 창을 나타내고, frames["rightFrame"]은 현재 창에 로드된 모든 프레임 중 rightFrame이라는 프레임을 나타냄.  */

        $(".Depth03:contains('회원정보조회')").on("click", function(){
        	
        	alert($(".Depth03:contains('회원정보조회')").html());
            window.parent.frames["rightFrame"].location.href = "/user/listUser";
        });

        $(".Depth03:contains('판매상품등록')").on("click", function(){
        	
        	alert($(".Depth03:contains('판매상품등록')").html());
            window.parent.frames["rightFrame"].location.href = "../product/addProductView.jsp";
        });

        $(".Depth03:contains('판매상품관리')").on("click", function(){
        	
        	alert($(".Depth03:contains('판매상품관리')").html());
            window.parent.frames["rightFrame"].location.href = "/product/listProduct?menu=manage";
        });

        $(".Depth03:contains('상 품 검 색')").on("click", function(){
        	
        	alert($(".Depth03:contains('상 품 검 색')").html());
            window.parent.frames["rightFrame"].location.href = "/product/listProduct?menu=search";
        });

        $(".Depth03:contains('구매이력조회')").on("click", function(){
        	
        	alert($(".Depth03:contains('구매이력조회')").html());
            window.parent.frames["rightFrame"].location.href = "/purchase/listPurchase";
        });

        $(".Depth03:contains('최근 본 상품')").on("click", function(){
        	
        	alert($(".Depth03:contains('최근 본 상품')").html());
        	history();
        	
        });
    });
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="159" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td valign="top">
        <table border="0" cellspacing="0" cellpadding="0" width="159">
            <tr>
                <c:if test="${ !empty user }">
                    <td class="Depth03">     
                        개인정보조회
                    </td>
                </c:if>
            </tr>
            
            <c:if test="${user.role == 'admin'}">
                <tr>
                    <td class="Depth03">
                       회원정보조회
                    </td>
                </tr>
            </c:if>
            
            <tr>
                <td class="DepthEnd">&nbsp;</td>
            </tr>
        </table>
    </td>
</tr>

<c:if test="${user.role == 'admin'}">
    <tr>
        <td valign="top">
            <table border="0" cellspacing="0" cellpadding="0" width="159">
                <tr>
                    <td class="Depth03">
                      판매상품등록
                    </td>
                </tr>
                <tr>
                    <td class="Depth03">
                       판매상품관리
                    </td>
                </tr>
                <tr>
                    <td class="DepthEnd">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</c:if>
<tr>
    <td valign="top">
        <table border="0" cellspacing="0" cellpadding="0" width="159">
            <tr>
                <td class="Depth03">
                    상 품 검 색
                </td>
            </tr>
            <c:if test="${!empty user && user.role == 'user'}">
                <tr>
                    <td class="Depth03">
                       구매이력조회
                    </td>
                </tr>
            </c:if>
            <tr>
                <td class="DepthEnd">&nbsp;</td>
            </tr>
            <tr>
                <td class="Depth03">
                    최근 본 상품
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>
</body>
</html>
