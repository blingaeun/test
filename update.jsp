<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Update</title>

</head>
<body>

	<h1>TEST TABLE</h1>
	<h4>바꿀 TESTNO 입력후, 새로운 이름과 전화번호를 입력하세요.</h4>
	<form action="update2.jsp" method="post">
	TESTNO : <input type="text" name="TESTNO"><br/>
	NAME : <input type="text" name="NAME"><br/>
	TEL : <input type="text" name="TEL"><br/><br/>
	<button type="submit">수정</button>
	</form>
</body>
</html>

