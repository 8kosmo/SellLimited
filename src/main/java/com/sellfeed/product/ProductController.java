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
      pMap.put("mem_id","uh4ng");
      productList=productLogic.productList(pMap);
      if(productList!=null&&productList.size()>0) {
         path="";
      }
      return path;
   }
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
      pMap.put("brand","fender");
      pMap.put("product_name","재즈마스터");
      pMap.put("status","A");
      pMap.put("admin_ok","AA");
      pMap.put("sub_category","베이스기타");
      pMap.put("modelname","AA");
      pMap.put("explanation","AA");
      pMap.put("attached_file","AA");
      pMap.put("item_code","YMUW5132");
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

   
}