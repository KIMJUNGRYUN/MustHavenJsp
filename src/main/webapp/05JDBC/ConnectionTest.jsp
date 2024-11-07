<%@ page import="common.JDBConnect"%> 
<%@ page import="common.DBConnPool"%> 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head><title>JDBC</title></head>
<body> <% 
   	 //web.xml 설정에서 가져옴
	 String driver = application.getInitParameter("OracleDriver");
     String url = application.getInitParameter("OracleURL");
     String id = application.getInitParameter("OracleId");
     String pass = application.getInitParameter("OraclePwd"); 
     %>
   
    <h2>JDBC 테스트 1</h2>
    <%
    JDBConnect jdbc1 = new JDBConnect(); 
    jdbc1.close();  //종료
    %>	
    
    <h2>JDBC 테스트 2</h2>
     <%
    JDBConnect jdbc2 = new JDBConnect(driver, url, id, pass); 
    jdbc2.close();  //종료
    %>
    
     <h2>JDBC 테스트 3</h2>
    <%
    JDBConnect jdbc3 = new JDBConnect(application); 
    jdbc3.close();  //종료
    %>
    	
      <h2>커넥션 풀 테스트</h2>
    <%
  		//db 연결
  		DBConnPool pool = new DBConnPool();
    pool.close();
    
    %>	
    
    
   
   
</body>
</html>