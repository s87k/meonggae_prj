<%@page import="com.store.meonggae.user.login.domain.LoginDomain"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="나의 상점"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
<c:when test="${ empty param.nick }">
		<c:choose>
		<c:when test="${ empty user }">
			<script type="text/javascript">
				alert("로그인이 필요한 서비스입니다.");
				location.href="${pageContext.request.contextPath}/index.do";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("비정상적인 접근입니다.");
				location.href="${pageContext.request.contextPath}/index.do";
			</script>
		</c:otherwise>
		</c:choose>
</c:when>
<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_store.css">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		var img_elm = document.getElementById("#profileImg");
		img_elm.onerror = function() {
			this.scr = "${pageContext.request.contextPath}/common/My/image/loading.png";
		}
	});//ready
</script>

<%
String nick = request.getParameter("nick");
%>
<!-- 내용 시작 -->
<div class="container">
	<div id="storeBanner" class="storeBanner">
		<div id="profileImg" class="profileImg">
		<img src="${ pageContext.request.contextPath }/profile-img/${ profile }" class="img-circle" style="width: 100px; height: 100px"
				id="profileImg" onError="this.src='${pageContext.request.contextPath}/common/My/image/loading.png';"/>
		</div>
		<div id="userInfo" class="userInfo">
			<div id="nick" class="nick"><%= nick %>님의 상점</div>
		</div>
	</div>
		<span id="storeMenu" class="storeMenu">
			<a href="${ pageContext.request.contextPath }/My/store/store_frm.do?nick=${param.nick}" id="selected">상품</a> | 
			<a href="${ pageContext.request.contextPath }/My/store/store_review_frm.do?nick=${param.nick}" id="unSelected">후기</a>			
		</span>
	<hr>
	
	<c:choose>
	<c:when test="${not empty listSales}">
	
	<div class="row">
		<div class="tab-content">
			<div class="tab-pane active" id="trending">
				<c:forEach items="${ listSales }" var="is">
				<div class="col-md-3 col-sm-4">
					<div class="single-product">
						<div class="product-block">
						
						<a href="${pageContext.request.contextPath}/main_page/products_detail.do?goodsNum=${ is.goodsNum }">
							<img src="../../products-img/${ is.img }" class="thumbnail">
							<div class="product-description text-left">
								<p class="title"><c:out value="${ is.name }"/></p>
								<div style="overflow: hidden;">
								<p class="price" style="float: left;"><c:out value="${ is.price }원"/></p>
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
		
		<div class="noReview">
		판매중인 상품이 없습니다!
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