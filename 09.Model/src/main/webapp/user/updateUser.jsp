<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ȸ�� ���� ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

function fncUpdateUser() {
	// Form ��ȿ�� ����
	var name=document.detailForm.userName.value;
	
	if(name == null || name.length <1){
		alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
// 	if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
// 		document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
// 	} else {
// 		document.detailForm.phone.value = "";
// 	}

	// 	var name=document.detailForm.userName.value;
		var name = $("input[name='userName']").val();
	// document.detailForm.phone2.value
		var phone2 = $("input[name='phone2']").val();
	// document.detailForm.phone3.value
		var phone3 = $("input[name='phone3']").val();

	var value = "";
	if($("input:text[name='phone2']").val() != "" && $("input:text[name='phone3']").val() != ""){
		var value = $("option:selected").val() + "-" + "phone2" + "-" + "phone3";
		
	}
	
	alert("phone update : " +value);
	$("input:hidden[name='phone']").val(value);
		
// 	document.detailForm.action='/user/updateUser';
// 	document.detailForm.submit();

	$("form").attr("method", "POST").attr("action", "/user/updateUser").submit(); 
}

	$(function(){
		$("td.ct_btn01:contains('����')").on("click", function(){
			
			fncUpdateUser();
		});	
	});

// function check_email(frm) {
// 	alert
// 	var email=document.detailForm.email.value;
//     if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
//     	alert("�̸��� ������ �ƴմϴ�.");
// 		return false;
//     }
//     return true;
// }

		$(function(){
			
			$("input[name='email']").on("change", function(){
				
				var email = $("input[name='email']").val();
				
				if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
			     	alert("�̸��� ������ �ƴմϴ�.");
			}
		});
	});
	
		/* function resetData() {
			document.detailForm.reset();
		} */
		
		$(function(){
			$("td.ct_btn01:contains('���')").on("click", function(){
				
				alert(  $( "td.ct_btn01:contains('���')" ).html() );
				
				history.go(-1);
			});
		});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- <form name="detailForm"  method="post" > -->
<form name="detailForm">

<%--<input type="hidden" name="userId" value="<%=user.getUserId() %>"> --%>
<input type="hidden" name="userId" value="${user.userId }">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ����������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37" />
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%--<td class="ct_write01"><%=user.getUserId() %>	</td> --%>
		<td class="ct_write01">${user.userId}	</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%-- <input type="text" name="userName" value="<%=user.getUserName() %>" class="ct_input_g" style="width:100px; height:19px"  maxLength="50" >--%>
			<input 	type="text" name="userName" value="${user.userName}" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%--<input type="text" name="addr" value="<%=user.getAddr() %>" class="ct_input_g" style="width:370px; height:19px"  maxLength="100">--%>
			<input 	type="text" name="addr" value="${user.addr}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�޴���ȭ��ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select name="phone1" class="ct_input_g" style="width:50px; height:25px" 
							onChange="document.detailForm.phone2.focus();">
				<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
				<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
				<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
				<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
				<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
				
			</select>
			<input 	type="text" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}" 
							class="ct_input_g" style="width:100px; height:19px"  maxLength="9" >
			- 
			<input 	type="text" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}"  
							class="ct_input_g"  style="width:100px; height:19px"  maxLength="9" >
							
			<input type="hidden" name="phone" class="ct_input_g"  />
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�̸��� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<%-- 	<input 	type="text" name="email" value="${user.email}" class="ct_input_g" 
							style="width:100px; height:19px" onChange="check_email(this.form);"> --%>
		<input 	type="text" name="email" value="${user.email}" class="ct_input_g" 
							style="width:100px; height:19px"> 
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%">	</td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23" />
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncUpdateUser();">����</a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23" />
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23" />
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:resetData();">���</a> -->
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>

</body>
</html>
