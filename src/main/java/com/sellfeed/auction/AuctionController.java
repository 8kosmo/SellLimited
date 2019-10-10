package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sellfeed.product.ProductLogic;


@Controller
@RequestMapping(value="/auction")
public class AuctionController {
	Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	public ProductLogic productLogic = null;
	@Autowired
	public AuctionLogic auctionLogic = null;
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
	public String AuctionningPage(String bid_code, Model mod) {
		Map<String,Object> pMap = new HashMap<>();
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> detailList = new ArrayList<>();
		List<String> photoNameList = new ArrayList<>();
		List<Map<String,Object>> seedList = new  ArrayList<>();
		pMap.put("bid_code",bid_code);
		detailList = productLogic.auctionDetail(pMap);
          logger.info("_________________________________"+detailList);
          for(int i=0; i<detailList.size();i++) {
             rMap = detailList.get(i);
             photoNameList.add(rMap.get("PHOTO_NAME").toString());
             logger.info(")"+i+i+i+")))))))))))))))))))))))))))))"+photoNameList);
          }
          rMap.put("PHOTO_NAME",photoNameList);
          logger.info("rMap==  "+rMap+"||| photoNameList== "+rMap.get("PHOTO_NAME"));
		mod.addAttribute("rMap",rMap);
		return "forward:/testview/auctioningPage.jsp";
	}

}
