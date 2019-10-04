<%@page import="java.awt.print.Printable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.sellfeed.util.PageBar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<Map<String,Object>> acctStatusList = 
         (List<Map<String,Object>>)request.getAttribute("accountStatusList");
   int size = 0;
   int nowPage = 0;
   if(acctStatusList != null && acctStatusList.size()>0){
      size = acctStatusList.size();
   }  
    
   
/*    if(itemStatusList != null){
      out.print(itemStatusList.get(0).get("MEM_ID"));
   } */

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>관리자페이지</title>
<%@ include file="/common/cssJs.jsp" %>
<script>
	function charge(){
		$.ajax
		
	}

</script>
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
               <td class="mtt_center">관리자 페이지
                  <p>닉네임 : <span class="mttid"><%=mem_name %></span></p>
               </td>
            </tr></tbody>
         </table>
      </li>
<!-- 나중에 관리자 페이지에서 관리 목록이 생기면 추가할 카테고리 -->
<!--       <li>
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
      </li> -->
        <li>
      <table class="mypage_table_head">
         <caption>충전 대기 회원 목록 <img src="/images/integ/20150918_10.png"> 
            <span class="mth_left">총 <strong><%=size %></strong> 건의 자료가 조회되었습니다.</span>
            <span class="mth_right">
               <form action="#" accept-charset="utf-8" method="get" id="frm" name="frm">
                  <div id="select_boxview">
                     <label for="color">30개씩 보기</label>
                     <select name="search_limit" title="select color">
                        <option value="30" selected="selected">30개씩 보기</option>
                        <option value="50">50개씩 보기</option>
                        <option value="100">100개씩 보기</option>
                     </select>
                  </div>
               </form>
            </span>
         </caption>
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
         <tbody>
            <tr>
               <td>충전코드</td>
               <td>아이디</td>
               <td>충전금액</td>
               <td>입금은행</td>
               <td>계좌번호</td>
               <td>신청일자</td>
               <td>입금일자</td>
               <td>처리일자</td>
               <td>상태</td>
               <td>승인</td>
               <td>거절</td>
            </tr>
      </table>
<%
   if(size > 0){
      
%>
       <table class="mypage_table">
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
<%
      for(int i=0;i<size;i++){
         Map<String,Object> rMap = acctStatusList.get(i);
%>
            <tr>
               
               <td><%=rMap.get("CHARGE_CODE") %></td>
               <td><%=rMap.get("MEM_ID") %></td>
               <td><%=rMap.get("TRADE_AMMOUNT") %></td>
               <td><%=rMap.get("USER_BANK") %></td>
               <td><%=rMap.get("ACCT_NUMBER") %></td>
               <td><%=rMap.get("APPLY_DATE") %></td>
               <td><%=rMap.get("DEPOSIT_DATE") %></td>
               <td><%=rMap.get("APPROVAL_DATE") %></td>
               <td><%=rMap.get("STATUS") %></td>
               <td><a href="/account/managerPermissionAcct.sf?charge_code=<%=rMap.get("CHARGE_CODE") %>&mem_id=<%=rMap.get("MEM_ID") %>&trade_ammount=<%=rMap.get("TRADE_AMMOUNT") %>">
               <button type="button">충전승인</button></a></td>
               <td><a href="/account/managerRefuseAcct.sf?charge_code=<%=rMap.get("CHARGE_CODE") %>"><button type="button">충전거절</button></a></td>
            </tr>
<%
      }
%>
         </tbody>
      </table>
     
<%
   } else{
%>
       <table class="mypage_table">
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
            <col width="">
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
         <tbody>
            <tr>
               <td height="200" colspan="11">관리자의 승인 대기 중 상품이 존재 하지 않습니다.</td>
            </tr>
         </tbody>
      </table>
   </li>
<%
   }
%>
   <li class="paging"><table border="0" cellpadding="0"
         cellspacing="0" class="paging_comm" align="center"
         style="margin: 0 auto;">
         <tbody>
            <tr>
               <td>
<%
                  String pagePath = "#";
                  PageBar pb = new PageBar(10,size,nowPage,pagePath);
                  String pagination = pb.getPageBar();
                  out.print(pagination);
%>
            </tr>
         </tbody>
      </table>
      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>