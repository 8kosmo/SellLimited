<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<!-- top은 페이지 맨 위에 로그인, 회원가입 등 있는 하얀 부분 , top의 css에 하단에 보라색 줄그어진거 그려져있음.-->
<div id="top" align="center">
<!-- head -->
<ul class="head">
	<li class="head_txt" style="width: auto; float: right;">
		<a href="/testview/login.jsp">로그인</a><span>|</span>
		<a href="/testview/memberIns.jsp"><strong>회원가입</strong></a><span>|</span>
		<a href="/testview/howToUse.jsp">이용안내</a><span>|</span>
		<div class="layer_add2">
			<a href="#">고객센터</a>
			<ul class="list_layer2">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="#">FAQ</a></li>
			</ul>
			</div>
	</li>  
</ul>
<!-- 로고,검색창,검색버튼 있는부분 -->
<ul class="logopart">
	<!-- 로고있는부분 -->
	<li class="logopart_left"><a href="#"><img src="/images/logo.png"></a></li>
	<!-- 검색창있는부분 -->
	<li class="logopart_center">
		<span class="searchbox_form">
		   <!-- 검색창 -->
		   <input type="text" class="input_search" name="SearchWord" id="SearchWord" value="" onkeydown="javascript: if (event.keyCode == 13) { total_search();return false; }">
		</span>
		<!-- 검색버튼 -->
		<span><a href="#" onclick=""><img src="/images/japanstyle_files/20160926_07.png"></a></span>
	</li>
	<!-- 검색창 오른쪽 광고배너 -->
	<li class="logopart_right"><a href="#"><img src="/images/japanstyle_files/20181113_01.png"></a></li>
</ul>
<!-- 대분류  -->
<ul class="gnb">
	<li class="gnb_left">
		<a href="#"><span>패션</span></a>
		<a href="#"><span>카메라</span></a>
		<a href="#"><span>악기</span></a>
		<a href="#"><span>키덜트</span></a>
		<a href="#"><span>연예인 굿즈</span></a>
		<a href="#"><span>골동품</span></a>
		<a href="#"><span>게임</span></a>
		<a href="#"><span>음반</span></a>
	</li>
</ul>
</div><!-- end of div top -->
<div id="mypage">
   <ul class="mypage_title">
      <li>
      <table class="order_title_table">
      	<colgroup>
			<col width="110px;" />
			<col width="" />
		</colgroup>
		<tr>
			<td class="ott_left"><img src="/images/integ/20150921_01.png"></td>
			<td class="ott_right">이용안내
				<p>SellLimited 관련하여 이용방법과 알아두셔야 할 내용들을 자세히 안내해 드리겠습니다.<br>
				보다 자세한 안내를 원하시면 고객센터를 이용해 주십시오.</p>
			</td>
			</tr>
      </table>
      </li>
      <li>
		<table class="guide_table_head">
		      <caption>
			      SellFeed란 ? <img src="/images/integ/20150918_10.png"> 
			      <p>경매에서 판매하는 상품을 구매에서부터 배송을 대행해 드리는 서비스 입니다.<br><br>SellFeed에서 보여지는 상품은 직접 판매자,구매자가 경매를 통해 상품을 판매하고 구매하며 저희 사이트에서 재고를 두고 판매를 하는것이 아닙니다.<br>따라서 SellFeed에서는 상품에 대한 상세한 정보를 알 수 없으며,
			            원문사이트를 통해 직접 확인해 볼수 있습니다.</p>
		      </caption>
		   </table>
		<table class="guide_table_head2">
		      <caption>
		      SellLimited 이용순서 <img src="/images/integ/20150918_10.png"> 
		      <p><img src="/images/integ/20150920_01.png" style="margin:10px 0;"></p>
		      </caption>
		      <colgroup>
		      <col width="60px;">
		      <col width="200px;">
		      <col width="">
		      </colgroup>
		      <tbody><tr>
		         <td class="papua">1</td>
		         <th>상품 등록</th>
		         <td>판매자가 상품을 등록하는 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">2</td>
		         <th>상품 배송</th>
		         <td>배송기간은 업체의 소재지에 따라 차이가 있습니다.<br>영업일 기준 평균 3일정도 소요됩니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">3</td>
		         <th>상품 검사</th>
		         <td>SellFeed 물품검사는 간이검사 입니다. 필요에 의해 재포장을 할 수도 있습니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">4</td>
		         <th>관리자 승인</th>
		         <td>상품 등록된 물품검사 후 판매 가능 상품인지 승인 하는 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">5</td>
		         <th>시드 발급</th>
		         <td>경매에 참여하기 위해 필요한 시드를 발급하는 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">6</td>
		         <th>입찰</th>
		         <td>시드 발급 후 구매자가 원하는 물품을 구매하기 위해 입찰하는 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">7</td>
		         <th>낙찰</th>
		         <td>입찰 후 구매를 할수 있는 낙찰 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">8</td>
		         <th>재포장</th>
		         <td>상품 간이 검사 후 포장된 물품을 한번 더 검사후 재포장 하는 단계입니다.</td>
		      </tr>
		      <tr>
		         <td class="papua">9</td>
		         <th>상품 배송</th>
		         <td>이때부터 운송장 조회가 가능하며, 영업일 기준 3~5일 소요됩니다.</td>
		      </tr>
		      
		      <tr>
		         <td class="papua">10</td>
		         <th style="border-bottom:none;">배송완료&구매확인</th>
		         <td>배송 완료 후 구매한 물품을 최종 확인 하는 단계입니다.</td>
		      </tr>
		   </tbody>
		   </table>

      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>