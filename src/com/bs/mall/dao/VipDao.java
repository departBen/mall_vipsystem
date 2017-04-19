package com.bs.mall.dao;

import java.util.List;

import com.bs.mall.entity.Consume;
import com.bs.mall.entity.Vip;

public interface VipDao {
	/**
	 * 添加vip会员
	 * @param vip
	 * @return
	 */
	public int addVip(Vip vip);
	/**
	 * 查找所有vip
	 * @return
	 */
	List<Vip> findAll();
	/**
	 * 根据id查找vip
	 * @param id
	 * @return
	 */
	Vip get(int id);
	/**
	 * 保存购物信息
	 * @param consume
	 * @return
	 */
	int saveConsume(Consume consume);
	/**
	 * 分页查询购物信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	List<Consume> findAllPaging(int currentPage,int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	int getTotal(); 
}
