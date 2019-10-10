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
<!-- 디테일뷰 시작 전체폼-->
<div id="mypage">
	<form action="#" id="detail_frm" method="post" accept-charset="utf-8">
		<div id="dv">
			<ul class="dv_title" style="margin-top:20px;">
				<li class="dv_title_left" id="trans_after_subject" style="vertical-align:middle;height:50px;padding:0px;background-color:#614190;color:white;font-weight:bold;">
					<div style="margin:13px;">상품명 여기에 들어갑니다.</div>
				</li>
				<li class="dv_title_right" style="height:50px;width:218px;background-color:#614190;color:white;">
					<div style="margin-top:24px;margin-right:13px">경매상품ID : u300640814</div>
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
									<tr style="height:10px;">
									</tr>
									<tr>
										<td>
											<!-- 제품상세설명 간단히 적는부분 -->
											<table class="dr_step1" style="border:1px solid #E7E7E7;">
												<colgroup>
													<col width="50%;" />
													<col width="50%;" />
												</colgroup>
												<tr>
													<td style="border-right:1px solid #E7E7E7;height:20px;font-size:15px;text-align:center;font-weight:bold;">현재 최고 입찰금액
														<!-- <p style="font-size:25px;margin-top:10px;">
														500,000</p> -->
													</td>
													<td style="height:20px;font-size:15px;text-align:center;font-weight:bold;">나의 입찰금액
														<!-- <p style="font-size:25px;margin-top:10px;">
														100,000</p> -->
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<!-- 제품상세설명 간단히 적는부분 -->
											<table class="dr_step1" style="border:1px solid #E7E7E7;">
												<colgroup>
													<col width="50%;" />
													<col width="50%;" />
												</colgroup>
												<tr>
													<td style="border-right:1px solid #E7E7E7;height:90px;text-align:center;">
														<p style="font-size:25px;margin-top:20px;">
														800,000</p>
													</td>
													<td style="border-right:1px solid #E7E7E7;">
														<p style="font-size:25px;margin-top:20px;text-align:center;">
														100,000</p>
													</td>
												</tr>
											</table>
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
											<td style="border-right:1px solid #E7E7E7;">참여인원
												<p>15 / 20</p>
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
											<col width="120px;" />
											<col width="" />
										</colgroup>
										<tr>
											<th>시작가격<br> 즉시구매가<br> 시작시간<br> 종료시간
											</th>
											<td>3,000 만원<br> 3,200만원<br> 2019-09-14 10:32:12<br>
												2019-09-20 21:27:15
											</td>
										</tr>
									</table>
								</span>
								<!-- 현재가격,입찰하기,관심등록 버튼부분 -->
								<span>
									<table class="dr_step2" style="border-top:1px solid #E7E7E7;">
										<colgroup>
											<col width="120px;" />
											<col width="" />
										</colgroup>
										<tr>
											<th>
												 <strong>제품정보</strong><br> 
												 수량<br> 
												 반품가능여부<br> 
												 총 입찰건수<br><br>
												 <strong>판매자정보</strong><br> 
												 아이디<br><br>
												 <strong>입찰자정보</strong><br>
												 잔액 
											</th>
											<td>
												<br>1 개<br> 
												반품불가<br><br><br><br>
												kyeong<br><br><br>
												200,000
											</td>
										</tr>
									</table>
									<button type="button" class="btn_nigeria" style="width:360px;height:70px;margin-left:25px;margin-top:15px">캐시충전</button>
								</span>
							    <!--  수량,반품가능여부,출품자정보 부분 -->
								<span class="dotbot_all">
									<table class="corona" style="margin-top:20px">
										<colgroup>
											<col width="85px;" />
										</colgroup>
										<tr>
											<button type="button" class="btn_algerie" style="width:360px;height:70px;margin-top:3px;">입찰하기</button><br>
											<button type="button" class="btn_nigeria" style="width:360px;height:70px">즉시구매</button>
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
</body>
</html>




