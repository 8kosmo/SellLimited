package com.sellfeed.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductLogic {
   Logger logger = LoggerFactory.getLogger(ProductLogic.class);
   int result = 0;
   @Autowired
   public ProductDao productDao = null;   

   public List<Map<String, Object>> productList(Map<String, Object> pMap) {
      logger.info("Logic| Call ProductList");
      List<Map<String,Object>> productList = null;
      productList = productDao.productList(pMap);
      return productList;
   }
   
   public int productIns(Map<String, Object> pMap, List<Map<String,Object>> itemList) {
      logger.info("Logic| Call ProductIns");
      result = productDao.ProductIns(pMap);
      Map<String,Object> fileMap = null;
      int count = itemList.size();
      String item_code = (String)pMap.get("result");
      if(itemList!=null && itemList.size()>1) {
    	  for(int i=0;i<count;i++) {
    		  fileMap = itemList.get(i);
    		  fileMap.put("item_code",item_code);
    	  }
    	  productDao.fileNameIns(itemList);    
      }
      return result;
   }

   public int productUpd(Map<String, Object> pMap) {
      logger.info("Logic| Call ProductUpd");
      result = productDao.productUpd(pMap);
      return result;
   }

   public int productDel(Map<String, Object> pMap) {
      // TODO Auto-generated method stub
      result = productDao.productDel(pMap);
      return result;
   }
}