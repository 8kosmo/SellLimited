<%@page import="com.sellfeed.util.PageBar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
//시드참여중 리스트
	List<Map<String,Object>> itemStatusSeedList = 
		(List<Map<String,Object>>)request.getAttribute("itemStatusSeedList");
	int totalsize = 0;
	/* 페이지네이션 추가 */
	int numPerPage = 15; 
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	if(itemStatusSeedList != null && itemStatusSeedList.size()>0){
		totalsize = itemStatusSeedList.size();
	}
	int rowsize = totalsize/5;
	if(itemStatusSeedList.size()<=numPerPage){
		if(totalsize%5>0){
			rowsize++;
		}
	}
//경매진행중 리스트
	List<Map<String,Object>> itemStatusAuctionList =
		(List<Map<String,Object>>)request.getAttribute("itemStatusAuctionList");
	int totalsize1 = 0;
	int numPerPage1 = 15; 
	int nowPage1 = 0;
	if(request.getParameter("nowPage1")!=null){
		nowPage1 = Integer.parseInt(request.getParameter("nowPage1"));
	}
	if(itemStatusAuctionList != null && itemStatusAuctionList.size()>0){
		totalsize1 = itemStatusAuctionList.size();
	}
	int rowsize1 = totalsize1/5;
	if(itemStatusAuctionList.size()<=numPerPage1){
		if(totalsize1%5>0){
			rowsize1++;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트 페이지</title>
<%@ include file="/common/cssJs.jsp" %>
<script type="text/javascript">
	function itemStatusSeedList(pageNumber) {
		$.ajax({
			method:'GET'
			,url:'/product/itemStatusSeedList.sf?nowPage='+pageNumber
			,success:function(data){
				$("#itemStatusSeedList").html(data);
			}
		});
	}
	function itemStatusAuctionList(pageNumber1) {
		$.ajax({
			method:'GET'
			,url:'/product/itemStatusAuctionList.sf?nowPage1='+pageNumber1
			,success:function(data){
				$("#itemStatusAuctionList").html(data);
			}
		});
	}
	function total_search() {
		var total_keyword = encodeURIConponent($("#SearchWord").val());
		if(total_keyword == ''){
			alert('검색할 상품을 입력해주세요.');
			$("#SearchWord").focus();
			return false;
		}
		
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#")
	});
</script>
<%@ include file="/common/top.jsp" %>
<!-- 경매물품리스트 나오는 전체 폼테이블 -->
<div id="mypage">
<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:40px;width:1018px;">
	<tbody>
		<tr>
			<td height="46" >
<!-- 				인기순,가격순등 눌러서 아작스처리 나오는 부분
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
				</table>가격순등 정렬하는 버튼 끝 -->
			</td>
		</tr>
		<tr>
			<td id="contents"><span class="omahabeach">시드 모집 상품</span></td>
		</tr>
		<tr>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 -->
				총<strong><%=totalsize %></strong>개의 상품이 검색 되었습니다.
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div id="itemStatusSeedList" class="twice" style="text-align:left;">
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
<%
				if(itemStatusSeedList.size()>0){
					for(int i=0;i<rowsize;i++){
%>
					<ul>
						<span class="chaeyoung">
							<!-- 상품 한 개 -->
<%
						if(totalsize>=((i+1)*5)){
							for(int j=0;j<5;j++){
								Map<String,Object> rMap = itemStatusSeedList.get(i*5+j);
%>
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
																		 <img src="//192.168.0.187/itemPhoto/<%=rMap.get("PHOTO_NAME") %>">
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
											<span class="mb_view">시드<strong><%=rMap.get("BIDDER_COUNT") %>명</strong></span>
											<span class="mb_btns">
												<a href="#null" ><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" ><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" ><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank"><%=rMap.get("PRODUCT_DETAIL") %></a>
										</li>
										<li class="sana_nowprice"></li>
										<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
										<li>현재 구매가 : <%=rMap.get("FINAL_PRICE") %>원</li>
										<li class="sana_saler">
												판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
												남은시간 : <%=rMap.get("END_SEED") %>
										</li>
									</ul>
								</div>
							</li>
<%
							}//end of for
						}//end of if
						else{
							for(int j=0;j<totalsize%5;j++){
								Map<String,Object> rMap = itemStatusSeedList.get(i*5+j);							
%>
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
																		 <img src="//192.168.0.187/itemPhoto/<%=rMap.get("PHOTO_NAME") %>">
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
											<span class="mb_view">시드<strong><%=rMap.get("BIDDER_COUNT") %>명</strong></span>
											<span class="mb_btns">
												<a href="#null" ><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" ><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" ><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank"><%=rMap.get("PRODUCT_DETAIL") %></a>
										</li>
										<li class="sana_nowprice"></li>
										<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
										<li>현재 구매가 : <%=rMap.get("FINAL_PRICE") %>원</li>
										<li class="sana_saler">
												판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
												남은시간 : <%=rMap.get("END_SEED") %>
										</li>
									</ul>
								</div>
							</li>
<%
							}//end of else for
						}//end of else
%>
						</span>
					</ul>
<%
					}//end of preFor
				}//end of preif
				else{
%>
	            <tr>
	               <td height="200" colspan="11">상품이 존재 하지 않습니다.</td>
	            </tr>
<%
				}//end of else
%>
					<!-- 줄사이에 간격주는거 -->
					<div style="height: 30px;"></div>
				</div>
				<!-- 페이지네이션 -->
			   <li class="paging"><table border="0" cellpadding="0"
			         cellspacing="0" class="paging_comm" align="center"
			         style="margin: 0 auto;">
			         <tbody>
			            <tr>
			               <td>
<%
								   //String pagePath = "/product/itemStatusSeedList.sf?";
								   String pagePath = "javascript:itemStatusSeedList("; 
								   PageBar pb = new PageBar(numPerPage,totalsize,nowPage,pagePath);
								   String pagination = pb.getPageBar1();
								   out.print(pagination);
%>
			            </tr>
			         </tbody>
			      </table>
			      </li>
			</td>
		</tr>
		<tr>
			<td height="5">&nbsp;</td>
		</tr>

<!-- 경매진행 중 리스트 -->
<tr>
			<td id="contents"><span class="omahabeach">경매 진행 상품</span></td>
		</tr>
		<tr>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 -->
				총<strong><%=totalsize1 %></strong>개의 상품이 검색 되었습니다.
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div id="itemStatusAuctionList" class="twice" style="text-align:left;">
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
<%
				if(itemStatusAuctionList.size()>0){
					for(int i=0;i<rowsize1;i++){
%>
					<ul>
						<span class="chaeyoung">
							<!-- 상품 한 개 -->
<%
						if(totalsize1>=((i+1)*5)){
							for(int j=0;j<5;j++){
								Map<String,Object> rMap = itemStatusAuctionList.get(i*5+j);
%>
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
																		 <img src="//192.168.0.187/itemPhoto/<%=rMap.get("PHOTO_NAME") %>">
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
											<span class="mb_view">입찰<strong><%=rMap.get("BID_COUNT") %>건</strong></span>
											<span class="mb_btns">
												<a href="#null" ><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" ><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" ><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank"><%=rMap.get("PRODUCT_DETAIL") %></a>
										</li>
										<li class="sana_nowprice"></li>
										<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
										<li>현재 구매가 : <%=rMap.get("FINAL_PRICE") %>원</li>
										<li class="sana_saler">
												판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
												남은시간 : <%=rMap.get("AUCT_ENDDATE") %>
										</li>
									</ul>
								</div>
							</li>
<%
							}//end of for
						}//end of if
						else{
							for(int j=0;j<totalsize1%5;j++){
								Map<String,Object> rMap = itemStatusAuctionList.get(i*5+j);							
%>
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
																		 <img src="//192.168.0.187/itemPhoto/<%=rMap.get("PHOTO_NAME") %>">
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
											<span class="mb_view">입찰<strong><%=rMap.get("BID_COUNT") %>건</strong></span>
											<span class="mb_btns">
												<a href="#null" ><img src="/images/integ/20151029_08.png"></a>
												<a href="#null" ><img src="/images/integ/20151029_09.png"></a>
												<a href="#null" ><img src="/images/integ/magnifier.png"></a>
											</span>
										</li>
										<li class="sana_txt" style="width: 182px; word-wrap: break-word">
											<a href="#" id="title_0" target="_blank"><%=rMap.get("PRODUCT_DETAIL") %></a>
										</li>
										<li class="sana_nowprice"></li>
										<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
										<li>현재 구매가 : <%=rMap.get("FINAL_PRICE") %>원</li>
										<li class="sana_saler">
												판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
												남은시간 : <%=rMap.get("AUCT_ENDDATE") %>
										</li>
									</ul>
								</div>
							</li>
<%
							}//end of else for
						}//end of else
%>
						</span>
					</ul>
<%
					}//end of preFor
				}//end of preif
				else{
%>
	            <tr>
	               <td height="200" colspan="11">상품이 존재 하지 않습니다.</td>
	            </tr>
<%
				}//end of else
%>
					<!-- 줄사이에 간격주는거 -->
					<div style="height: 30px;"></div>
				</div>
				<!-- 페이지네이션 -->
			   <li class="paging"><table border="0" cellpadding="0"
			         cellspacing="0" class="paging_comm" align="center"
			         style="margin: 0 auto;">
			         <tbody>
			            <tr>
			               <td>
<%
								   //pagePath = "/product/itemStatusSeedList.sf?";
								   String pagePath1 = "javascript:itemStatusAuctionList(";
								   PageBar pb1 = new PageBar(numPerPage1,totalsize1,nowPage1,pagePath1);
								   String pagination1 = pb1.getPageBar1();
								   out.print(pagination1);
%>
			            </tr>
			         </tbody>
			      </table>
			      </li>
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