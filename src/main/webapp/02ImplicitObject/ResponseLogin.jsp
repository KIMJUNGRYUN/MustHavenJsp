<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - Response</title></head>
<body>
<%
//id, pwd를 요청폼의 입력창 name의 값으로 가져옴
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd"); 
		//IgnoreCase 대소문자 구분없이
	//id가 must이고 패스워드가 1234이면 웰컴페이지로 이동
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
 	//sendRedirect는 요청을 새로함
    response.sendRedirect("ResponseWelcome.jsp");
}
else { //아니면 로그인 에러 쿼리스트링 붙여서 다시 메인페이지로 돌아감
    request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
       .forward(request, response); 
}
%>
</body>
</html>