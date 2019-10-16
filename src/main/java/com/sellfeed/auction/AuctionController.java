package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sellfeed.account.AccountDao;
import com.sellfeed.account.AccountLogic;
import com.sellfeed.aucLog.AucLogLogic;
import com.sellfeed.product.ProductLogic;


@Controller
@RequestMapping(value="/auction")
public class AuctionController {
	Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	public ProductLogic productLogic = null;
	@Autowired
	public AuctionLogic auctionLogic = null;
	@Autowired
	public AccountLogic accountLogic = null;
	@Autowired
	public AucLogLogic aucLogLogic = null;
	@Autowired
	public AccountDao accountDao = null;
	
	@GetMapping("/endAuction.sf")
	public String endAuction(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller|endAuction 호출 성공");
		int result = auctionLogic.endAuction(pMap);
		if (result == 1){
			//구매자 계좌에 INSERT
			logger.info("구매자 INSERT");
			pMap.put("mem_id", pMap.get("bidder_id"));
			pMap.put("trade", "출금");
			pMap.put("trade_target", "SELLIMITED");
			pMap.put("trade_detail", "경매 낙찰");
			Map<String,Object> rMap = new HashMap<>();
			rMap = accountLogic.accountIns(pMap);
			//중간계좌에 INSERT
			logger.info("중간계좌 INSERT");
			pMap.put("mem_id", "manager");
			pMap.put("trade", "입금");
			pMap.put("trade_target", pMap.get("bidder_id"));
			pMap.put("trade_detail", "경매 낙찰");
			accountLogic.accountIns(pMap);
			}
		return "redirect:/auction/endAuctionList.sf";				
	}
	
	@GetMapping(value="/beforeAuctionList.sf")
	public String beforeAuctionList(Model mod){
		logger.info("###########################################{beforeAuctionList호출 성공}");
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionLogic.beforeAuctionList();
		mod.addAttribute("rList",rList);	
		return "forward:/testview/managerAuction.jsp";
	}
	@GetMapping(value="/auctionIns.sf")
	public String auctionIns(@RequestParam Map<String,Object> pMap) {
		logger.info("###########################################{auctionIns호출 성공}");
		logger.info(""+pMap);
		auctionLogic.auctionIns(pMap);
		return "redirect:/auction/beforeAuctionList.sf";
	}
	@GetMapping(value="AuctionningPage.sf")
	public String AuctionningPage(String bid_code, Model mod, HttpSession session) {
		Map<String,Object> pMap = new HashMap<>();
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> detailList = new ArrayList<>();
		List<String> photoNameList = new ArrayList<>();
		List<Map<String,Object>> seedList = new  ArrayList<>();
		pMap.put("bid_code",bid_code);
		pMap.put("mem_id",session.getAttribute("mem_id"));
		logger.info("AuctionningPage paramter : "+pMap);
		detailList = productLogic.auctionDetail(pMap);
		int my_bid = aucLogLogic.myBid(pMap);
          logger.info("detailList: "+detailList);
          for(int i=0; i<detailList.size();i++) {
             rMap = detailList.get(i);
             photoNameList.add(rMap.get("PHOTO_NAME").toString());
             logger.info(")"+i+i+i+")))))))))))))))))))))))))))))"+photoNameList);
          }
          rMap.put("PHOTO_NAME",photoNameList);
          logger.info("rMap==  "+rMap+"||| photoNameList== "+rMap.get("PHOTO_NAME"));
          rMap.put("my_bid",my_bid);
		mod.addAttribute("rMap",rMap);
		return "forward:/testview/auctioningPage.jsp";
	}
	@GetMapping(value="endAuctionList.sf")
	public String endAuctionList(Model mod) {
		logger.info("Controller| endAuctionList 호출 성공");
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionLogic.endAuctionList();
		logger.info("rList"+rList);
		mod.addAttribute("rList",rList);
		return "forward:/testview/managerEndAuction.jsp";
	}
}
