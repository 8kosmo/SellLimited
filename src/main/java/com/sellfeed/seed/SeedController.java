package com.sellfeed.seed;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/seed")
public class SeedController {
	
	Logger logger = LoggerFactory.getLogger(SeedController.class);
	
	@Autowired
	public SeedLogic seedLogic = null;
	
	@GetMapping(value="seedList.sf")
	public String seedList(@RequestParam Map<String,Object> pMap) {
		logger.info("============>seedList 호출 성공");
		
		
		List<Map<String,Object>> rList = null;
		rList =seedLogic.seedList(pMap);
		return "redirect:../index.jsp";
	}
	
	@GetMapping(value="seedIns.sf")
	public String seedIns(@RequestParam Map<String,Object> pMap) {
		logger.info("============>seedIns 호출 성공");
		seedLogic.seedIns(pMap);
		return "redirect:../index.jsp";
	}
	
	@GetMapping(value="bidWin.sf")
	public String bidWin(@RequestParam Map<String,Object> pMap) {
		logger.info("============>seedIns 호출 성공");
		seedLogic.bidWin(pMap);
		return "redirect:../index.jsp";
	}
}
