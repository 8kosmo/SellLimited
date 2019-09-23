package com.sellfeed.favorite;

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
@RequestMapping(value="/favorite")
public class FavoriteController {
	Logger logger = LoggerFactory.getLogger(FavoriteController.class);
	@Autowired
	public FavoriteLogic favoriteLogic = null;
	
	@GetMapping("/favSellerList.sf")
	public String favSellerList(@RequestParam (required=false) String mem_id) {
		logger.info("Controller| favSellerList 호출성공");
		List<Map<String,Object>> favList = null;
		mem_id = "uh4ng";
		favList = favoriteLogic.favSellerList(mem_id);
		logger.info("....."+favList);
		return "";
	}
	@GetMapping("/favProductList.sf")
	public String favProductList(@RequestParam (required=false) String mem_id) {
		logger.info("Controller| favProductList 호출성공");
		List<Map<String,Object>> favList = null;
		mem_id = "uh4ng";
		favList = favoriteLogic.favProductList(mem_id);
		logger.info(".."+favList);
		return "";
	}

}
