package com.bs.mall.service;

import java.util.List;

import com.bs.mall.entity.Commodity;

public interface CommodityService {
	/**
	 * 保存商品
	 * @param commodity
	 * @return
	 */
	int saveCommodity(Commodity commodity);
	/**
	 * 查询所有商品
	 * @return
	 */
	List<Commodity> findAll();
	/**
	 * 分页查询商品信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	List<Commodity> findAllPaging(int currentPage,int pageSize);
	/**
	 * 商品数
	 * @return
	 */
	int getTotal();
	/**
	 *获取商品
	 */
	Commodity getComm(int id);
}
