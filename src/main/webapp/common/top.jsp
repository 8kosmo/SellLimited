<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통부분 - Top</title>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
   String mem_name = null;
   String nowBalance = null;
   String mem_id = null;
    if (session.getAttribute("mem_name") == null 
          ||session.getAttribute("nowBalance") == null) {
    }else{
        mem_name = (String)session.getAttribute("mem_name");
        nowBalance = (String)session.getAttribute("nowBalance");
        mem_id = (String)session.getAttribute("mem_id");
    }
%>

<script type="text/javascript">
   var mem_name = '<%=mem_name%>';
   var nowBalance = '<%=nowBalance%>';
   $(document).ready(function(){
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
</script>
</head>
<body>
<!-- top은 페이지 맨 위에 로그인, 회원가입 등 있는 하얀 부분 , top의 css에 하단에 보라색 줄그어진거 그려져있음.-->
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
         <a href="#" style="margin-right:500px"><%="현재 보유 캐시 : "+nowBalance %></a>
         <a href="#" onclick="logout()">로그아웃</a><span>|</span>
         <a href="#"><strong>마이페이지</strong></a><span>|</span>
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
   <li class="logopart_left"><a href="/testview/mainView.jsp"><img src="/images/logo.png"></a></li>
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
      <a href="/product/productList.sf?keyword=패션"><span>패션</span></a>
      <a href="/product/productList.sf?keyword=카메라"><span>카메라</span></a>
      <a href="/product/productList.sf?keyword=악기"><span>악기</span></a>
      <a href="/product/productList.sf?keyword=키덜트"><span>키덜트</span></a>
      <a href="/product/productList.sf?keyword=연예인굿즈"><span>연예인 굿즈</span></a>
      <a href="/product/productList.sf?keyword=골동품"><span>골동품</span></a>
      <a href="/product/productList.sf?keyword=게임"><span>게임</span></a>
      <a href="/product/productList.sf?keyword=음반"><span>음반</span></a>
   </li>
</ul>
</div><!-- end of div top -->
<!-- 소분류 부분 -->
<div id="main_navi">
   <ul>
      <li style="margin-left:10px;">
         <a href="/product/productList.sf?sub_category_code=0101">신발</a>
         <a href="/product/productList.sf?sub_category_code=0102">모자</a>
         <a href="/product/productList.sf?sub_category_code=0103">시계</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0201">필름카메라</a>
         <a href="/product/productList.sf?sub_category_code=0202">DSLR</a>
         <a href="/product/productList.sf?sub_category_code=0203">미러리스</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0301">바이올린</a>
         <a href="/product/productList.sf?sub_category_code=0302">피아노</a>
         <a href="/product/productList.sf?sub_category_code=0303">일렉 기타</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0401">피규어</a>
         <a href="/product/productList.sf?sub_category_code=0402">프라모델</a>
         <a href="/product/productList.sf?sub_category_code=0403">만화책</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0501">사인물품</a>
         <a href="/product/productList.sf?sub_category_code=0502">애장품</a>
         <a href="/product/productList.sf?sub_category_code=0503">기타</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0601">동전</a>
         <a href="/product/productList.sf?sub_category_code=0602">우표</a>
         <a href="/product/productList.sf?sub_category_code=0603">기타</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0701">게임기</a>
         <a href="/product/productList.sf?sub_category_code=0702">게임팩</a>
         <a href="/product/productList.sf?sub_category_code=0703">기타</a>
      </li>
      <li>
         <a href="/product/productList.sf?sub_category_code=0801">국내</a>
         <a href="/product/productList.sf?sub_category_code=0802">해외</a>
         <a href="/product/productList.sf?sub_category_code=0803">기타</a>
      </li>
   </ul>   
</div><!-- end of main_navi -->
</body>
</html>