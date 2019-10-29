<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통부분 - Bottom, 퀵바</title>
</head>
<body>
<!-- 페이지 하단에 푸터 -->
<div id="bottom">
	 <ul>
	 	 <!-- 푸터 첫번째줄 -->
	 	 <li class="bm_menu" align="center">
		 	 <a href="#" target="_blank">회사소개</a><span>|</span>
		 	 <a href="#">이용약관</a><span>|</span>
		 	 <a href="#"><strong style="color:red">개인정보처리방침</strong></a><span>|</span>
		 	 <a href="#">이용안내</a><span>|</span>
		 	 <a href="#">고객불만 처리센터</a>
		 <!-- 푸터 첫번째줄 밑에 몸통부분 살짝 회색부분 -->
		 <li class="bm_body">
		 	<span class="bb_left"><img style="width:195px;margin-top:0px;" src="/images/banner/newlogo.png"></span>
		 	<span class="bb_right" style="color:#b2b2b2;font-size:8pt;">
		 		상호 : <strong>(주)SellLimited</strong> <span class="bmslash">|</span>
		 		사업자등록번호 : 111-22-3333 <span class="bmslash">|</span>
		 		대표 : 곽도훈 <span class="bmslash">|</span>
		 		통신판매신고번호 : 2019-서울가산-0315 <span class="bmslash">|</span>
		 		<br>
		 		 주소 : 서울시 금천구 가산동 월드메르디앙2차타워 4층 <span class="bmslash">|</span>
		 		 화장품 제조판매업(수입대행형) : 제 8134 호 <span class="bmslash">|</span>
		 		<br>
		 		<strong style='color:#484848'>대표전화 : 1588-1234</strong> <span class="bmslash">|</span>
		 		FAX : 02-123-4567 <span class="bmslash">|</span>
		 		고객문의 : SellLimited@naver.com <span class="bmslash">|</span>
		 		제휴문의 : SellLimited@naver.com
		 		<br>
		 		<br>
		 		<span class="copy">COPYRIGHT ⓒ2019 SELLLIMITED ALL RIGHTS RESERVED</span>
		 	</span>
		 	<img src="/images/renew160927/20160927_10.png?v=1" usemap="#bottom_map2" style="cursor:pointer;">
		 	 <p>SELLLIMITED는 한정판 물품 경매사이트 이며 입찰, 구매를 중계하는 서비스를 제공하며, 상품의 이미지 및 등록내용, 진품여부 등에 대해서는 일체의 책임을 지지 않습니다.<br>
			 SELLLIMITED는 경매법 등 관련규정을 준수하고 불법물품을 취급하지 않으며, 분할배송에 의한 가격허위신고등 구매자의 불법사항 요청에 대해 일체 협조하지 않습니다.</p>
		 </li>
	 </ul>
</div><!-- end of bottom -->
<!-- 하단에 우리은행 등 링크 거는거 -->
<map name="bottom_map2">
 <area shape="rect" coords="341,1,509,41" href="https://www.venturein.or.kr/venturein/infor/C22100.do" target="_blank" onfocus="this.blur()">
 <area shape="rect" coords="510,1,680,41" href="javascript:wooribank();" onfocus="this.blur()">
 <area shape="rect" coords="681,1,849,41" href="http://www.customs.go.kr/kcshome/index.jsp" target="_blank" onfocus="this.blur()">
 <area shape="rect" coords="850,1,1017,41" href="http://pgweb.uplus.co.kr:8080/pg/wmp/etc/jsp/SettlementSearchr.jsp" target="_blank" onfocus="this.blur()">
</map>
<script type="text/javascript">
	function usafe(strActPage){
		window.open("http://www.usafe.co.kr/usafeShopCheck.asp?com_no="+strActPage,"", "width=520, height=400, scrollbars=no, location=yes, status=yes, left=0, top=0");
	}
	function wooribank(){
		window.open("/pop/wooribank_guarantee.html", "woori_safety_service", "width=630, height=797, resizable=no, scrollbars=no, toolbars=no");
	}
</script>
<!-- </div>end of div wrap -->

<!-- 오른쪽 퀵바 -->
<table id="quickTapbox_table" border="0" cellpadding="0" cellspacing="0" width="1018" >
	<tr>
		<td width= "73"></td>
		<td width="1018"></td>
		<td width= "73" style=" top:0px;width: 70px;height: 100%;z-index: 9999;right:-2px;">
			<table id="quickTapbox" width="73"border="0" cellspacing="0" cellpadding="0"   style="z-index:100">
				<tr>
					<td>
						<div class="quickTapbg" id="quickTapbg">
							<ul>
								<li height="45">&nbsp;</li>
								<li>
									<a href="#" id="toggle" value='1'><img src="/images/quickbold.png" width="73" height="35" alt="open" id="quick_arrow"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('8', 0)"><img src="/images/quick_tab7.gif" width="73" height="64" alt="입찰중경매"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('3', 0)"><img src="/images/quick_tab1.gif" width="73" height="65" alt="관심상품"></a>
								</li>
								<li>
									<a href="/favorite/favSellerList.sf?mem_id=<%=mem_id%>"><img src="/images/quick_tab2.gif" width="73" height="64" alt="관심판매자"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('5', 0)"><img src="/images/quick_tab3_new.gif" width="73" height="64" alt="관심카테고리"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('6', 0)"><img src="/images/quick_tab4.gif" width="73" height="64" alt="관심키워드"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('7', 0)"><img src="/images/quick_tab5.gif" width="73" height="64" alt="오늘본상품"></a>
								</li>
								<li><a href="#"><img src="/images/quick_tab_top.gif" alt="top"></a></li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
				<table width="641" border="0" cellspacing="0" cellpadding="0" class="quickTapbox2" id="quickTapbox2" style="display:none">
							<tr>
								<td>
									<div class="quickTapbg2" id="quick_contents">
									</div>
								</td>
							</tr>
				</table>
	    </td>
	</tr>
</table>
</body>
</html>