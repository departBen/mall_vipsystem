package com.bs.mall.service;

import java.util.List;

import com.bs.mall.entity.Role;
import com.bs.mall.entity.Users;

public interface UserService {
	/**
	 * 登陆
	 * @param username
	 * @param password
	 * @return
	 */
	Users login(String username,String password);
	/**
	 * 分页查询用户
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	List<Users> findAllPaging(int currentPage,int pageSize);
	/**
	 * 用户数
	 * @return
	 */
	int getTotal();
	/**
	 * 根据用户名查询用户
	 * @param name
	 * @return
	 */
	Users getUserByName(String name);
	/**
	 * 跟新或保存用户
	 * @param user
	 */
	void saveOrUpdate(Users user);
	/**
	 * 获取权限
	 * @param name
	 * @return
	 */
	Role getRoleByName(String name);
	/**
	 * 保存权限
	 * @param role
	 */
	void save(Role role);
}
