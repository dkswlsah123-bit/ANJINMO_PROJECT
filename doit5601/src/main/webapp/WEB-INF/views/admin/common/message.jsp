<%@ page contentType="text/html; charset=UTF-8"%>

<%--
	Back-End 에서 로직 처리 → 결과에 다른 alert 출력 후 페이지 이동

	 ↑ 이것만을 담당하는 JSP 페이지 (관리자 페이지에서 사용)
 --%>
<script type="text/javascript">
    // 메시지 출력
    //  ㄴ 공백 처리를 위해 trim() 사용
    let msg = "${ message }".trim();
    if (msg && msg !== "") {
        alert(msg);
    }
    
    // URL 작업
    let url = "${ url }";
    url = (url && url !== "") ? url : "${pageContext.request.contextPath}/admin";
    // 전달된 URL 없을 시, 관리자 메인 대시보드로 이동.
    
    
    // 최종 이동
    location.replace(url); 
</script>