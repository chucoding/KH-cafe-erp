<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!--   <meta name="description" content=""> -->
<!--   <meta name="author" content=""> -->

<!-- 헤더 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- select2 4.0.5 버전 -->
<link rel="stylesheet" href="/resources/vendor/select2/select2.min.css" />

<!-- datepicker -->
<link href="/resources/css/datepicker.css">
<link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

<!-- 폰트 어썸 4.7 버전 -->
<link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

<!-- 폰트어썸 5.12 버전 -->
<script src="https://kit.fontawesome.com/a1cb5a2b66.js" crossorigin="anonymous"></script>

<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet">
<!-- dataTable checkbox -->
<!-- <link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" /> -->

<!-- 제이쿼리 3.2.1 버전 -->
<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript -->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- 자바스크립트 공통 메소드 모임 -->
<script type="text/javascript" src="/resources/js/common.js"></script>

<title>: : : KH-CAFE ERP : : :</title>
<style type="text/css">
#container{
	min-width : 1800px;
}
#wrapper{
	min-height:800px;
	margin : 20px;
}
#footer{
	padding : 2rem;
	text-align : center;
	height : 130px;
	background-color : #2C3E50;
}
#regulation, #corporationInfo, #copyright {
	margin-bottom : 0.5rem;
}
.dropdown:hover .dropdown-menu {
	margin-top:25px;
	background-color : #2C3E50;
    display: block;
    margin-top: 0;
}
.dropdown-menu ul li a{
	text-decoration : none;
}

.dropdown-menu ul li :hover{
	color : #25b09c;
}

.menubar li a{
	color : white;
	width: 150px;
    text-align: center;
}

li{
	list-style:none;
	margin : 5px 0px;
}
.nav-link{
	font-size : 17px;
}

/* 검색조건 색상 */
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}
</style>

</head>
<body>
<div id="container">
<div id="header">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary static-top">
  <a class="navbar-brand" href="/dashboard/index" style="margin-top:5px"><img src="/resources/img/KH.png" style="height:40px; margin-bottom:5px;"/>ERP 통합 관리 프로그램</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse menubar" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link" href="/manageProduct/list">상&nbsp;&nbsp;&nbsp;품</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="/manageProduct/list">상품 관리</a></li>
        	<li><a href="/product/index">상품 등록</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/order/orderlist">주&nbsp;&nbsp;&nbsp;문</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="/placingOrder/management">발&nbsp;&nbsp;&nbsp;주</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="/placingOrder/management">발주 관리</a></li>
        	<li><a href="/placingOrder/registration">발주 등록</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="/warehousing/warehousingList">입&nbsp;&nbsp;&nbsp;고</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="/warehousing/warehousingList">입고 관리</a></li>
        	<li><a href="/warehousing/registration">입고 등록</a></li>
        	<li><a href="#">단가 현황</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="/release/list">출&nbsp;&nbsp;&nbsp;고</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="/release/list">출고 관리</a></li>
        	<li><a href="/release/releaseCost">출고가 보기</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/statistics/sales">매출 통계</a>
      </li>    
      <!-- 매니저, 지점장만 직원관리 가능 -->
      <c:if test="${position eq '2' or position eq '3' }">
      	<li class="nav-item">
        	<a class="nav-link" href="/manageStaff/staff">직 원 관 리</a>
      	</li>    
      </c:if> 
      <li class="nav-item">
        <a class="nav-link" href="/cs/list">C&nbsp;&nbsp;&nbsp;S</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/notice/list">공 지 사 항</a>
      </li>      
    </ul>
  </div>
	<ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#logoutModal">로그아웃</a>
      </li>    
 	</ul>
 	
</nav>
</div>

<div id="logoutModal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그아웃</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>로그아웃 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='/login/logout'">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div id="wrapper">