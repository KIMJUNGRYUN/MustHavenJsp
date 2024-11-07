<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>  
<html>
<head><title>JDBC</title></head>
<body>
    <h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
    <%
    // DB에 연결
    JDBConnect jdbc = new JDBConnect();

    // 쿼리문 생성   
    String sql = "SELECT id, pass, name, regidate FROM member";  
    Statement stmt = jdbc.con.createStatement();  

    // 쿼리 수행(셀렉트는 executeQuery 결과 ResultSet 있음)
    ResultSet rs = stmt.executeQuery(sql);  //여러행의 결과가 들어가 있음

    // 결과 확인(웹 페이지에 출력)
    while (rs.next()) { 
        String id = rs.getString(1); //1번 열의 값
        String pw = rs.getString(2);//2번 열의 값
        String name = rs.getString("name");//번호대신 name 열의 값
        java.sql.Date regidate = rs.getDate("regidate"); //날짜를 가져옴
        //한행의 열들의 값을 전부 출력(한줄씩 출력);
        
        out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>"); 
    }

    // 연결 닫기
    jdbc.close();
    %>
</body>
</html>