package com.sellfeed.aucLog;

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
@RequestMapping(value="/aucLog")
public class AucLogController {
	Logger logger = LoggerFactory.getLogger(AucLogController.class);
	@Autowired
	public AucLogLogic aucLogLogic = null;
	
	@GetMapping("/aucLogList.sf")
	public String aucLogList(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller| aucLogList 호출성공");
		List<Map<String,Object>> acuList = null;
		pMap.put("bid_code","b123");
		acuList = aucLogLogic.aucLogList(pMap);
		logger.info("...."+acuList);
		return "";
	}
	@GetMapping("/aucLogIns.sf")
	public String aucLogIns(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller| auctLogIns 호출성공");
		pMap.put("bid_code","b123");
		pMap.put("mem_id","uh4ng");
		pMap.put("increase_rate",1000);
		int Ok  = aucLogLogic.aucLogIns(pMap);
		if(Ok!=0) {
			logger.info("aucLogIns 성공!");
		}else {
			return "";
		}
		return "";
	}
}
