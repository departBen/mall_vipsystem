package com.bs.mall.dao;

import java.util.List;

import com.bs.mall.entity.Commodity;

public interface CommodityDao {
	/**
	 * 保存商品信息
	 * @param commodity
	 * @return
	 */
	int save(Commodity commodity);
	/**
	 * 查询所有商品信息
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
	 * 总记录数
	 * @return
	 */
	int getTotal(); 
	/**
	 * 根据id查询商品 
	 * @param id
	 * @return
	 */
	Commodity get(int id);
}
