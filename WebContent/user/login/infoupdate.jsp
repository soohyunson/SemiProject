<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "${pageContext.request.contextPath}/update.mem">
<table class="updatetable">

					<tr>
						<th colspan="2">Information Update
					</tr>
					<tr>
						<td class="sub">아이디</td>
						<td>${id }
					</tr>
					<tr>
						<td colspan="2" id="idresult"></td>
					</tr>
					<tr>
						<td class="sub">비밀번호</td>
						<td><input type="password" id="pw1" name="pw"></td>
					</tr>
					<tr>
						<td colspan="2" id="pw1result" style="text-align: center;">
							(비밀번호는 영어 대소문자, 숫자 조합 8자 이상)</td>
					</tr>
					<tr>
						<td class="sub">비밀번호 확인</td>
						<td><input type="password" id="pw2"></td>
					</tr>
					<tr>
						<td colspan="2" id="pw2result"></td>
					</tr>
					<tr>
						<td class="sub">이름</td>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<td colspan="2" id="nameresult"></td>
					</tr>
					<tr>
						<td class="sub">휴대폰번호</td>
						<td><input type="text" id="phone" placeholder="010-1234-5678" name="phone"></td>
					</tr>
					<tr>
						<td colspan="2" id="phoneresult"></td>
					</tr>
					<tr>
						<td class="sub">이메일</td>
						<td><input type="text" id="email"
							placeholder="abc123@def.com" name="email"></td>
					</tr>
					<tr>
						<td colspan="2" id=emailresult></td>
					</tr>
					<tr>
						<td colspan="2" id="btnresult">
						<button id="confirm">확인</button> <input type="reset" value="다시입력" id="reset"></td>
					</tr>
				</table>
</form>
</body>
</html>