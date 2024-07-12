<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="헤더"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
*/%>
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/header.js"></script>
<div class="nk-header nk-header-fixed is-light">
  <div class="container-fluid">
    <div class="nk-header-wrap">
      <div class="nk-header-tools">
        <ul class="nk-quick-nav">
          <li class="dropdown user-dropdown">
            <div class="dropdown-toggle" data-bs-toggle="dropdown">
              <div class="user-toggle">
                <div class="user-avatar sm">
                  <em class="icon ni ni-user-alt"></em>
                </div>
                <div class="user-info d-none d-md-block">
                  <div class="user-status">관리자</div>
                  <div class="user-name dropdown-indicator"><c:out value="${mgr.nick }"/></div>
                </div>
              </div>
            </div>
            <div id="dropLogout" class="dropdown-menu dropdown-menu-md dropdown-menu-end dropdown-menu-s1" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(-10px, 38px);">
              <div class="dropdown-inner user-card-wrap bg-lighter d-none d-md-block">
                <div class="user-card">
                  <div class="user-avatar">
                  </div>
                  <div class="user-info">
                    <span class="lead-text"><c:out value="${mgr.nick }"/></span>
                    <span class="sub-text"><c:out value="${mgr.email }"/></span>
                  </div>
                </div>
              </div>
              <div class="dropdown-inner">
              </div>
              <div class="dropdown-inner">
                <ul class="link-list">
                  <li>
                    <a href="${pageContext.request.contextPath}/mgr/logout.do">
                      <em class="icon ni ni-signout"></em>
                      <span>로그아웃</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </li>
          <li class="dropdown notification-dropdown me-n1">
            <div class="dropdown-toggle nk-quick-nav-icon" data-bs-toggle="dropdown">
              <div class="icon-status icon-status-info icon-status-info2" id="iconNotification">
                <em class="icon ni ni-bell"></em>
              </div>
            </div>
            <div id="dropNotification" class="dropdown-menu dropdown-menu-xl dropdown-menu-end dropdown-menu-s1" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(-10px, 38px);">
              <div class="dropdown-head">
                <span class="sub-title nk-dropdown-title">알림</span>
                <span id="noticeReadAll" style="color:rgba(121,139,255,1); cursor:pointer;">모두 읽음으로</span>
              </div>
              <div class="dropdown-body">
                <div class="nk-notification" id="noticeList">
                
<!--                 <div class="nk-notification-item dropdown-inner"> -->
<!--                 	<div class="nk-notification-icon"> -->
<!--                 		<em class="icon icon-circle bg-danger-dim ni ni-curve-down-right"></em> -->
<!--                 	</div> -->
<!--                 	<div class="nk-notification-content"> -->
<!--                 		<div class="nk-notification-text">' + noticeType + '<span>' + arrNotice[i].title + '</span></div> -->
<!--                 		<div class="nk-notification-time">' + arrNotice[i].timeAgo + '</div> -->
<!--                 	</div> -->
<!--                 </div> -->
                
                </div>
              </div>
              <div class="dropdown-foot center">
                <span>&nbsp;</span>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>