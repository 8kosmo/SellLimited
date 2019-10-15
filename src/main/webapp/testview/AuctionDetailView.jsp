<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List" %>
<%@ page import="java.util.StringTokenizer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<%@ include file="/common/cssJs.jsp" %>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	String mem_name = null;
	int nowBalance = 0;
	String mem_id = null;
	String acct_number = null;
	 if (session.getAttribute("mem_name") == null 
	       ||session.getAttribute("nowBalance") == null) {
	 }else{
	     mem_name = (String)session.getAttribute("mem_name");
	     nowBalance = (int)session.getAttribute("nowBalance");
	     mem_id = (String)session.getAttribute("mem_id");
	     acct_number = (String)session.getAttribute("acct_number");
	 }
    
   int size = 0;
   Map<String,Object> rMap = 
         (Map<String,Object>)request.getAttribute("rMap");
   List<String> photoNameList = (List<String>)rMap.get("PHOTO_NAME");
   request.setAttribute("photoList", photoNameList);

   //_______________________________________________타임
   String T_EndTime = rMap.get("AUCT_ENDDATE").toString();

   StringTokenizer st = new StringTokenizer(T_EndTime,"/");
   String YY = st.nextToken();
   String MM = st.nextToken();
   String DD = st.nextToken();
   String HH = st.nextToken();
   String MI = st.nextToken();
   String SS = st.nextToken();
   
   String photoName  = "";
   String onclickSub = "";
   String img_id     ="";
%>
<script>
$(document).ready(function(){
<%   for(int i=0; i<photoNameList.size();i++){
   photoName = photoNameList.get(i).toString();
   onclickSub = "clickSub"+i+"()";
   img_id = "sub_img"+i;
      if(i==0){   
%>
      document.getElementById("d_big_img").innerHTML = '<img id="big_img" src="/itemPhoto/<%=photoName%>">';
<%      }else{
%>
         document.getElementById("d_small_img").innerHTML =
            "<span><a onclick='javascript:<%=onclickSub%>'><img id='<%=img_id%>' src='/itemPhoto/<%=photoName%>'> </a></span>"
<%   }      
}%>   //__________________________________________________________________end of for

	var mem_name = '<%=mem_name%>';
	var nowBalance = '<%=nowBalance%>';

	//로그인 실패시
	if(mem_name=='null'){
	    $("#login").show();
	    $("#logout").hide();
	    $("#managerLogout").hide();
	 }else if(mem_name=='관리자'){
	    $("#login").hide();
	    $("#logout").hide();
	    $("#managerLogout").show();
	 }else {
	    $("#login").hide();
	    $("#logout").show();
	    $("#managerLogout").hide();
	 }
	});
	 function logout(){
	    location.href="/common/sessionDel.jsp";   
	}

//_______________________________________________________________________end of ready

//_________________________________________타임
function getTime() {
	now = new Date();
	dday = new Date(<%=YY%>,<%=MM%>-1,<%=DD%>,<%=HH%>,<%=MI%>,<%=SS%>); // 원하는 날짜, 시간 정확하게 초단위까지 기입.
	days = (dday - now) / 1000 / 60 / 60 / 24;
	daysRound = Math.floor(days);
	hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound);
	hoursRound = Math.floor(hours);
	minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
	minutesRound = Math.floor(minutes);
	seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
	secondsRound = Math.round(seconds);
	
	if(daysRound==-1 && hoursRound == 23 && minutesRound == 59 && secondsRound == 59){
		alert("경매가 종료 되었습니다.");
		location.href="/testview/mainView.jsp";
	}
	
	document.getElementById("counter0").innerHTML = daysRound;
	document.getElementById("counter1").innerHTML = hoursRound;
	document.getElementById("counter2").innerHTML = minutesRound;
	document.getElementById("counter3").innerHTML = secondsRound;
	newtime = window.setTimeout("getTime();", 1000);

   }

 
   
   function clickSub1(){
      var big_img = document.getElementById("big_img");
      var sub_img1 = document.getElementById("sub_img1");
      
      var big_img_src= $("#big_img").attr('src');
      var sub_img1_src= $("#sub_img1").attr('src');
      
      big_img.src=sub_img1_src;
      sub_img1.src=big_img_src;
   }
   function clickSub2(){
      var big_img = document.getElementById("big_img");
      var sub_img2 = document.getElementById("sub_img2");
   
      var big_img_src= $("#big_img").attr('src');
      var sub_img2_src= $("#sub_img2").attr('src');
      
      big_img.src=sub_img2_src;
      sub_img2.src=big_img_src;
   }
   function addFavSeller(){
      $.ajax({
          method:'GET'
         ,url:'/rest/favSellerAdd.sf?fav_sellerid=<%=rMap.get("MEM_ID")%>&mem_id=<%=mem_id%>'
         ,data:'data'
         ,success:function(data){
            alert(data);
         }      
      });
      };
    function addFavProduct(){
 	   loginSessionCheck();
 		$.ajax({
 			 method:'GET'
 			,url:'/rest/favProductAdd.sf?fav_bidcode=<%=rMap.get("BID_CODE")%>&mem_id=<%=mem_id%>'
 			,data:'data'
 			,success:function(data){
 				alert(data);
 			}		
 		});
 	   };
    function loginSessionCheck(){
 	   <%		
 	   		if(mem_id==null){	
 	   %>
 	   			alert("로그인이 필요합니다");
 	   			location.href="/testview/login.jsp";
 	   <%
 	   		}
 	   %>
 	      }
    
    function auctionStart(){
    
 	   loginSessionCheck();
        $.ajax({
              method:'GET'
             ,url:'/rest/seedOverlapCheck.sf?bidders_id=<%=mem_id%>&bid_code=<%=rMap.get("BID_CODE")%>'
             ,data:'data'
             ,success:function(result){
                if(result=='0'){
                   alert("경매 가즈아");
                   window.open('/auction/AuctionningPage.sf?bid_code=<%=rMap.get("BID_CODE")%>'
                		   ,'경매진행중','width=1200,height=900,fullscreen=no');
                }else if(result=='1'){
                   alert("시드를 발급받지 않은 상품입니다");
                }
             }      
          });
    } 
    function total_search() {
        var searchWord = $("#SearchWord").val();
        if(searchWord == ''){
          alert('검색 할 상품을 입력 해주세요');
          $("#SearchWord").focus();
          return false;
        }else{           
           location.href="/product/productList.sf?keyword="+searchWord;
        }
   }

</script>
</head>
<body>

<div id="top" align="center">
<!-- head -->
<ul class="head">
   <li class="head_txt" style="width: auto; float: right;">
      <div id="login" style="display:inline;">
         <a href="/testview/login.jsp" onclick="">로그인</a><span>|</span>
         <a href="/testview/memberIns.jsp"><strong>회원가입</strong></a><span>|</span>
      </div>
      <div id="logout" style="display:inline;">
         <a href="#"><%= mem_name+"님 환영합니다." %></a><span>|</span>
         <a href="#" style="margin-right:450px"><%="현재 보유 캐시 : "+nowBalance %></a>
         <a href="#" onclick="logout()">로그아웃</a><span>|</span>
         <a href="/testview/myPage.jsp"><strong>마이페이지</strong></a><span>|</span>
      </div>
      <div id="managerLogout" style="display:inline;">
         <a href="#"><%= mem_name+"님 환영합니다." %></a><span>|</span>
         <a href="#" style="margin-right:500px">&nbsp</a>
         <a href="#" onclick="logout()">로그아웃</a><span>|</span>
         <a href="/product/itemStatusList.sf"><strong>관리페이지</strong></a><span>|</span>
      </div>
      <a href="/testview/howToUse.jsp">이용안내</a><span>|</span>
      <div class="layer_add2">
         <a href="#">고객센터</a>
         <ul class="list_layer2">
               <li><a href="/testview/notice.jsp">공지사항</a></li>
               <li><a href="/testview/QNA.jsp">1:1문의</a></li>
               <li><a href="/testview/FAQ.jsp">FAQ</a></li>
         </ul>
         </div>
   </li>  
</ul>
<!-- 로고,검색창,검색버튼 있는부분 -->
<ul class="logopart">
   <!-- 로고있는부분 -->
   <li class="logopart_left"><a href="/testview/mainView.jsp"><img src="/images/logo.png"></a></li>
   <!-- 검색창있는부분 -->
   <li class="logopart_center">
      <span class="searchbox_form">
         <!-- 검색창 -->
         <input type="text" class="input_search" name="SearchWord" id="SearchWord" value="" onkeydown="javascript: if (event.keyCode == 13) { total_search();return false; }">
      </span>
      <!-- 검색버튼 -->
      <span><a href="javascript:total_search()"><img src="/images/japanstyle_files/20160926_07.png"></a></span>
   </li>
   <!-- 검색창 오른쪽 광고배너 -->
   <li class="logopart_right"><a href="#"><img src="/images/japanstyle_files/20181113_01.png"></a></li>
</ul>
<!-- 대분류  -->
<ul class="gnb">
   <li class="gnb_left">
      <a href="/product/productList.sf?sub_category=패션"><span>패션</span></a>
      <a href="/product/productList.sf?sub_category=카메라"><span>카메라</span></a>
      <a href="/product/productList.sf?sub_category=악기"><span>악기</span></a>
      <a href="/product/productList.sf?sub_category=키덜트"><span>키덜트</span></a>
      <a href="/product/productList.sf?sub_category=연예인굿즈"><span>연예인 굿즈</span></a>
      <a href="/product/productList.sf?sub_category=골동품"><span>골동품</span></a>
      <a href="/product/productList.sf?sub_category=게임"><span>게임</span></a>
      <a href="/product/productList.sf?sub_category=음반"><span>음반</span></a>
   </li>
</ul>
</div><!-- end of div top -->
<!-- 디테일뷰 시작 전체폼-->
<div id="mypage">
   <form action="#" id="detail_frm" method="post" accept-charset="utf-8">
      <div id="dv">
         <ul class="dv_title" style="margin-top:20px;">
            <!-- 경매 등록 타이틀 -->
            <li class="dv_title_left" id="trans_after_subject">
               <p style="font-size:25px"> <%=rMap.get("BID_TITLE")%> </p>
            </li>
            <!-- 경매상품ID : ITEM_CODE -->
            <li class="dv_title_right" style="height:40px;">
               <p>경매상품ID : <%=rMap.get("ITEM_CODE")%></p>
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
                                 <div class="ditbigthumb" id="d_big_img" onclick="javascript:changePhoto(big_img)">
                                 </div>
                                 <!-- 밑에 조그만한 서브사진 클릭하면 메인되게 하기 -->
                                 <div class="ditsmallthumb" id="d_small_img">
                                 </div>
                              </td>
                           </tr>
                           <tr>
                              <td style="height:200px;">
                                 <div style="position:absolute;bottom:0px;width:100%;">
                                    <!-- 제품상세설명 간단히 적는부분 -->
                                    <span class="ctntxt" style="margin-top:0px">
                                       <strong>제품상세설명</strong>
                                       <br>
                                       <%=rMap.get("PRODUCT_DETAIL")%>
                              <br>
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
                                    <!-- 입찰건수 -->
                                    <p style="font-size:20px; margin-top:5px;"><%=rMap.get("CNTBID")%></p>
                                 </td>
                                 <td>남은시간
             <p style="font-size:20px; margin-top:5px; ">
                  <SPAN id=counter0></SPAN>일+
                  <SPAN id=counter1></SPAN>:<SPAN id=counter2></SPAN>:<SPAN id=counter3></SPAN></p>
                                 </td>
                              </tr>
                           </table>
                        </span>
                        <!-- 시작가격~종료일 나오는 부분 -->
                        <span>
                           <table class="dr_step2">
                              <colgroup>
                                 <col width="105px;" />
                                 <col width="" />
                              </colgroup>
                              <tr>
                                 <th>시작가격<br> 즉시구매가<br> 시작시간<br> 종료일
                                 </th>
                                 <!-- 시작가격 -->
                                 <td><%=rMap.get("START_PRICE")%>원<br> 
                                 <!-- 바로구매가격 -->
                                 <%=rMap.get("BUYNOW_PRICE")%>원<br> 
                                 <!-- 시작시간 -->    
                                     <%=rMap.get("AUCT_STARTDATE")%><br>
                                 <!-- 종료일 -->
                                     <%=rMap.get("AUCT_ENDDATE")%><br>
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
                                 <td class="pprice"><%=rMap.get("START_PRICE")%>원
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2" class="buttonsarray">
                                    <button type="button" class="btn_algerie" onclick="auctionStart()">입찰하기</button>
                                    <button type="button" class="btn_nigeria" onclick="addFavProduct()">관심등록</button>
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
                           <table class="corona" style="margin-top:5px">
                              <colgroup>
                                 <col width="105px;"/>
                                 <col width=""/>
                              </colgroup>
                              <tr>
                                 <th>
                                       브랜드<br> 모델명<br>  수량<br> 반품가능 여부 <br>
                                 </th>
                                 <td>
                                    <span id="brand" name="brand"><%=rMap.get("BRAND")%></span><br>
                                    <span id="model_name" name="model_name"><%=rMap.get("MODEL_NAME")%></span> <br>
                                     1<br>
                                    <span id="trans_after_return_info">반품불가</span><br>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2" style="padding-left: 0;" >
                                   <br>
                                    <strong>출품자정보</strong><br>
                                    <span style="height: 25px; line-height: 25px;">
                                       ID : <a href="#" style="text-decoration: none;">
                                             <span class="corona_id"><%=rMap.get("MEM_ID")%></span>
                                           </a>
                                    </span>&nbsp;&nbsp;
                                    <a href="javascript:addFavSeller()">
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
   <script>getTime()</script>
</body>
</html>
