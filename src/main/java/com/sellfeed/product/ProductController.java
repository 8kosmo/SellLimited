package com.sellfeed.product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
   
   @GetMapping("/productList.sf")
      public String productList(@RequestParam (required=false) Map<String, Object> pMap) {
         logger.info("Controller| Call productList");
         List<Map<String,Object>> productList = null;
         logger.info("아이디 : "+ pMap.get("mem_id"));
         productList =productLogic.productList(pMap);
         if(productList!=null&&productList.size()>0) {
            return "testview/DetailView";
         }
         logger.info("잘 못 가져옴"+"----------pMap---------------" +pMap);
         logger.info("잘 못 가져옴"+"----------productList---------------" +productList);
         return "redirect:/testview/DetailView";
      }
   //승기코드
   	 @GetMapping("/productTest.sf")
   	 public String produdctTest(Model mod) {
   		 Map<String,Object> tMap = new HashMap<>();
   		 tMap.put("이름","유승기");
   		 List<String> tList = new ArrayList<>();
   		 tList.add("남자");
   		 tList.add("20세");
   		 tMap.put("정보",tList);
   		 mod.addAttribute("tMap",tMap);
         return "forward:/testview/collection.jsp";

   	 }

     @GetMapping("/productDetail.sf")
    public String productList(@RequestParam Map<String,Object> pMap, Model mod) {
       List<Map<String,Object>> productDetailList = new ArrayList<>();
       logger.info("))))))))))))))))))))))))))))"+pMap);
       if(pMap.get("status").equals("auction")) {
          productDetailList = productLogic.auctionDetail(pMap);
       }
       else if(pMap.get("status").equals("seed")) {
          productDetailList = productLogic.seedDetail(pMap);
       }
       Map<String,Object> rMap = new HashMap<>();
       List<String> photoNameList = new ArrayList<>();
       logger.info("_________________________________"+productDetailList);
       for(int i=0; i<productDetailList.size();i++) {
          rMap = productDetailList.get(i);
          rMap.get("PHOTO_NAME");
          photoNameList.add(rMap.get("PHOTO_NAME").toString());
          logger.info(")1111)))))))))))))))))))))))))))))"+photoNameList);
       }
       rMap.put("PHOTO_NAME",photoNameList);
       if(photoNameList.size()>1) {
          logger.info(")2222)))))))))))))))))))))))))))))"+rMap);
          List<String> testL = (List)rMap.get("PHOTO_NAME");
          logger.info(")))333333)))))))"+testL);
       }
       mod.addAttribute("rMap",rMap);
       
       if(pMap.get("status").equals("auction")) {
          return "forward:/testview/AuctionDetailView.jsp";
       }else {
          return "forward:/testview/SeedDetailView.jsp";
       }
    }
  

//      @GetMapping("/productDetail.sf")
//      public String gproductList(@RequestParam Map<String,Object> pMap
//                            ,Model mod) {
//         List<Map<String,Object>> productDetailList = new ArrayList<>();
//         logger.info("))))))))))))))))))))))))))))"+pMap);
//         //경매중
//         if(pMap.get("status").equals("auction")) {
//            productDetailList = productLogic.auctionDetail(pMap);
//         }
//         //시드참여중
//         else if(pMap.get("status").equals("seed")) {
//            productDetailList = productLogic.seedDetail(pMap);
//         }
//         
//         Map<String,Object> rMap = new HashMap<>();
//         logger.info("_________________________________"+productDetailList);
//         rMap = productDetailList.get(0);
//       
//         List<Map<String,Object>> photoList =  (List<Map<String, Object>>) pMap.get("photoList");
//         //사진 여러개가 있을 때를 위해서.
//         if(photoList!=null && photoList.size()>0) {
//            rMap.put("photoList",photoList);
//         }
//         mod.addAttribute("rMap",rMap);
//         logger.info("=======================rMap===============>"+rMap);    
//         return "forward:/testview/DetailView.jsp";
//      }
    
   
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
      return "redirect:/testview/mainView.jsp";
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