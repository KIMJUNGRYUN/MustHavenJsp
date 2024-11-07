# JSP 내장 객체 학습 정리

이 문서에서는 JSP 내장 객체(`exception`, `application`, `out`, `request`, `response`)를 활용한 다양한 예제들을 설명하고 각 코드의 기능을 이해하는 데 도움을 줍니다. 각 예제는 서로 연결된 페이지를 포함하며, JSP 개발의 핵심 개념을 다룹니다.

## 1. Exception 객체 활용
- `response.getStatus()` 메서드를 사용하여 HTTP 상태 코드를 확인하고, 404, 405, 500 에러에 따라 적절한 메시지를 출력합니다.

```jsp
<%
int status = response.getStatus();
if (status == 404) {
    out.print("404 에러가 발생하였습니다.");
} else if (status == 405) {
    out.print("405 에러가 발생하였습니다.");
} else if (status == 500) {
    out.print("500 에러가 발생하였습니다.");
}
%>
```

## 2. Application 객체 활용
- **초기화 매개변수** `web.xml`에 설정된 초기화 매개변수를 불러옵니다.
- **서버 경로** `application.getRealPath()` 메서드를 사용하여 서버의 물리적 경로를 얻습니다.
```jsp
<h2>초기화 매개변수: <%= application.getInitParameter("INIT_PARAM") %></h2>
<h2>서버의 물리적 경로: <%= application.getRealPath("/02ImplicitObject") %></h2>
```

## 3. Out 객체 활용
- **버퍼 삭제 및 출력** `out.clearBuffer()`를 통해 버퍼 내용을 삭제하고, `out.flush()`로 즉시 출력합니다.
- **버퍼 크기 확인** `out.getBufferSize()` 와 `out.getRemaining()` 메서드를 사용하여 버퍼 크기를 확인합니다.
```jsp
out.clearBuffer();
out.print("출력 버퍼의 크기: " + out.getBufferSize() + "<br>");
out.flush();
```
## 4. Request 객체 활용
### 클아이언트 요청 정보 읽기
- 클라이언트와 서버의 환경정보 및 전송된 요청 매개변수를 읽어옵니다.
- 연결된 페이지:
    - `RequestWebInfo.jsp`: 환경 정보와 요청 매개변수를 GET 및 POST 방식으로 확인합니다.
    - `RequestParameter.jsp`: 다양한 입력 필드를 통해 전달된 매개변수 읽기.
```jsp
<li>URL: <%= request.getRequestURL() %></li>
<li>데이터 전송 방식: <%= request.getMethod() %></li>
```

## 5. Response 객체 활용
### 로그인 예제
- `ResponseLogin.jsp`: `request.getParameter()`로 ID와 비밀번호를 확인하여 맞으면 `ResponseWelcome.jsp`로 리다이렉트하고, 틀리면 메인 페이지로 다시 포워드합니다
- 연결된 페이지:
-     `ResponseMain.jsp`: 로그인 폼과 에러 메시지 출력.
-     `ResponseWelcome.jsp`: 로그인 성공 페이지.
