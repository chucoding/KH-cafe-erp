<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>


<style type="text/css">
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

.space {
	margin-left : 20px;
	margin-right : 20px;
}

.btn-lg {
	width: 100%;
	height : 70px;
}
.condition-container{
	margin:20px;
}
#divWarehousing{
	margin : 20px;
	margin-top:40px;
}
</style>

<script type="text/javascript">

// datatable
$(document).ready( function () {
	
	var startDate = getPastDate(1);
	var endDate = getRecentDate();
	 
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
	 
	function getRecentDate(){
	    var dt = new Date();
	 
	    var recentYear = dt.getFullYear();
	    var recentMonth = dt.getMonth() + 1;
	    var recentDay = dt.getDate();
	 
	    if(recentMonth < 10) recentMonth = "0" + recentMonth;
	    if(recentDay < 10) recentDay = "0" + recentDay;
	 
	    return recentYear + "-" + recentMonth + "-" + recentDay;
	}
	 
	function getPastDate(period){
	    var dt = new Date();
	 
	    dt.setMonth((dt.getMonth() + 1) - period);
	 
	    var year = dt.getFullYear();
	    var month = dt.getMonth();
	    var day = dt.getDate();
	 
	    if(month < 10) month = "0" + month;
	    if(day < 10) day = "0" + day;
	 
	    if(month=="00"){
	    	month="12";
	    	year = year-1;
	    }
	    
	    return year + "-" + month + "-" + day;
	}
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	table = $('#myTable').DataTable({
    	"scrollY" : 200, //테이블 고정 크기 설정
    	"columnDefs" : [
    	      { width: '5%', targets : [0] },
    	      { width: '7%', targets : [1] },
    	      { width: '7%', targets : [2] },
    	      { width: '15%', targets : [3] },
    	      { width: '15%', targets : [4] },
    	      { width: '15%', targets : [5] },
    	      { width: '14%', targets : [6] },
    	      { width: '14%', targets : [7] },
    	      { width: '8%', targets : [8] }
    	],
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "입고 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
            	"first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            }
        },
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/warehousing/search",
			"dataType":"json",
			"data" : function() {
				console.log($("#warehousingForm").serialize())
				return $("#warehousingForm").serialize(); //검색조건 전달
			},
			"dataSrc" : function(json){
				
				for(let i=0; i<json.data.length; i++){
					if(json.data[i][6] == "0"){
						json.data[i][6] = "비정규"
					}
					if(json.data[i][6] == "1"){
						json.data[i][6] = "정규"
					}
					if(json.data[i][7] == "1"){
						json.data[i][7] = "입고완료"
					}
					if(json.data[i][7] == "0"){
						json.data[i][7] = "입고대기"
					}
				}
				console.log(json.data);
				return json.data;
			}
		}
    });
});	

function getList() {
	
	//검색조건 가져오기
// 	var formData = $("#placingOrderForm").serialize(); //검색조건
	// ajax 한 번 더 실행
	 $("#myTable").DataTable().ajax.reload();
	
}

function enter(e){
	 if (e.keyCode == 13) {
		 getList();
	 }
}

function popupOpen(){
	var url ="/warehousing/popExcel";
	var winWidth = 500;
	var winHeight = 300;
	var winLeft = Math.ceil(( window.screen.width - winWidth )/2);
	var winTop = Math.ceil(( window.screen.width - winHeight )/2);
	var popupOption = "width=" + winWidth+ ", height=" + winHeight +", left=" + winLeft + ", winTop=" + winTop;
	var myWindow = window.open(url, "", popupOption);
}
</script>

<div class="condition-container">
<fieldset>
<legend>입고 관리</legend>
<form action="/warehousing/search" method="post" id="warehousingForm">

<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="warehousingNo">입고번호</label></th>
		<td><input type="number" value=0 id="warehousingNo" name="warehousingNo"/></td>
		<th class="condition"><label for="dealStore">거래 지점</label></th>
		<td>
			<select name="dealStore" id="dealStore" class="search-select select2-selection select2-selection--single form-control">
				<option value="">전체</option>
				<c:forEach var="deal" items="${dealList}" >
					<option value="${deal.dealStore }">${deal.dealStore }</option>
				</c:forEach>
			</select>
		</td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="isAutoInStock">구분</label></th>
		<td>
			비정규
		</td>
		<th class="condition"><label for="inStockStatus">상태</label></th>
		<td>
			<select name="inStockStatus" id="inStockStatus" class="search-select select2-selection select2-selection--single form-control">
				<option value=-1>전체</option>
				<option value="0">입고대기</option>
				<option value="1">입고완료</option>
			</select>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="startDate">입고날짜</label></th>
		<td>
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="2020-01-01">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<span class="space">~</span> 
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="endDate" name="endDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
		<th class="condition"><label>입고창고</label></th>
		<td>
			<select name="storageNo" id="storageNo" class="search-select select2-selection select2-selection--single form-control">
				<option value=-1>전체</option>
				<c:forEach var="warehousing" items="${wareHouseList }" >
					<option value="${warehousing.storageNo }">${warehousing.storageNo }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
	
</table>
</form>
</fieldset>
<div style="float:right;">
	<button id="excelDown" class="btn btn-outline-success"  data-toggle="modal" data-target="#warehousingModal">Excel 다운로드</button>
	<button class="btn btn-outline-primary" onclick="popupOpen()">Excel 업로드</button>
</div>
</div>


<div id="divWarehousing">
<fieldset>
<legend>입고 리스트</legend>
<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>no</th>
            <th>입고번호</th>
            <th>발주 상품 번호</th>
            <th>창고 번호</th>
            <th>총 입고수량</th>
            <th>입고 등록일</th>
            <th>입고구분</th>
            <th>입고상태</th>
            <th>거래처</th>
        </tr>
    </thead>
</table>
</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<div id="warehousingModal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">엑셀 다운로드</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>엑셀을 다운받으시겠습니까?</p>
        <p>경로 : D:/</p>
      </div>
      <div class="modal-footer">
        <button id="downBtn" type="button" class="btn btn-primary"  onclick="location.href='/warehousing/exceldown'">확인</button>
        <button id="downBtn" type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

