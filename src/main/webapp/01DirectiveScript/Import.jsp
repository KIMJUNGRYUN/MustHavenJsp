<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 -import 속성</title>
</head>
<body>
<%
//Date 객체 생성
Date today = new Date();
//날자 포맷 객체
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String todayStr = dateFormat.format(today); //오늘 날짜를 포맷형식으로 바꿈
out.println("오늘 날짜 : " + todayStr);
%>
</body>
</html>