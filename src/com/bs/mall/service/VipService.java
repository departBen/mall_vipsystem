package com.bs.mall.service;

import java.util.List;

import com.bs.mall.entity.Consume;
import com.bs.mall.entity.Vip;

public interface VipService {
	/**
	 * 添加用户
	 * @param vip
	 * @return
	 */
	int addVip(Vip vip);
	/**
	 * 查询所有用户
	 * @return
	 */
	List<Vip> findAll();
	/**
	 * 获取用户
	 * @param id
	 * @return
	 */
	Vip getVip(int id);
	/**
	 * 购物
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
	 * 记录数
	 * @return
	 */
	int getTotal();
}
