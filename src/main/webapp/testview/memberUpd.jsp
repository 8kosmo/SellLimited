<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.StringTokenizer" %>
<%
	Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
	String MEM_BDATE = rMap.get("MEM_BDATE").toString();
	StringTokenizer st = new StringTokenizer(MEM_BDATE,"/");
	String YY = st.nextToken();
	String MM = st.nextToken();
	String DD = st.nextToken();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<div id="mypage">
   <ul class="mypage_title">
      <li>
         <table class="mypage_title_table">
            <colgroup>
               <col width="110px;">
               <col width="">
               <col width="260px;">
            </colgroup>
            <tbody><tr>
               <td class="mtt_left"><img src="/images/integ/20150918_01.png"></td>
               <td class="mtt_center">마이페이지
                 <p>아이디 : <span class="mttid"><%=mem_id%></span><br>
                     보유캐시 : <span class="mttcash"><a href="/mypage/cash_list"><%=nowBalance%> 원</a></span>
                  </p>
               </td>
               <td class="mtt_right" align="center">
                  <a href="/testview/cashCharge.jsp"><button type="button" class="juliet"><img src="/images/integ/20150918_03.png">캐시충전</button></a>
               </td>
            </tr></tbody>
         </table>
      </li>
      <li>
         <table class="mypage_category">
            <colgroup>
            <col width="20%;">
            <col width="20%;">
            <col width="20%">
            <col width="20%;">
            <col width="">
            </colgroup>
            <tbody><tr>
               <td>회원관리
                  <p><a href="/testview/memberUpd.jsp">회원 정보수정</a><br>
                     <a href="/testview/memberDel.jsp">회원 탈퇴</a><br>
                     <a href="/testview/AccountList.jsp">계좌 거래내역</a><br>
                  </p>
               </td>
               <td>관심목록
                  <p><a href="/testview/favSeller.jsp">관심 회원 목록</a><br>
                     <a href="/testview/favProduct.jsp">관심 상품 목록</a><br>
                  </p>
               </td>
               <td>내 상품관리
                  <p><a href="/testview/ProductIns.jsp">상품 등록</a><br>
                     <a href="/testview/readyProductList.jsp">승인 대기 상품</a><br>
                     <a href="/testview/seedInsProduct.jsp">시드 모집 상품</a><br>
                     <a href="/testview/auctionInsProduct.jsp">경매 진행 상품</a><br>
               </td>
               <td>참여 상품목록
                  <p><a href="/testview/seedImIn.jsp">시드 참여 상품</a><br>
                     <a href="/testview/auctionImIn.jsp">경매 참여 상품</a><br>
                     <a href="/testview/productDelivery.jsp">상품 배송 정보</a></p>
               </td>
               <td>고객센터
                  <p><a href="/testview/notice.jsp">공 지 사 항</a><br>
                     <a href="/testview/FAQ.jsp">FAQ(자주하는 질문)</a><br>
                     <a href="/testview/QNA.jsp">1:1 문의게시판</a><br>
               </td>
            </tr></tbody>
         </table>
      </li>
      <!-- 공통부분 끝 -->
      <form action="#" accept-charset="utf-8" id="memberUpdForm" name="memberUpdForm" method="post">
      <li>
      	<table class="mypage_table_head">
      		<caption>
      			회원 정보수정 <img src="/images/integ/20150918_10.png">
      			<p>안녕하세요! 한정판 물품 경매대행 공식사이트 SellLimited 입니다.<br>
				SellLimited는 회원님의 개인정보를 신중하게 보호하려 노력하고 있으며, 회원님의 동의없이 정보가 유출되지 않습니다. 자세한 내용은 '개인정보취급방침'에서 확인해 주십시오.</p>
      		</caption>
      	</table>
      	<table class="indiv_table">
      		<colgroup>
				<col width="20%;" />
				<col width="" />
			</colgroup>
			<tr>
				<th>아이디</th>
				<td style="height:25px;"><%=mem_id%></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="input_name" name="password" id="password" value="<%=rMap.get("MEM_PASSWORD")%>">
					<img src="/images/join/lock_1.gif" id="pw_chk_img1" class="q">
					<!-- 6~20자사이의 비밀번호 안치면 나오는부분 -->
					<div class="reg_notice"  id="notice_password" style="color:#929292;font-size:11px;">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" class="input_name" name="password_confirm" id="password_confirm">
					<img src="/images/join/unlock_1.gif" id="pw_chk_img2" class="q">
					<!-- 비밀번호 일치하지 않으면 나오는 부분 -->
					<div class="reg_notice"  id="notice_confirm_password" style="color:#929292;font-size:11px;">
					</div>	
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:15px;padding:0;"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="input_name" name="realname" value="<%=mem_name%>"  maxlength="30">&nbsp;<span id="notice_name"></span></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="input_name" name="nickname" value="<%=rMap.get("MEM_NICKNAME")%>"  maxlength="30"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="1" checked=""> 남<input type="radio" style="margin-left:20px;" name="gender" value="2" > 여</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<span class="info_input2">
						<input type="text" name="birth_year" id="birth_year" class="input_name" style="width:60px" maxlength="4" onkeydown="return showKeyCode(event)" value="<%=YY %>" readonly>
						년
					</span>
					<span class="info_input3">
						<input type="text" name="birth_month" id="birth_month" class="input_name" style="width:40px" maxlength="2" onkeydown="return showKeyCode(event)" value="<%=MM %>" readonly>
						월
					</span>
					<span class="info_input3">
						<input type="text" name="birth_days" id="birth_days" class="input_name" style="width:40px" maxlength="2" onkeydown="return showKeyCode(event)" value="<%=DD %>" readonly>
						일
					</span>
					<div class="reg_notice" id="bir_notice" style="color:#929292;font-size:11px;"></div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" class="input_email" name="email" id="email" value="<%=rMap.get("MEM_EMAIL") %>" style="ime-mode:disabled;width:200px" maxlength="100" onblur="chk_email2()">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:15px;padding:0;"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" class="input_add" name="zipcode" id="zipcode" readonly="readonly" value="">&nbsp;	<button type="button" class="btn_addno" onclick="goPopup()">우편번호 찾기</button>
					<br>
					<input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address" id="address" value="" readonly="readonly">
					<br>
					<input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address_detail" id="address_detail" value="">
				</td>
			</tr>
			<tr>
				<th>휴대전화번호</th>
				<td>
					<input type="text" class="input_name" placeholder="- 없이 입력" name="mobile" id="mobile" style="ime-mode:disabled;"  onkeydown="return showKeyCode(event)" maxlength="12" value="<%=rMap.get("MEM_PHONE")%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="austria"><button type="submit" class="btn_luxemberg" style="cursor:pointer">회원정보수정</button><button type="button" class="btn_rome" onclick="history.go(-1)" style="cursor:pointer">취소</button></td>
			</tr>
      	</table>
      </li>
      </form>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>