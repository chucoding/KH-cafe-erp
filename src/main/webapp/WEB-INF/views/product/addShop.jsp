<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="/WEB-INF/views/layout/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
	$("#addShop a.dropdown-item").click(function(){
		$("#addShop > button").html( $(this).html() );
	})
	
	$("#select").click(function() {
		$f = $("<form>").attr({"action": "/product/addShop", "method": "post"})
			.append( $("<input>").attr({"type": "hidden", "name": "shopName", "value": $("#addShop > button").html()}) )
			.appendTo( $(document.body) );
// 		$f.submit();
	});
})
</script>
<h1>판매지점 등록하기이이이이이</h1>
<hr>
<div class="text-center">
<div id="addShop" class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-outline-primary">지점보기</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;" x-placement="bottom-start">
      <c:forEach items="${ shopList }" var="list">
      <a class="dropdown-item" href="#">${ list.shopName }</a>
      </c:forEach>
    </div>
  </div>
</div>

	<button id="select" type="button" class="btn btn-primary">등록</button>
</div>


<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>
