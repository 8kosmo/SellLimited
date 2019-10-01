package com.sellfeed.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@RestController
@RequestMapping(value="/rest",produces="text/plain;charset=UTF-8")
public class RestSellFeedController {
	Logger logger = LoggerFactory.getLogger(RestSellFeedController.class);
	@Autowired
	private FavoriteLogic favoriteLogic = null;
	@Autowired
	private AccountLogic accountLogic = null;
	@Autowired
	private MemberLogic memberLogic = null;
	
	@GetMapping("/favSellerAdd.sf")
	public String favSellerAdd(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0;
			Ok = favoriteLogic.favSellerAdd(pMap);
			logger.info("Ok :"+Ok);
			if(Ok==1) {
				result = pMap.get("fav_sellerid")+"님이 관심판매자 목록에 등록되었습니다";
			}else if(Ok==0){
				result = pMap.get("fav_sellerid")+"님은 이미 관심판매자 목록에 등록되있습니다";
			}
		return result;
	}
	@GetMapping("/favProductAdd.sf")
	public String favProductAdd(@RequestParam Map<String,Object> pMap) {
		String result="";
		int Ok = 0;
			Ok = favoriteLogic.favProductAdd(pMap);
			if(Ok==1) {
				result ="이 상품이 관심상품 목록에 등록되었습니다";
			}else if(Ok==0){
				result = "이 상품은 이미 관심상품 목록에 등록되있습니다";
			}
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
			session.setAttribute("mem_id", pMap.get("mem_id"));
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
