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
- `response.getStatus()` 메서드를 사용하여 HTTP 상태 코드를 확인하고, 404, 405, 500 에러에 따라 적절한 메시지를 출력합니다.
