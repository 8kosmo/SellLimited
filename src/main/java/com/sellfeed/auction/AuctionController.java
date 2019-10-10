package com.sellfeed.auction;

import java.util.ArrayList;
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


@Controller
@RequestMapping(value="/auction")
public class AuctionController {
	Logger logger = LoggerFactory.getLogger(AuctionController.class);
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

}
