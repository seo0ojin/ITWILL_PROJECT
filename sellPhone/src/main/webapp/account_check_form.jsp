<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%String payment = request.getParameter("payment"); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계좌이체</title>
</head>
<script type="text/javascript">

// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue() {
	opener.document.o_accountNo.value = window.document.getElementById('accountNo').value;
	window.close();
}
function cancel(){
	opener.document.getElementById("accountCk").checked=false;
	window.close();
}
</script>
<%-- <%
boolean isChecked=false;
if(request.getParameter("accountNo")!=null){
	isChecked=true;
}
%> --%>
<body onload="document.getElementById('accountNo').focus();">
<form method="POST" action="account_check_action.jsp" name="account_check_f" id="account_check_f">
<table>
	<tr>
		<td>은행</td>
		<td>
			<select name="bank" id="bank">
				<option value="신한은행" selected="selected">신한은행</option>
				<option value="국민은행">국민은행</option>
				<option value="우리은행">우리은행</option>
				<option value="농협은행">농협은행</option>
				<option value="카카오뱅크">카카오뱅크</option>
				<option value="케이뱅크">케이뱅크</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>계좌번호</td>
		<td>
			<input type="text" name="accountNo" id="accountNo">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="accountOwner" id="accountOwner" >
		</td>
	</tr>
</table>
<button type="submit">확인</button>
<button type="button" onclick="cancel();">취소</button>
</form>
</body>
</html>