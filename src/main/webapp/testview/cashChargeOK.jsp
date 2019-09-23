<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전완료</title>
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
                  <p>아이디 : <span class="mttid">ds0110818</span><br>
                     보유캐시 : <span class="mttcash"><a href="/mypage/cash_list">0 원</a></span>
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
      <li style="margin-bottom:20px">
      	<form action="#" name="order_frm" id="order_frm" method="post" accept-charset="utf-8">
      		<table class="mypage_table_head">
				<caption>
					캐시충전 <img src="/images/integ/20150918_10.png"> 
					<span class="mth_left">캐시충전 가상계좌 발행이 완료 되었습니다.</span><span class="mth_right"></span>
				</caption>
			</table>
			<table class="order_settle_table_body" style="border-top:1px solid #C6C6C6;">
				<colgroup>
					<col width="72.3%;" />
					<col width="27.7%;" />
				</colgroup>
				<tr>
					<td>
						<table class="rebill_table">
							<colgroup>
								<col width="20%;" />
								<col width="" />
							</colgroup>
							<tr>
								<th>입금 은행</th>
								<td>농협은행</td>
							</tr>
							<tr>
								<th>입금 계좌번호</th>
								<td>7900156513215</td>
							</tr>
							<tr>
								<th>입금액</th>
								<td>10,000 원</td>
							</tr>
							<tr>
								<th>예금주</th>
								<td>(주)SellLimited</td>
							</tr>
							<tr>
								<th>입금기한</th>
								<td>2019-09-27 11:03:09 까지</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
      	</form>
      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>