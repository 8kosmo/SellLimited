package com.sellfeed.favorite;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/favorite")
public class FavoriteController {
   Logger logger = LoggerFactory.getLogger(FavoriteController.class);
   @Autowired
   public FavoriteLogic favoriteLogic = null;
   
   //관심 판매자 리스트
   @GetMapping("/favSellerList.sf")
   public String favSellerList(@RequestParam("mem_id") String mem_id,Model mod, Map<String,Object> pMap) {
      logger.info("Controller| favSellerList 호출성공");
      List<Map<String,Object>> favList = null;
      int nowPage = 0;
      int pageSize = 0;
      
      if(pMap.get("nowPage")!=null) {
             nowPage = Integer.parseInt(pMap.get("nowPage").toString());
        }
        if(pMap.get("pageSize")!=null) {
            pageSize = Integer.parseInt(pMap.get("pageSize").toString());
        }
         
      logger.info("nowPage :"+nowPage);
      logger.info("pageSize :"+pageSize);
      
      pMap.put("nowPage",nowPage);
      pMap.put("pageSize",pageSize);
      pMap.put("mem_id",mem_id);
      logger.info("아이디!!!!!!!!!============="+mem_id);
      favList = favoriteLogic.favSellerList(pMap);
      mod.addAttribute("favList",favList);
      logger.info("....."+favList);
      return "forward:/testview/favSeller.jsp";
   }
   //관심 판매자 삭제
   @GetMapping("/favSellerDel.sf")
   public String favSellerDel(@RequestParam Map<String,Object> pMap) {
      String result="";
      int Ok = 0; 
      String fav_sellerid = pMap.get("fav_sellerid").toString();
      logger.info(pMap.get("fav_sellerid").toString());
      String mem_id = pMap.get("mem_id").toString();
      pMap.put("fav_sellerid", fav_sellerid);
      pMap.put("mem_id", mem_id);
      Ok = favoriteLogic.favSellerDel(pMap);
      if(Ok==0) {
         logger.info("fav Seller 삭제 실패"+Ok);
      }else {
         logger.info("fav Seller 삭제 성공"+Ok);
      }
      return "redirect:/testview/favSeller.jsp";
      
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