package com.sellfeed.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.sellfeed.account.AccountLogic;
import com.sellfeed.favorite.FavoriteLogic;
import com.sellfeed.member.MemberLogic;
import com.sellfeed.product.ProductLogic;
import com.sun.istack.internal.logging.Logger;

@RestController
@RequestMapping(value="/rest",produces="text/plain;charset=UTF-8")
public class RestSellFeedController {
	Logger logger = Logger.getLogger(RestSellFeedController.class);
	@Autowired
	private FavoriteLogic favoriteLogic = null;
	@Autowired
	private AccountLogic accountLogic = null;
	@Autowired
	private MemberLogic memberLogic = null;
	@Autowired
	private ProductLogic productLogic = null;
	
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
	@PostMapping(value="/login.sf")
	public String login(@RequestParam Map<String,Object> pMap,HttpSession session) {
		logger.info("=================>login 호출 성공");
		logger.info(pMap.get("mem_id").toString());
		logger.info(pMap.get("mem_password").toString());
		List<String> list = new ArrayList<String>();
		list = memberLogic.login(pMap);
		logger.info("======리스트================="+list.get(0)+","+list.get(1));
		if("비밀번호를 잘못 입력하셨습니다.".equals(list.get(0))
				|| "아이디가 존재하지 않습니다.".equals(list.get(0))){
		}
		else {
			session.setAttribute("mem_name",list.get(0));
			session.setAttribute("nowBalance",list.get(1));
		}
		String mem_name = pMap.get("mem_name").toString();
		Gson g = new Gson();
		String json = g.toJson(list);
		return json;
	}
	@GetMapping(value="idInspection.sf")
	public String idInspection(@RequestParam Map<String,Object> pMap) {
		//logger.info("=================>idInspection 호출 성공");
		//logger.info("=================>p_id"+p_id);
		String inspectedId = memberLogic.idInspection(pMap);
		return inspectedId;
	}
	
}
