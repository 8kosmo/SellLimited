<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/cssJs.jsp" %>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	String mem_name = null;
	String nowBalance = null;
    if (session.getAttribute("mem_name") == null 
    		||session.getAttribute("nowBalance") == null) {
    }else{
    	 mem_name = (String)session.getAttribute("mem_name");
    	 nowBalance = (String)session.getAttribute("nowBalance");
    }
%>

<script>
	var mem_name = '<%=mem_name%>';
	var nowBalance = '<%=nowBalance%>';
	$(document).ready(function(){
		//로그인 실패시
		if(mem_name=='null'){
			$("#logout").hide();
			$("#login").show();
		}else{
			$("#login").hide();
			$("#logout").show();
		}
	})
		function logout(){
<%
			session.removeAttribute("mem_name");
			session.removeAttribute("nowBalance");
%>
			location.href="/testview/commonView.jsp";	
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
			<a href="/testview/mainView.jsp" onclick="logout()">로그아웃</a><span>|</span>
			<a href="#"><strong>마이페이지</strong></a><span>|</span>
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
						<td class="ott_left"><img src="/images/integ/20150930_03.png"></td>
						<td class="ott_right">회원가입
							<p>SellLimited의 다양한 혜택과 회원서비스를 누리십시오.<span><img src="/images/integ/20150930_06.png"></span></p>
						</td>
					</tr>
				</table>
			</li>
			<li>
				<table class="welcome_table">
					<tr>
						<td class="wt_txt">SellLimited 회원가입이 완료되었습니다!<p>SellLimited 회원만이 누릴 수 있는 다양한 혜택과 서비스로 즐거운 쇼핑 되시길 바랍니다.</p></td>
					</tr>
					<tr>
						<td class="wt_tic">
						    <div class="disticket">&nbsp;SellLimited 신규가입<p>5,000원 <strong>할인쿠폰</strong></p><!--<button type="submit" class="gameone">쿠폰받기</button> --><span>&nbsp;(유효기간 1개월)</span></div>
						</td>
					</tr>
					<tr>
						<td class="mem_enter"><button type="button" class="camerun" onclick="location.href='/testview/login.jsp'" style="cursor:pointer">로그인 하기</button></td>
					</tr>
				</table>
				
			</li>
		</ul>
</div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>