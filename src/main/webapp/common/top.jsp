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
    if (session.getAttribute("mem_name") == null 
    		||session.getAttribute("nowBalance") == null) {
    }else{
    	 mem_name = (String)session.getAttribute("mem_name");
    	 nowBalance = (String)session.getAttribute("nowBalance");
    }
%>

<script type="text/javascript">
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
<!-- 소분류 부분 -->
<div id="main_navi">
	<ul>
		<li style="margin-left:10px;">
			<a href="#">신발</a>
			<a href="#">모자</a>
			<a href="#">시계</a>
		</li>
		<li>
			<a href="#">필름카메라</a>
			<a href="#">DSLR</a>
			<a href="#">미러리스</a>
		</li>
		<li>
			<a href="#">바이올린</a>
			<a href="#">피아노</a>
			<a href="#">일렉 기타</a>
		</li>
		<li>
			<a href="#">피규어</a>
			<a href="#">프라모델</a>
			<a href="#">만화책</a>
		</li>
		<li>
			<a href="#">사인물품</a>
			<a href="#">애장품</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">동전</a>
			<a href="#">우표</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">게임기</a>
			<a href="#">게임팩</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">국내</a>
			<a href="#">해외</a>
			<a href="#">기타</a>
		</li>
	</ul>	
</div><!-- end of main_navi -->
</body>
</html>