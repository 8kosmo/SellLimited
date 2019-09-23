<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트 페이지</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<!-- 경매물품리스트 나오는 전체 폼테이블 -->
<div id="mypage">
<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:40px;width:1018px;">
	<tbody>
		<tr>
			<td height="46" >
				<!-- 인기순,가격순등 눌러서 아작스처리 나오는 부분 -->
				<table border="0" cellpadding="0" cellspacing="0" style="width:1018px;">
					<tbody>
						<tr>
							<td align="right">
								<table border="0" cellpadding="0" cellspacing="0" style="width:1018px;">
									<tbody>
										<tr>
											<td valign="bottom" style="padding-bottom: 5px;">
												<div>
													<ul class="racuList03">
														<li><a href="#"><span id="sort_05">종료빠른순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_06">종료느린순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_01">낮은가격순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_02">높은가격순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_07">즉시구매 낮은가격순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_08">즉시구매 높은가격순</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_04">입찰 낮은수</span></a></li>
														<li style="color:#E6E6E6;padding:0 2px 0 2px;">l</li>
														<li><a href="#"><span id="sort_03">입찰 높은수</span></a></li>
													</ul>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table><!-- 가격순등 정렬하는 버튼 끝 -->
			</td>
		</tr>
		<tr>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 -->
				<span class="omahabeach">
					총 <strong>144,821</strong>개의 상품이 검색 되었습니다.
					<div style="float:right;">
						<select id="goods_limit" onchange="search();">
							<option value="50">50개</option>
							<option value="100">100개</option>
						</select>
					</div>
				</span>
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div class="twice" style="text-align:left;">
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
					<ul>
						<span class="chaeyoung">
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
						</span>
					</ul>
					<!-- 줄사이에 간격주는거 -->
					<div style="height: 30px;"></div>
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
					<ul>
						<span class="chaeyoung">
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
							<!-- 상품 한 개 -->
							<li class="once">
								<div class="sana" alt="0">
									<ul class="yhauc_mets" alt="0">
										<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
										<li class="sana_thumb">
											<div class="mosaic-block bar">
												<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
													<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td align="center">
																	<a href="#" target="_blank">
																		 <img src="/images/내복이.png">
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</li>
										<!-- 목록의 버튼들 -->
										<li class="sana_btns">
											<span class="mb_view">입찰<strong>22건</strong></span>
											<span class="mb_btns">
												<a href="#null" onclick="#"><img src="/images/integ/expected_cost.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" onclick="#"><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank">55인치 액정4KTV Panasonic
													TH-55FZ950(2018년 제조)HDR/WIFI/ ■파나소닉 VIERA★Joshin</a>
										</li>
										<li class="sana_nowprice"></li>
										<li class="sana_price">5,671 円<span>65,217 원</span></li>
										<li class="sana_saler">
												판매자 : <a href="#">jtus2005</a><br>
												남은시간 : 5일
										</li>
									</ul>
								</div>
							</li>
						</span>
					</ul>
					<!-- 줄사이에 간격주는거 -->
					<div style="height: 30px;"></div>
				</div>
				<!-- 페이지네이션 -->
				<table>
					<tbody>
							<tr>
								<td align="center" colspan="5">
									<table border="0" cellspacing="0" cellpadding="0" style="margin-top: 30px">
										<tbody>
											<tr>
												<td class="paging_comm">
													<table border="0" cellpadding="0" cellspacing="0" class="paging_comm" align="center" style="margin: 0 auto;">
														<tbody>
															<tr>
																<td>
																	<a href="#" title="이전" class="btn_page btn_prev"></a>
																	<a href="#" title="page 1" class="btn_page _current">1</a>
																	<a href="#" title="page 2" class="btn_page ">2</a>
																	<a href="#" title="page 3" class="btn_page ">3</a>
																	<a href="#" title="page 4" class="btn_page ">4</a>
																	<a href="#" title="page 5" class="btn_page ">5</a>
																	<a href="#" title="page 6" class="btn_page ">6</a>
																	<a href="#" title="page 7" class="btn_page ">7</a>
																	<a href="#" title="page 8" class="btn_page ">8</a>
																	<a href="#" title="page 9" class="btn_page ">9</a>
																	<a href="#" title="page 10" class="btn_page ">10</a>
																	<a href="#" title="다음" class="btn_page btn_next"></a>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td height="5">&nbsp;</td>
		</tr>
	</tbody>
</table>
</div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>