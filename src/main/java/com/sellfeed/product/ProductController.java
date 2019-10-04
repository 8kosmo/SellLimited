package com.sellfeed.product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	String path;
	int result;
	String savePath =  "\\\\192.168.0.187\\itemPhoto";
   	String photo_name =  null;
  	String fullPath = null;
  	List<Map<String,Object>> itemList = null;
  	Map<String,Object> fileMap = null;
	@Autowired
	public ProductLogic productLogic = null;
	
   @PostMapping("/productIns.sf")
   public String productIns(@RequestParam Map<String, Object> pMap
                      ,@RequestParam (value="attached_file1", required=false) MultipartFile product_file1
                      ,@RequestParam (value="attached_file2", required=false) MultipartFile product_file2
                      ,@RequestParam (value="attached_file3", required=false) MultipartFile product_file3) {
      logger.info("Controller| Call productIns");
      //첨부파일 존재 확인
      pMap.put("status", "승인대기");
      itemList = new ArrayList<>();
      fileNullCheck(product_file1);
      fileNullCheck(product_file2);
      fileNullCheck(product_file3);
      result = productLogic.productIns(pMap,itemList);
      return "redirect:/testview/ProductIns.jsp";
   }
   public void fileNullCheck(MultipartFile mFile) {
      if(mFile!=null && !mFile.isEmpty()) {
         photo_name =  mFile.getOriginalFilename();
         logger.info(photo_name);
         fullPath = savePath+"\\"+photo_name;
         try {
            File file = new File(fullPath);//파일명만 존재하고 내용은 없는 경우
            byte[] bytes = mFile.getBytes();
            BufferedOutputStream bos = 
                  new BufferedOutputStream(new FileOutputStream(file));
            bos.write(bytes);
            bos.close();
            fileMap = new HashMap<>();
            fileMap.put("photo_name",photo_name);
            itemList.add(fileMap);
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
   }
	@PostMapping("/productUpd.sf")
	public String productUpd(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller| Call productUpd");
		result = productLogic.productUpd(pMap);
		if(result==1) {
			path = "정해야함";
		}else {
			path = "";			
		}
		return path;
	}
	@GetMapping("/productDel.sf")
	public String productDel(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller| Call productDel");
		pMap.put("item_code","TUXV7614");
		result = productLogic.productDel(pMap);
		if(result==1) {
			path = "정해야함";
		}else {
			path = "";			
		}
		return path;
	}
	//승인대기 -> 시드침여중, 트랜잭션 3step
	@GetMapping("/managerPermission.sf")
	public String managerPermission
	(@RequestParam("item_code") String item_code
			,@RequestParam("auct_period") int auct_period) {
		logger.info("Controller| Call managerPermission");
		productLogic.managerPermission(item_code,auct_period);
		return "redirect:../product/itemStatusList.sf";
	}
	//관리자 페이지 접속 시 리스트 검색
	@GetMapping(value="/itemStatusList.sf")
	public String itemStatusList(Model mod, HttpServletRequest req) {
		List<Map<String, Object>> itemStatusList = null;
		int nowPage = 0;
		int pageSize = 0;
		 if(req.getParameter("nowPage")!=null) {
			 nowPage = Integer.parseInt(req.getParameter("nowPage"));
         }
         if(req.getParameter("pageSize")!=null) {
             pageSize =  Integer.parseInt(req.getParameter("pageSize"));
         }
		logger.info("nowPage :"+nowPage);
		logger.info("pageSize :"+pageSize);
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("nowPage",nowPage);
		pMap.put("pageSize",pageSize);
		itemStatusList = productLogic.itemStatusList(pMap);
		mod.addAttribute("itemStatusList", itemStatusList);
		return "forward:../testview/managerPermission.jsp";
	}
	//승인대기 -> 등록거절하기
	@GetMapping(value="/managerRefuse.sf")
	public String managerRefuse(@RequestParam("item_code") String item_code) {
		productLogic.managerRefuse(item_code);
		return "redirect:../product/itemStatusList.sf";
	}
	//시드참여중 리스트 검색
	@GetMapping(value="/productList.sf")
	public String productList(Model mod, @RequestParam Map<String, Object>pMap) {
		/*시드참여중 리스트*/
		List<Map<String, Object>> itemStatusSeedList = null;
		int nowPage = 0;
		int pageSize = 15;
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
		itemStatusSeedList = productLogic.itemStatusSeedList(pMap);
		mod.addAttribute("itemStatusSeedList", itemStatusSeedList);
		/*경매진행중 리스트*/
		List<Map<String, Object>> itemStatusAuctionList = null;
		int nowPage1 = 0;
		int pageSize1 = 15;
		 if(pMap.get("nowPage1")!=null) {
             nowPage1 = Integer.parseInt(pMap.get("nowPage1").toString());
         }
         if(pMap.get("pageSize1")!=null) {
        	 pageSize1 = Integer.parseInt(pMap.get("pageSize1").toString());
         }
		logger.info("nowPage1 :"+nowPage1);
		logger.info("pageSize1 :"+pageSize1);
		pMap.put("nowPage1",nowPage1);
		pMap.put("pageSize1",pageSize1);
		itemStatusAuctionList = productLogic.itemStatusAuctionList(pMap);
		mod.addAttribute("itemStatusAuctionList", itemStatusAuctionList);
		return "forward:../testview/productListView.jsp";
	}
	//ajax 시드참여중
	@GetMapping(value="/itemStatusSeedList.sf")
	public String itemStatusSeedList(Model mod, @RequestParam Map<String, Object> pMap) {
		/*시드참여중 리스트*/
		List<Map<String, Object>> itemStatusSeedList = null;
		int nowPage = 0;
		int pageSize = 15;
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
		itemStatusSeedList = productLogic.itemStatusSeedList(pMap);
		mod.addAttribute("itemStatusSeedList", itemStatusSeedList);
		return "forward:../testview/itemStatusSeedList.jsp";
	}
	//ajax 경매진행중
	@GetMapping(value="/itemStatusAuctionList.sf")
	public String itemStatusAuctionList(Model mod, @RequestParam Map<String, Object> pMap) {
		/*경매진행중 리스트*/
		List<Map<String, Object>> itemStatusAuctionList = null;
		int nowPage1 = 0;
		int pageSize1 = 15;
		 if(pMap.get("nowPage1")!=null) {
             nowPage1 = Integer.parseInt(pMap.get("nowPage1").toString());
         }
         if(pMap.get("pageSize1")!=null) {
        	 pageSize1 = Integer.parseInt(pMap.get("pageSize1").toString());
         }
		logger.info("nowPage1 :"+nowPage1);
		logger.info("pageSize1 :"+pageSize1);
		pMap.put("nowPage1",nowPage1);
		pMap.put("pageSize1",pageSize1);
		itemStatusAuctionList = productLogic.itemStatusAuctionList(pMap);
		mod.addAttribute("itemStatusAuctionList", itemStatusAuctionList);
		return "forward:../testview/itemStatusAuctionList.jsp";
	}
}
