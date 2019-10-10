<%@page import="com.sellfeed.util.PageBar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
///시드참여중 리스트
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
   
%>
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
                                 <a href="#" id="title_0" target="_blank"><%=rMap.get("BID_TITLE") %></a>
                              </li>
                              <li class="sana_nowprice"></li>
                              <li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
                              <li>시드 모집 중</li>
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
                                 <a href="#" id="title_0" target="_blank"><%=rMap.get("BID_TITLE") %></a>
                              </li>
                              <li class="sana_nowprice"></li>
                              <li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
                              <li>시드 모집 중</li>
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