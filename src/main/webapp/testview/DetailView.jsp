<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<div id="top" align="center">
<!-- head -->
<ul class="head">
	<li class="head_txt" style="width: auto; float: right;">
		<a href="/testview/login.jsp" onclick="">로그인</a><span>|</span>
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
<!-- 디테일뷰 시작 전체폼-->
<div id="mypage">
	<form action="#" id="detail_frm" method="post" accept-charset="utf-8">
		<div id="dv">
			<ul class="dv_title" style="margin-top:20px;">
				<li class="dv_title_left" id="trans_after_subject">경매등록Title</li>
				<li class="dv_title_right" style="height:50px;">
					<p>경매상품ID : u300640814</p>
				</li>
			</ul>
			<ul>
				<li>
					<table class="dv_out_table">
						<tr>
							<!-- 상세페이지 네모안에 왼쪽부분전체 -->
							<td class="dot_left" style="position:relative;">
								<table class="dotl_in">
									<!-- 상세페이지 네모안에 사진나오는 부분 -->
									<tr>
										<td class="dotl_in_thumb">
											<!-- 제일 큰 메인사진 -->
											<div class="ditbigthumb">
												<img id="big_img" src="/images/img_avatar1.png" >
											</div>
											<!-- 밑에 조그만한 서브사진 클릭하면 메인되게 하기 -->
											<div class="ditsmallthumb">
												<span><a onclick=""><img src="/images/내복이.png"></a></span>
												<span><a onclick=""><img src="/images/내복이.png"></a></span>
												<span><a onclick=""><img src="/images/내복이.png"></a></span>
											</div>
										</td>
									</tr>
									<tr>
										<td style="height:200px;">
											<div style="position:absolute;bottom:0px;width:100%;">
												<!-- 제품상세설명 간단히 적는부분 -->
												<span class="ctntxt" style="margin-top:0px">
													<strong>제품상세설명</strong>여기에 간단한 제품에 대한 소개 적고 끝낼까요?????
												 	<br>위 고양이는 현영누나의 구여운 고양이로 보고서 심장이 멎을수 있는 위험이 있으니 조심해서 보시기 바랍니다.
												 </span>
												 <!-- 빨간글씨로 주의사항 적은부분 -->
												 <span class="endtxt" style="font-weight:bold;color:red">
												 	낙찰금액외에 현지운송료, 상품검수비(물품검사비), 대행수수료 등의 추가요금이 발생합니다.
												 </span>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<!-- 상세페이지 네모안에 오른쪽부분전체 -->
							<td class="dot_right">
								<!-- 입찰건수, 남은시간 나오는 부분 -->
								<span>
									<table class="dr_step1">
										<colgroup>
											<col width="50%;" />
											<col width="50%;" />
										</colgroup>
										<tr>
											<td style="border-right:1px solid #E7E7E7;">입찰건수
												<p>3</p>
											</td>
											<td>남은시간
												<p style="font-size:25px">1일 +8:48:36<!-- <iframe style="width:150px;height:36px;" src="#" frameborder='0' scrolling='no'></iframe> --></p>
											</td>
										</tr>
									</table>
								</span>
								<!-- 시작가격~종료일 나오는 부분 -->
								<span>
									<table class="dr_step2">
										<colgroup>
											<col width="95px;" />
											<col width="" />
										</colgroup>
										<tr>
											<th>시작가격<br> 시작시간<br> 종료일
											</th>
											<td>3,000 만원<br> 2019-09-14 10:32:12<br>
												2019-09-20 21:27:15
											</td>
										</tr>
									</table>
								</span>
								<!-- 현재가격,입찰하기,관심등록 버튼부분 -->
								<span>
									<table class="dr_step3">
										<colgroup>
											<col width="95px;" />
											<col width="" />
										</colgroup>
										<tr>
											<th>현재가격</th>
											<td class="pprice">3,200 만원
											</td>
										</tr>
										<tr>
											<td colspan="2" class="buttonsarray">
												<a onfocus="blur();" id="auction_send" title="바로입찰">
													<button type="button" class="btn_algerie">입찰하기</button>
												</a>
												<button type="button" class="btn_nigeria" onclick="">관심등록</button>
											</td>
										</tr>
									</table>
								</span>
								<!-- 파손위험 보상경고, 참고하세요! 부분 -->
								<span>
									<!-- 파손위험 보상경고 -->
									<span>
										<img src="/images/banner/notice_banner.png" style="margin-left: 25px; margin-top: 0px" />
									</span>
									<div style="height: 10px;"></div>
									<!-- 참고하세요! 부분 -->
									<table class="dr_step9" style="margin-bottom: -15px;">
										<colgroup>
											<col width="" />
											<col width="103px;" />
										</colgroup>
										<tr>
											<th>
												<textarea class="input_panama">
													우리 여기에 무언가 참고할 만한 내용들을 적어서 표현하면 될거같습니다. 이용안내에 대한 내용을
													간단하게 쓰고 오른쪽에 자세하게 보고싶으면 클릭해서 링크걸어주면 될듯합니다.
												</textarea>
											</th>
											<td>
												<a href="#" target="_blank">
													<img src="/images/integ/20150925_03.png">
												</a>
											</td>
										</tr>
									</table>
									<div style="height: 220px;"></div>
								</span>
								<!-- 수량,반품가능여부,출품자정보 부분 -->
								<span class="dotbot_all">
									<table class="corona" style="margin-top:20px">
										<colgroup>
											<col width="85px;" />
											<col width="" />
										</colgroup>
										<tr>
											<th>
												 수량<br> 반품가능 여부
											</th>
											<td>
												 1<br>
												<span id="trans_after_return_info">반품불가</span>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="padding-left: 0;" >
												<br>
												<strong>출품자정보</strong><br>
												<span style="height: 25px; line-height: 25px;">
													ID : <a href="#" style="text-decoration: none;">
															<span class="corona_id">sho_you612731</span>
														 </a>
												</span>&nbsp;&nbsp;
												<a href="#">
													<img src="/images/seller_icon.png" alt="관심등록">
												</a>
											</td>
										</tr>
									</table>
								</span>
							</td>
						</tr>
					</table>
				</li>
			</ul>
		</div>
	</form>
</div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>




