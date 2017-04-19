package com.bs.mall.service.impl;

import java.util.List;

import com.bs.mall.dao.CommodityDao;
import com.bs.mall.entity.Commodity;
import com.bs.mall.service.CommodityService;

public class CommodityServiceImpl implements CommodityService {
	
	private CommodityDao commodityDao;
	
	@Override
	public int saveCommodity(Commodity commodity) {
		return commodityDao.save(commodity);
	}
	
	@Override
	public List<Commodity> findAll() {
		return commodityDao.findAll();
	}
	
	@Override
	public List<Commodity> findAllPaging(int currentPage, int pageSize) {
		return commodityDao.findAllPaging(currentPage, pageSize);
	}
	
	@Override
	public int getTotal() {
		return commodityDao.getTotal();
	}
	
	@Override
	public Commodity getComm(int id) {
		return commodityDao.get(id);
	}

	
	public CommodityDao getCommodityDao() {
		return commodityDao;
	}

	public void setCommodityDao(CommodityDao commodityDao) {
		this.commodityDao = commodityDao;
	}



}
