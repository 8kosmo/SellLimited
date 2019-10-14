package com.sellfeed.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductLogic {
   Logger logger = LoggerFactory.getLogger(ProductLogic.class);
   int result = 0;
   @Autowired
   public ProductDao productDao = null;   
   
   public int productIns(Map<String, Object> pMap, List<Map<String,Object>> itemList) {
      logger.info("Logic| Call ProductIns");
      result = productDao.ProductIns(pMap);
      Map<String,Object> fileMap = null;
      int count = itemList.size();
      String item_code = (String)pMap.get("result");
      if(itemList!=null && itemList.size()>=1) {
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
   
   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="excution(* com.sellfeed.product.*Logic.*(..)")
   public void managerPermission
   (String item_code, int auct_period) {
      logger.info("Logic| Call managerPermission");
      int step1, step2 = 0;
      try {
         step1 = productDao.managerPermission(item_code);//ts step1
         logger.info("관리자 승인 결과 : "+step1);
         step2 = productDao.auction_infoIn(item_code);//ts step2
         logger.info("시드관리 INSERT 결과 : "+step2);
      } catch (DataAccessException e) {
         throw e;
      }
   }
   
   public List<Map<String, Object>> auctionDetail(Map<String, Object> pMap) {
       logger.info("))))))))))))))))))))))))))))"+pMap);
       List<Map<String, Object>> productList = new ArrayList<>();
       productList = productDao.auctionDetail(pMap);
      return productList;
   }
   
   public List<Map<String, Object>> seedDetail(Map<String, Object> pMap) {
      logger.info("))))))))))))))))))))))))))))"+pMap);
      List<Map<String, Object>> productList = new ArrayList<>();
      productList = productDao.seedDetail(pMap);
      return productList;
   }
   
	public List<Map<String, Object>> itemStatusList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusList = null;
		int nowPage = 0;
		int pageSize = 0;
		int start = 0;
		int end = 0;
		int total = productDao.getPermissionTotal();
		if(Integer.parseInt(pMap.get("nowPage").toString())>0) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString());
		}
		if(Integer.parseInt(pMap.get("pageSize").toString())>0) {
			pageSize = Integer.parseInt(pMap.get("pageSize").toString());
		}
		if(nowPage>0) {
			start = ((nowPage-1)*pageSize)+1;
			end = nowPage*pageSize;
			pMap.put("start", start);
			if(end>=total) {
				pMap.put("end", total);
			} else {
				pMap.put("end", end);
			}
		}
		logger.info("시작 ROW : "+start);
		logger.info("끝 ROW : "+end);
		itemStatusList = productDao.itemStatusList(pMap);
		return itemStatusList;
	}

   public void managerRefuse(String item_code) {
      productDao.managerRefuse(item_code);
   }
   	public List<Map<String, Object>> itemStatusSeedList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusSeedList = null;
		int nowPage = 0;
		int pageSize = 0;
		int start = 0;
		int end = 0;
		int total = productDao.getPermissionTotal();
		if(Integer.parseInt(pMap.get("nowPage").toString())>0) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString());
		}
		if(Integer.parseInt(pMap.get("pageSize").toString())>0) {
			pageSize = Integer.parseInt(pMap.get("pageSize").toString());
		}
		if(nowPage>0) {
			start = ((nowPage-1)*pageSize)+1;
			end = nowPage*pageSize;
			pMap.put("start", start);
			if(end>=total) {
				pMap.put("end", total);
			} else {
				pMap.put("end", end);
			}
		}
		logger.info("시작 ROW : "+start);
		logger.info("끝 ROW : "+end);
		itemStatusSeedList = productDao.itemStatusSeedList(pMap);
		return itemStatusSeedList;
	}

	public List<Map<String, Object>> itemStatusAuctionList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusAuctionList = null;
		int nowPage1 = 0;
		int pageSize1 = 0;
		int start = 0;
		int end = 0;
		int total = productDao.getPermissionTotal();
		if(Integer.parseInt(pMap.get("nowPage1").toString())>0) {
			nowPage1 = Integer.parseInt(pMap.get("nowPage1").toString());
		}
		if(Integer.parseInt(pMap.get("pageSize1").toString())>0) {
			pageSize1 = Integer.parseInt(pMap.get("pageSize1").toString());
		}
		if(nowPage1>0) {
			start = ((nowPage1-1)*pageSize1)+1;
			end = nowPage1*pageSize1;
			pMap.put("start", start);
			if(end>=total) {
				pMap.put("end", total);
			} else {
				pMap.put("end", end);
			}
		}
		logger.info("시작 ROW : "+start);
		logger.info("끝 ROW : "+end);
		itemStatusAuctionList = productDao.itemStatusAuctionList(pMap);
		return itemStatusAuctionList;
	}
}