package com.sellfeed.util;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sellfeed.account.AccountLogic;
import com.sellfeed.favorite.FavoriteLogic;
import com.sun.istack.internal.logging.Logger;

@RestController
@RequestMapping(value="/rest",produces="text/plain;charset=UTF-8")
public class RestSellFeedController {
	Logger logger = Logger.getLogger(RestSellFeedController.class);
	@Autowired
	public FavoriteLogic favoriteLogic = null;
	@Autowired
	public AccountLogic accountLogic = null;
	@GetMapping("/favSellerAdd.sf")
	public String favSellerAdd(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0;
		pMap.put("fav_sellerid", "TestId1");
		pMap.put("mem_id", "uh4ng");
		Ok = favoriteLogic.favSellerAdd(pMap);
		logger.info("Ok :"+Ok);
		return result;
	}
	@GetMapping("/favProductAdd.sf")
	public String favProductAdd(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0;
		pMap.put("mem_id", "TestId1");
		pMap.put("prod_code", "PWUL1903");
		Ok = favoriteLogic.favProductAdd(pMap);
		return result;
	}
	@GetMapping("/favSellerDel.sf")
	public String favSellerDel(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0; 
		pMap.put("fav_sellerid", "TestId1");
		pMap.put("mem_id", "uh4ng");
		
		Ok = favoriteLogic.favSellerDel(pMap);
		if(Ok==0) {
			
		}else {
			
		}
		return result;
		
	}
	@GetMapping("/favProductDel.sf")
	public String favProductDel(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0; 
		pMap.put("mem_id", "TestId1");
		pMap.put("prod_code", "YMUW5132");
		Ok = favoriteLogic.favProductDel(pMap);
		if(Ok==0) {
			
		}else {
			
		}
		
		return result;
		
	}
	@GetMapping("/nowPoint.sf")
	   public String nowPoint(@RequestParam Map<String, Object> pMap) {
	      String result="";
	      result=accountLogic.nowPoint(pMap);
	      return result;
	   }
	
}
