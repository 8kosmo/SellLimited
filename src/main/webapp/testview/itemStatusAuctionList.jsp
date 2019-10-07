<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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