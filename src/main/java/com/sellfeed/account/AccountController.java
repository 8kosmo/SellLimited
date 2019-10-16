package com.sellfeed.account;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/account")
public class AccountController {
   
   Logger logger = LoggerFactory.getLogger(AccountController.class);
   
   @Autowired
   public AccountLogic accountLogic = null;
   
   @GetMapping(value="/accountList.sf")
   public String accountList(@RequestParam Map<String, Object> pMap) {
      logger.info("==========>accountList 호출 성공");
      List<Map<String,Object>> rList = null;
      rList=accountLogic.accountList(pMap);
      return "redirect:../index.jsp";
   }
   
   @GetMapping(value="/accountIns.sf")
   public String accountIns(@RequestParam Map<String, Object> pMap) {
      logger.info("==========>accountIns 호출 성공");
      accountLogic.accountIns(pMap);
      return "redirect:../index.jsp";
   }
   
   @GetMapping(value="/accountDel.sf")
   public String accountDel(@RequestParam Map<String, Object> pMap) {
      logger.info("==========>accountDel 호출 성공");
      accountLogic.accountHidden(pMap);
      return "redirect:../index.jsp";
   }
   @GetMapping(value="/accountStatusList.sf")
   public String accountStatusList(Model mod) {
      logger.info("=========> accountStatusList 호출 성공");
      List<Map<String,Object>> accountStatusList = new ArrayList<>();
      accountStatusList = accountLogic.accountStatusList();
      mod.addAttribute("accountStatusList",accountStatusList);
      for(int i=0;i<accountStatusList.size();i++) {
         logger.info("##############################################");
         logger.info("#######################"+accountStatusList.get(i));
         logger.info("##############################################");
      }
      return "forward:/testview/managerPermissionAcct.jsp";
   }
   
   @PostMapping(value="/accountCharge.sf")
   public String accoutnCharge(@RequestParam Map<String, Object> pMap,Model mod) {
      logger.info("==========>aaccountCharge 호출 성공!~~~~~~~~");
      int result = 0;
      result = accountLogic.accountCharge(pMap);
//      mod.addAllAttributes(); cashChargeOk.jsp의 입금액, 입금기한칸에 들어갈 값||   입금액, 현재시간 +3일정도면 될듯
      if(result==1) {
    	 mod.addAttribute("rMap",pMap);
         return "forward:/testview/cashChargeOK.jsp";   //성공시에 1, cashChargeOK.jsp로 이동합니다~~~
      }else {
         return "";
      }
   }
   
   //관리자 충전 승인
   @GetMapping(value="/managerPermissionAcct.sf")
   public String managerPermissionAccount(@RequestParam Map<String, Object> pMap, @RequestParam("charge_code") String charge_code) {
      logger.info("managerPermissionAccount 호출 성공");
      int nowPage = 0;
      int pageSize = 0;
      if(pMap.get("nowPage")!=null) {
            nowPage = Integer.parseInt(pMap.get("nowPage").toString());
       }
       if(pMap.get("pageSize")!=null) {
           pageSize = Integer.parseInt(pMap.get("pageSize").toString());
       }
      logger.info("nowPage :"+nowPage);
      logger.info("pageSize :"+pageSize);
      pMap.put("nowPage",nowPage);
      pMap.put("pageSize",pageSize);
      pMap.put("trade","입금");
      pMap.put("trade_detail","충전");
      pMap.put("trade_target","sellLimited");
      accountLogic.managerPermissionAccount(charge_code,pMap);
      return"redirect:../account/accountStatusList.sf";
   }
   //관리자 승인 거절
   @GetMapping(value="/managerRefuseAcct.sf")
   public String managerRefuseAcct(@RequestParam("charge_code") String charge_code) {
      logger.info("managerPermissionAccount 호출 성공");
      accountLogic.managerRefuseAcct(charge_code);
      return"redirect:../account/accountStatusList.sf";
   }
	//경매종료 , 수취확인
   @GetMapping(value="/auctionConfirm.sf")
   public String auctionConfirm(@RequestParam Map<String, Object> pMap) {
	    String mem_id = null;
	    if(pMap.get("mem_id")!=null) {
	    	mem_id = pMap.get("mem_id").toString();
	    }
	    String bid_code = null;
	    if(pMap.get("bid_code")!=null) {
	    	bid_code = pMap.get("bid_code").toString();
	    }
	    accountLogic.auctionConfirm(pMap);
	    return "redirect:../product/productDelivery.sf?mem_id="+mem_id;
   }
}