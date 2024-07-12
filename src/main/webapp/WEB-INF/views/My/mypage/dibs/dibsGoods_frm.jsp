<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="찜 목록"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "dibsGoods";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
	</div>
		
	<c:choose>
	<c:when test="${not empty allDibsList}">
	
	<div class="row">
		<div class="tab-content">
			<div class="tab-pane active" id="trending">
				<c:forEach items="${ allDibsList }" var="is">
				<div class="col-md-3 col-sm-4">
					<div class="single-product">
						<div class="product-block">
							<a href="${pageContext.request.contextPath}/main_page/products_detail.do?goodsNum=${ is.goodsNum }">
								<img src="${pageContext.request.contextPath}/products-img/${ is.img }" class="thumbnail">
								<div class="product-description text-left">
									<p class="title"><c:out value="${ is.name }"/></p>
									<div style="overflow: hidden;">
									<p class="price" style="float: left;"><c:out value="${ is.price }"/>원</p>
									<p class="time-ago" style="float: right;"><c:out value="${ is.inputDate }"/></p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="pagination" style="display: flex; justify-content: center;">${pagination}</div>
	</c:when>
	<c:otherwise>
		<div class="noGoodsDibs">
		찜한 상품이 없습니다!
		</div>
	</c:otherwise>
	</c:choose>
	
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>