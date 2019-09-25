package com.sellfeed.product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Autowired
	public ProductLogic productLogic = null;
	
	@GetMapping("/productList.sf")
	public String productList(@RequestParam (required=false) Map<String, Object> pMap) {
		logger.info("Controller| Call productList");
		List<Map<String,Object>> productList = null;
		pMap.put("mem_id","uh4ng");
		productList=productLogic.productList(pMap);
		
//		System.out.println("$$$$$$$$$$$$$$$$$$$셀렉트 단위테스트"+productList.get(0)); 		 ★CLEAR
		if(productList!=null&&productList.size()>0) {
			path="";
		}
		return path;
	}
	
	@PostMapping("/productIns.sf")
	public String productIns(@RequestParam Map<String, Object> pMap,
			 				@RequestParam (value="attached_file", required=false) MultipartFile product_file) {
		logger.info("Controller| Call productIns");
		String savePath =  "";
		String filename =  null;
		String fullPath = null;
		//첨부파일 존재 확인
		//Map<String,Object> pMap = new HashMap<String,Object>();
		if(product_file!=null && !product_file.isEmpty()) {
			filename =  product_file.getOriginalFilename();
			fullPath = savePath+"\\"+filename;
			try {
				File file = new File(fullPath);//파일명만 존재하고 내용은 없는
				byte[] bytes = product_file.getBytes();
				BufferedOutputStream bos = 
						new BufferedOutputStream(new FileOutputStream(file));
				bos.write(bytes);
				bos.close();
				//파일크기 초기화
				long size = file.length();
				double d_size = Math.floor(size/1024.0);
				pMap.put("product_file",filename);
				pMap.put("bs_size",d_size);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		pMap.put("mem_id", "uh4ng")          ;
		pMap.put("brand", "InsertTest")           ;
		pMap.put("product_name", "InsertTest")    ;
		pMap.put("status", "InsertTest")          ;
		pMap.put("sub_category", "일렉 기타")    ;
		pMap.put("modelname", "InsertTest")       ;
		pMap.put("explanation", "InsertTest")     ;
		pMap.put("attached_file", "")   ;
		pMap.put("start_price", "1111")     ;
		result = productLogic.productIns(pMap);
		
		return "redirect:testview/ProductIns.jsp";
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
	public String itemStatusList(ModelMap mod) {
		List<Map<String, Object>> itemStatusList = null;
		itemStatusList = productLogic.itemStatusList();
		mod.addAttribute("itemStatusList", itemStatusList);
		return "forward:../testview/managerPermission.jsp";
	}
	//승인대기 -> 등록거절하기
	@GetMapping(value="/managerRefuse.sf")
	public String managerRefuse(@RequestParam("item_code") String item_code) {
		productLogic.managerRefuse(item_code);
		return "redirect:../product/itemStatusList.sf";
	}
}
