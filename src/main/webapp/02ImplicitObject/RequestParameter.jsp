<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - request</title></head>
<body>
<%
request.setCharacterEncoding("UTF-8");  //문자인코딩 utf-8
String id = request.getParameter("id");  
String sex = request.getParameter("sex");
/* 체크박스는 여러개 선택가능하므로 같은 이름 favo로 여러개의 값이 전송됨*/
/* 그래서 메소드는 ~values 하고 배열로 받음*/
String[] favo = request.getParameterValues("favo");  
String favoStr = "";
if (favo != null) {  
    for (int i = 0; i < favo.length; i++) {
        favoStr += favo[i] + " ";
    }
}
/* intro는 긴 여러줄 문자열 texarea 므로 전송된 문자열에 한줄뛰움("\r\n")을 <br>로 바꿈 */
String intro = request.getParameter("intro").replace("\r\n", "<br/>");  
%>
<ul>
    <li>아이디 : <%= id %></li>
    <li>성별 : <%= sex %></li>
    <li>관심사항 : <%= favoStr %></li>
    <li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>