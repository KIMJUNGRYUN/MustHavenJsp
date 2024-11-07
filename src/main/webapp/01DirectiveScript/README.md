# JSP 지시어 학습 정리

이 문서에서는 JSP에서 사용된 다양한 지시어(`page`, `include`)와 속성들에 대해 학습한 내용을 정리합니다. 각 예제 코드와 함께 JSP의 핵심 개념들을 설명합니다.

## 1. page 지시어 (`buffer`, `autoFlush` 속성)
- **buffer**: JSP에서 버퍼의 크기를 설정합니다. 예제에서 `buffer="1kb"`로 설정하여 1KB만큼 버퍼를 지정하였습니다.
- **autoFlush**: 버퍼가 가득 찼을 때 자동으로 내용을 출력할지 여부를 설정합니다. `autoFlush="true"`로 설정 시, 버퍼가 꽉 차면 자동으로 플러시됩니다.

```jsp
<%@ page buffer="1kb" autoFlush="true" %>
```

## 2. page 지시어 (`errorPage`, `isErrorPage` 속성)
- **errorPage**: 예외가 발생했을 때 지정된 페이지로 이동하도록 설정합니다.
- **isErrorPage**: 해당 페이지가 오류 페이지로 사용될 경우 설정합니다.

```jsp
<%@ page errorPage="errorPage.jsp" isErrorPage="true" %>
<%
int myAge = Integer.parseInt(request.getParameter("age")) + 10;  // 에러 발생
%>
```

## 3. 예외 처리
- **try-catch** 문을 사용하여 예외가 발생했을 때 사용자에게 오류 메시지를 출력하도록 설정합니다.
```jsp
<%
try {
    int myAge = Integer.parseInt(request.getParameter("age")) + 10;
    out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
} catch (Exception e) {
    out.println("예외 발생 : 매개변수 age가 null입니다.");
}
%>

```

## 4. page 지시어(`import`속성)
- **import**: 외부 클래스나 패키지를 불러오기 위해 사용됩니다. 예제에서는 SimpleDateFormat과 Date 클래스를 가져와 날짜 포맷을 적용했습니다.
```jsp
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String todayStr = dateFormat.format(today);
out.println("오늘 날짜 : " + todayStr);
%>
```

## 5. include 지시어
- **include**: 다른 JSP 파일을 포함하여 해당 파일의 내용을 삽입할 수 있습니다.
```jsp
  <%@ include file="IncludeFile.jsp" %>

```


## 6. 스크립트 요소
- **선언부**: (`<%! ... %>`): 메서드나 변수를 선언하여 페이지 전역에서 사용할 수 있도록 합니다.
- **스크립틀릿**: (`<% ... %>`): JSP 내부에서 자바 코드를 실행할 때 사용합니다.
```jsp
<%! public int add(int num1, int num2) { return num1 + num2; } %>
<%
int result = add(10, 20);
out.println("덧셈 결과: " + result);
%>
```

## 7. page 지시어 `trimDirectiveWhitespaces 속성)
- **trimDirectiveWhitespaces**: JSP 파일에서 불필요한 공백을 제거합니다.
```jsp
<%@ page trimDirectiveWhitespaces="true" %>
```

