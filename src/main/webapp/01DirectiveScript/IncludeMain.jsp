<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "IncludeFile.jsp" %>  <!--다른 JSP 파일(IncludeFile.jsp) 포함-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>
<%
//상단의 인클루드파일에서 선언한 오늘날짜와 내일날짜가 출력됨!
out.println("오늘 날짜 : " + today);
out.println("<br/>");
out.println("내일 날짜 : " + tomorrow);


%>
</body>
</html>
