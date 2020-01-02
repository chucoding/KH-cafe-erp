<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
	
});
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>

<div class="container">

<h1 class="pull-left">��������</h1>

<hr>

<table class="table table-bordered">
<tr>
<td class="info">�۹�ȣ</td><td colspan="3">${view.nBoardNo }</td>
</tr>

<tr>
<td class="info">�ۼ���</td><td>${view.staffName }</td>
<td class="info">�ۼ���</td><td>${view.nBoardDate }</td>
</tr>

<tr>
<td class="info">����</td><td>${view.shopNo }</td>
<td class="info">����</td><td colspan="3">${view.nBoardTitle }</td>
</tr>

<tr><td class="info"  colspan="4">����</td></tr>

<tr><td colspan="4">${view.nBoardContent }</td></tr>

</table>

<!-- ��ư ���� -->
<div class="text-center" style="float: right;">
	<a href="/notice/list"><button class="btn btn-success">���</button></a>
	<c:if test="${staffNo eq view.staffNo }">
		<a href="/notice/update?nBoardNo=${view.nBoardNo }"><button class="btn btn-primary">����</button></a>
		<a href="/notice/delete?nBoardNo=${view.nBoardNo }"><button class="btn btn-danger">����</button></a>
	</c:if>
</div><!-- ��ư ���� end -->

</div><!-- .container -->

</body>
</html>