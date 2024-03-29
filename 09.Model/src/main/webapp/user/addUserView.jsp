<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<html>
<head>
<title>회원가입</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

function fncAddUser() {
	// Form 유효성 검증
// 	var id=document.detailForm.userId.value;
	var id = $("input[name='userId']").val();
	
// 	var pw=document.detailForm.password.value;
	var pw = $("input[name='password']").val();
	
// 	var pw_confirm=document.detailForm.password2.value;
	var pw_confirm = $("input[name='password2']").val();
	
// 	var name=document.detailForm.userName.value;
	var name = $("input[name='userName']").val();
	
// document.detailForm.phone2.value
	var phone2 = $("input[name='phone2']").val();
	
// document.detailForm.phone3.value
	var phone3 = $("input[name='phone3']").val();
	
	if(id == null || id.length <1){
		alert("아이디는 반드시 입력하셔야 합니다.");
		return;
	}
	if(pw == null || pw.length <1){
		alert("패스워드는  반드시 입력하셔야 합니다.");
		return;
	}
	if(pw_confirm == null || pw_confirm.length <1){
		alert("패스워드 확인은  반드시 입력하셔야 합니다.");
		return;
	}
	if(name == null || name.length <1){
		alert("이름은  반드시 입력하셔야 합니다.");
		return;
	}
	
// 	if(document.detailForm.password.value != document.detailForm.password2.value) {
	if(pw != pw_confirm){
		alert("비밀번호 확인이 일치하지 않습니다.");
		document.detailForm.password2.focus();
		//pw_confirm.focus();
		return;
	}
		
	/* if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
		document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
	} else {
		document.detailForm.phone.value = "";
	} */
	
	var value = "";
	if($("input:text[name='phone2']").val() != "" && $("input:text[name='phone3']").val() != ""){
		var value = $("option:selected").val() + "-" + "phone2" + "-" + "phone3";
		
	}
	
	//Debug 확인
	alert("phone : " +value)
	$("input:hidden[name='phone']").val(value);
	
	/* document.detailForm.action='/user/addUser';
	document.detailForm.submit(); */
	
	$("form[name='detailForm']").attr("action", "/user/addUser").submit();
	//$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
	//-> 강사님꺼
}
	$(function(){
		//$( "td.ct_btn01:contains('가입')" ).on("click" , function() {
		//-> 강사님꺼(tagName + className)
			$("td.ct_btn01:contains('가입')").on("click", function(){
		// -> class Name만
		
				//Debug 확인
				alert($("td.ct_btn01:contains('가입')").html());
				
				fncAddUser();
			});
		});
		
	$(function(){
		$(".ct_btn01:contains('취소')").on("click", function(){
			
			alert($(".ct_btn01:contains('취소')").html());
			$("form")[0].reset();
			////////////////////////$("form")[0].reset(); 이렇게 안써도 되는지 확인//////////////////////////////
		});
	});

/* function check_email(frm) {
	var email=document.detailForm.email.value;
    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
    	alert("이메일 형식이 아닙니다.");
		return false;
    }
    return true;
} */

/* 	$(function(){
		
		$("input[name='email']").on("change", function(){
			
			var email = $("input[name='email']").val();
			
			
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			   alert("이메일 형식이 아닙니다.");
		}
	
	});
	
	});
	
	//=> 현재 입력된 값을 가져와서 저장.
			//.val()은 jQuery 메서드 중 하나로, 대상 요소의 값을 가져오거나 설정할 때 사용함.	 */
 $(function() {
	 
	 $("input[name='email']").on("change" , function() {
		
		 var email=$("input[name='email']").val();
	    
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
	    	alert("이메일 형식이 아닙니다.");
	     }
	});
	 
});	 

	function checkSsn() {
		var ssn1, ssn2; 
		var nByear, nTyear; 
		var today; 

		ssn = document.detailForm.ssn.value;
		// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
		if(!PortalJuminCheck(ssn)) {
			alert("잘못된 주민번호입니다.");
			return false;
		}
	}

	function PortalJuminCheck(fieldValue){
	    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
		var num = fieldValue;
	    if (!pattern.test(num)) return false; 
	    num = RegExp.$1 + RegExp.$2;
	
		var sum = 0;
		var last = num.charCodeAt(12) - 0x30;
		var bases = "234567892345";
		for (var i=0; i<12; i++) {
			if (isNaN(num.substring(i,i+1))) return false;
			sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
		}
		var mod = sum % 11;
		return ((11 - mod) % 10 == last) ? true : false;
	}
	
/* 	function fncCheckDuplication() {
		popWin 
			= window.open("/user/checkDuplication.jsp","popWin", "left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
	}
	
	function resetData() {
		document.detailForm.reset();
	} */
	
	$(function(){
		$(".ct_btn:contains('ID중복확인')").on("click" , function() {
			alert($("td.ct_btn:contains('ID중복확인')").html());
			
			popWin
			= window.open("/user/checkDuplication.jsp",
					"popWin", 
					"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
					"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
	});
	
	/* JavaScript를 사용하여 새 창을 열고, 그 창에 특정 URL의 페이지를 표시하는 기능을 구현한 것 */
	/* left=300: 새 창이 열리는 위치의 왼쪽 좌표.
	top=200: 새 창이 열리는 위치의 위쪽 좌표.
	width=300: 새 창의 너비.
	height=200: 새 창의 높이.
	marginwidth=0: 새 창의 가로 여백 너비.
	marginheight=0: 새 창의 세로 여백 너비.
	scrollbars=no: 스크롤바를 표시하지 않도록 설정.
	scrolling=no: 스크롤링을 비활성화.
	menubar=no: 메뉴바를 표시하지 않도록 설정.
	resizable=no: 새 창의 크기를 조정할 수 없도록 설정. */
	
	</script>
	</head>
	
	<body bgcolor="#ffffff" text="#000000">
	
	<!-- <form name="detailForm"  method="post" > -->
	<form name = "detailForm">
	
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">회원가입</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				아이디 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">
							<input 	type="text" name="userId" class="ct_input_bg" 
											style="width:100px; height:19px"  maxLength="20" >
						</td>
						<td>
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="4" height="21">
										<img src="/images/ct_btng01.gif" width="4" height="21"/>
									</td>
									<td align="center" background="/images/ct_btng02.gif" class="ct_btn" style="padding-top:3px;">
										<!-- <a href="javascript:fncCheckDuplication();" id="btnCmfID">ID중복확인</a> -->
										ID중복확인
									</td>
									<td width="4" height="21">
										<img src="/images/ct_btng03.gif" width="4" height="21"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				비밀번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input 	type="password" name="password" class="ct_input_g" 
								style="width:100px; height:19px"  maxLength="10" minLength="6"  />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				비밀번호 확인 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input 	type="password" name="password2" class="ct_input_g" 
								style="width:100px; height:19px"  maxLength="10" minLength="6"  />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				이름 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input 	type="text" name="userName" class="ct_input_g" 
								style="width:100px; height:19px"  maxLength="50" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">주민번호</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input 	type="text" name="ssn" class="ct_input_g" style="width:100px; height:19px" 
								onChange="javascript:checkSsn();"  maxLength="13" />
				-제외, 13자리 입력
			</td>
		</tr>
	
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">주소</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input		type="text" name="addr" class="ct_input_g" 
							 	style="width:370px; height:19px"  maxLength="100"/>
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">휴대전화번호</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<select 	name="phone1" class="ct_input_g" style="width:50px; height:25px"
								onChange="document.detailForm.phone2.focus();">
					<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
				<input 	type="text" name="phone2" class="ct_input_g" 
								style="width:100px; height:19px"  maxLength="9" />
				- 
				<input 	type="text" name="phone3" class="ct_input_g" 
								style="width:100px; height:19px"  maxLength="9" />
				<input type="hidden" name="phone" class="ct_input_g"  />
			</td>
		</tr>
	
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">이메일 </td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="26">
							<!-- <input 	type="text" name="email" class="ct_input_g" 
											style="width:100px; height:19px" onChange="check_email(this.form);" /> -->
								<input type = "text" name = "email" class = "ct_input_g"
											style = "width:100px; height:19px" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
		<tr>
			<td width="53%">	</td>
	
			<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							<!-- <a href="javascript:fncAddUser();">가입</a> -->
							가입
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
						<td width="30"></td>					
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							<!-- <a href="javascript:resetData();">취소</a> -->
							취소
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	</form>
	
	</body>
	</html>