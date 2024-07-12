<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 확인창"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css?asd11f">
<!-- CSS -->
<script type="text/javascript">
	$(function(){
		$("#pwChkBtn").click(function(){
			var inputDate = $("#pw").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/My/mypage/personal/pwChk.do",
				type: "GET",
				dataType: "JSON",
				data: {sendData : inputDate},
				error: function(xhr){
				},
				success: function(data){
					var result = data.result;
					if(result == "true"){
						passwordChkSuccess();
					}else if(result == "noSession"){
						alert("로그인이 필요한 서비스입니다.");
						location.href="${pageContext.request.contextPath}/index.do";
					}else{
						for(var i=0; i<5 ; i++){
							$("#chkFail").fadeToggle(500);
						}//for
							$("#chkFail").fadeIn(500);
					}//else
				}//success
			});//ajax
		});
	});//ready
	
	function passwordChkSuccess(){
		location.href = "${pageContext.request.contextPath}/My/mypage/personal/personalInfo_frm.do";
	}//passwordChkSuccess
	
	
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "personal";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
	</div>
	<div id="infoChk1" class="infoChk1">회원 정보 확인</div><br>
	<div id="infoChk2" class="infoChk2">비밀번호 : <input type="password" id="pw"/> </div>
	<input type="button" value="확인" id="pwChkBtn"/>
	<div id="chkFail">인증에 실패하였습니다. 다시 시도해주세요.	</div>
</div>
<!-- 내용 끝 -->

	</c:otherwise>
</c:choose>