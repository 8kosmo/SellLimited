package com.sellfeed.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {
	Logger logger = LoggerFactory.getLogger(ProductLogic.class);
	int result =0;
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
//★   Insert
   public int ProductIns(Map<String, Object> pMap) {
      logger.info("ProductDao| Call productIns");
      sqlSessionTemplate.selectOne("productIns",pMap);
      String a = pMap.get("result").toString();
      logger.info(a);
      return result;
   }
   public void fileNameIns(List<Map<String,Object>> itemList) {
	   logger.info("ProductDao| Call fileNameIns");
	   int i = sqlSessionTemplate.update("fileNameIns",itemList);
   }   
//★	Update
	public int productUpd(Map<String, Object> pMap) {
		result = sqlSessionTemplate.update("productUpd",pMap);
		return result;
	}
//★	Delete
	public int productDel(Map<String, Object> pMap) {
		logger.info("ProductDao| Call productDel");
		Map<String,Object> DelResult = null;
		DelResult = sqlSessionTemplate.selectOne("productDel",pMap);
		if(DelResult!=null) {
			result =1;
		}
		return result;
	}
//관리자 승인 이후 트랜잭션 처리 (String item_code, String mem_id, int auct_period)
	public int managerPermission(String item_code) {
		logger.info("ProductDao| Call managerPermission");
		int result = 0;
		result = sqlSessionTemplate.update("managerPermission",item_code);
		return result;
		
	}
	public int auction_infoIn(String item_code) {
		logger.info("ProductDao| Call auction_infoIn");
		int result = 0;
		result = sqlSessionTemplate.insert("auction_infoIn", item_code);
		return result;
	}
	public int auct_progressIns(String item_code, int auct_period) {
		logger.info("ProductDao| Call auction_infoIn");
		int result = 0;
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("item_code", item_code);
		pMap.put("auct_period", auct_period);
		result = sqlSessionTemplate.insert("auct_progressIns", pMap);
		return result;
	}
	public List<Map<String, Object>> itemStatusList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusList = 
				new ArrayList<Map<String,Object>>();
		itemStatusList = sqlSessionTemplate.selectList("itemStatusList",pMap);
		return itemStatusList;
	}
	public void managerRefuse(String item_code) {
		sqlSessionTemplate.delete("managerRefuse", item_code);
	}
	public int getPermissionTotal() {
		int total = 0;
		total = sqlSessionTemplate.selectOne("getPermissionTotal");
		return total;
	}
	public List<Map<String, Object>> itemStatusSeedList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusSeedList = 
				new ArrayList<Map<String,Object>>();
		itemStatusSeedList = sqlSessionTemplate.selectList("itemStatusSeedList",pMap);
		return itemStatusSeedList;
	}
	public int getSeedListTotal(Map<String, Object> pMap) {
		int total = 0;
		total = sqlSessionTemplate.selectOne("getSeedListTotal",pMap);
		return total;
	}
	public List<Map<String, Object>> itemStatusAuctionList(Map<String, Object> pMap) {
		List<Map<String, Object>> itemStatusAuctionList = 
				new ArrayList<Map<String,Object>>();
		itemStatusAuctionList = sqlSessionTemplate.selectList("itemStatusAuctionList",pMap);
		return itemStatusAuctionList;
	}
	public int getAuctionListTotal(Map<String, Object> pMap) {
		int total = 0;
		total = sqlSessionTemplate.selectOne("getAuctionListTotal",pMap);
		return total;
	}
}
