package com.sellfeed.aucProc;

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
@RequestMapping(value="/aucProc")
public class AucProcController {
	Logger logger = LoggerFactory.getLogger(AucProcController.class);
	@Autowired
	public AucProcLogic aucProcLogic = null;
	@GetMapping("/auctionList.sf")
	public String auctionList(@RequestParam Map<String,Object> pMap , Model model) {
		logger.info("Controller| auctionList 호출성공");
		List<Map<String,Object>> auctionList = null;
		auctionList = aucProcLogic.auctionList(pMap);
		if(auctionList!=null&&auctionList.size()>1) {
			return null;
		}
		else {
			return null;
			
		}
	}
}
