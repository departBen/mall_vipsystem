package com.bs.mall.service.impl;

import java.util.List;

import com.bs.mall.dao.VipDao;
import com.bs.mall.entity.Consume;
import com.bs.mall.entity.Vip;
import com.bs.mall.service.VipService;

public class VipServiceImpl implements VipService {
	
	private VipDao vipDao;

	@Override
	public int addVip(Vip vip) {
		return vipDao.addVip(vip);
	}
	
	@Override
	public List<Vip> findAll() {
		
		return vipDao.findAll();
	}

	@Override
	public Vip getVip(int id) {
		return vipDao.get(id);
	}
	
	@Override
	public int saveConsume(Consume consume) {
		return vipDao.saveConsume(consume);
	}
	
	@Override
	public List<Consume> findAllPaging(int currentPage, int pageSize) {
		List<Consume> clist =  vipDao.findAllPaging(currentPage, pageSize);
		return clist;
	}

	@Override
	public int getTotal() {
		return vipDao.getTotal();
	}
	
	public VipDao getVipDao() {
		return vipDao;
	}

	public void setVipDao(VipDao vipDao) {
		this.vipDao = vipDao;
	}

	

	
}
