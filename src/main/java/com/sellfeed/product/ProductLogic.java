package com.sellfeed.product;

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

	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("Logic| Call ProductList");
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		return productList;
	}
	
	public int productIns(Map<String, Object> pMap) {
		logger.info("Logic| Call ProductIns");
		result = productDao.ProductIns(pMap);
		
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
		int step1, step2, step3 = 0;
		try {
			step1 = productDao.managerPermission(item_code);//ts step1
			logger.info("관리자 승인 결과 : "+step1);
			step2 = productDao.auction_infoIn(item_code);//ts step2
			logger.info("시드관리 INSERT 결과 : "+step2);
			step3 = productDao.auct_progressIns(item_code,auct_period);//ts step3
			logger.info("경매관리 INSERT 결과 : "+step3);
		} catch (DataAccessException e) {
			throw e;
		}
	}

	public List<Map<String, Object>> itemStatusList() {
		List<Map<String, Object>> itemStatusList = null;
		itemStatusList = productDao.itemStatusList();
		return itemStatusList;
	}

	public void managerRefuse(String item_code) {
		productDao.managerRefuse(item_code);
	}
}
