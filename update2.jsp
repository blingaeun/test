<%@ page contentType="text/html" import="java.sql.*,javax.sql.*,java.util.*,javax.naming.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Complete!</title>
</head>
<body>
<%
// POST 방식의 한글처리
request.setCharacterEncoding("UTF-8");

// 파라미터 정보 가져오기
String TESTNO = request.getParameter("TESTNO");
String NAME = request.getParameter("NAME");
String TEL = request.getParameter("TEL");

%>
<%
// JDBC 참조 변수 준비
Connection con = null; 
PreparedStatement pstmt = null; 

    try{
    out.println("<h2>update 성공</h2>");
        Context ctx=null;
        Hashtable ht=new Hashtable();
        ht.put ( Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
        ht.put ( Context.PROVIDER_URL,"t3://192.168.137.58:9001");
        ctx=new InitialContext(ht);
        DataSource ds=(DataSource)ctx.lookup("DS");
        con = ds.getConnection();

        String sqlstr = "UPDATE TEST SET NAME = ?, TEL = ? WHERE TESTNO = ?";
	pstmt = con.prepareStatement(sqlstr);
	pstmt.setString(1, NAME);
	pstmt.setString(2, TEL);
	pstmt.setString(3, TESTNO);
	pstmt.executeUpdate();
%>
<%
	}catch(Exception e) {
		 System.out.println("Error : " + e.toString());
               } finally {
			// JDBC 자원 닫기
			pstmt.close();
			con.close();
			}
%>
<script>
alert("변경 완료!");
</script>
<a href="select.jsp">확인하려면 클릭하세요</a>
</body>
</html>

