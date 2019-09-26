package com.sellfeed.member;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	public MemberLogic memberLogic = null;
	
	@GetMapping(value="idInspection.sf")
	public String idInspection(@RequestParam Map<String,Object> pMap) {
		//logger.info("=================>idInspection 호출 성공");
		//logger.info("=================>p_id"+p_id);
		pMap.put("mem_id","test");
		memberLogic.idInspection(pMap);
		return "redirect:../index.jsp";
	}
	
	@GetMapping(value="memberList.sf")
	public String memberList(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList = memberLogic.memberList(pMap);
		logger.info(rList.toString());
		
		return "redirect:../index.jsp";
	}
	@PostMapping(value="memberIns.sf")
	public String memberIns(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberIns 호출 성공");
		memberLogic.memberIns(pMap);
		return "redirect:/testview/memberIns3.jsp";//수정 예정
	}
	
	@PostMapping(value="login.sf")
	public String login(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("=================>login 호출 성공");
		memberLogic.login(pMap);
		mod.addAttribute("mem_name",pMap.get("mem_name"));
		return "forward:/testview/mainView.jsp";
	}
	
	@PostMapping(value="memberUpd.sf")
	public String memberUpd(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberUpd 호출 성공");
		memberLogic.memberUpd(pMap);
		return "redirect:../index.jsp";
	}
	@GetMapping(value="memberDel.sf")
	public String memberDel(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberDel 호출 성공");
		memberLogic.memberDel(pMap);
		return "redirect:../index.jsp";
	}
}
