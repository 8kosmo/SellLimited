<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인뷰</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<div align="center" style="margin-top: 50px">
<table border="1" style="width: 100px;height: 100px;">
<thead>
대충 물건 리스트
</thead>
<tbody>
<tr>
<td><a href="/product/productDetail.sf?bid_code=QYQK5573&status=auction&item_code=QYQK5573"><button>경매중 테스트</button></a></td>
</tr>
<tr>
<td><a href="/product/productDetail.sf?bid_code=QYQK5573&status=seed&item_code=QYQK5573"><button>시드발급 테스트</button></a></td>
</tr>
<tr>
<td><a href="/account/accountStatusList.sf"><button>충전 =>매니저 승인 테스트</button></a></td>
</tr>
</tbody>
</table>

</div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>