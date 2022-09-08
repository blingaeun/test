<%@ page contentType="text/html" import="java.sql.*,javax.sql.*,java.util.*,javax.naming.*"%>
<%


    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try{

        out.println("<h2>DataSource test</h2>");
        Context ctx=null;
        Hashtable ht=new Hashtable();                   
        ht.put ( Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
        ht.put ( Context.PROVIDER_URL,"t3://192.168.137.58:9001");
        ctx=new InitialContext(ht);
        DataSource ds=(DataSource)ctx.lookup("DS");
        conn = ds.getConnection(); 
           
        stmt = conn.createStatement();   
                                                                
        String sqlstr = "SELECT * FROM TEST";                      
        stmt.executeQuery(sqlstr);              
        rs = stmt.getResultSet();   
%>
<html>
<body>
<table border=1 cellpadding=0 cellspacing=1 >
<tr height="25" bgcolor="#FFC0CB"> 
<td width="100" align="center"> TESTNO
<td width="100" align="center"> NAME
<td width="100" align="center"> TEL
</tr> 
<%           
                   while(rs.next()) {
%>
<tr height="25">
        <td width="100" align="center"><%= rs.getString(1)%>
        <td width="100" align="center"><%= rs.getString(2)%>
        <td width="100" align="center"><%= rs.getString(3)%>
</tr>


<%
            }                  
               }catch(Exception e) {                 
                   System.out.println("Error : " + e.toString());              
               } finally {
                   rs.close();                                                                                                         
                   stmt.close();                     
                   conn.close();       
        }
%>
</table>
<a href="insert.jsp">INSERT</a>
<a href="delete.jsp">DELETE</a>
<a href="update.jsp">UPDATE</a>
</body>
</html>            


