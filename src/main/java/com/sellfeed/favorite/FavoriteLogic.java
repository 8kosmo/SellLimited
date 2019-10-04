package com.sellfeed.favorite;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteLogic {
	Logger logger = LoggerFactory.getLogger(FavoriteLogic.class);
	@Autowired
	public FavoriteDao favoriteDao = null;
	List<Map<String,Object>> favList = null;
	int Ok =0;
	
	public List<Map<String,Object>> favSellerList(String mem_id) {
		logger.info("Logic| favSellerList 호출성공");
		favList = favoriteDao.favSellerList(mem_id);
		return favList;
	}
	public int favSellerDel(Map<String, Object> pMap) {
		logger.info("Logic| favSellerDel 호출성공");
		Ok = favoriteDao.favSellerDel(pMap);
		return Ok ;
	}
	public List<Map<String, Object>> favProductList(String mem_id) {
		logger.info("Logic| favProductList 호출성공");
		favList = favoriteDao.favProductList(mem_id);
		return favList;
	}
	public int favProductDel(Map<String, Object> pMap) {
		logger.info("Logic| favProductDel 호출성공");
		Ok = favoriteDao.favProductDel(pMap);
		return Ok;
	}
	public int favSellerAdd(Map pMap) {
		logger.info("Logic| favSellerAdd 호출성공");
		Ok = favoriteDao.favSellerCheck(pMap);
		if(Ok==1) {
			Ok = favoriteDao.favSellerAdd(pMap);
		}
		return Ok;
	}
	public int favProductAdd(Map pMap) {
		logger.info("Logic| favProductAdd 호출성공");
		Ok = favoriteDao.favProductCheck(pMap);
		if(Ok==1) {
			Ok = favoriteDao.favProdAdd(pMap);
		}
		return Ok;
	}
}
