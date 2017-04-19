package com.bs.mall.dao;

import java.util.List;

import com.bs.mall.entity.Role;
import com.bs.mall.entity.Users;

public interface UserDao {
	/**
	 * 根据用户名查找用户
	 * @param name
	 * @return
	 */
	Users getUserByName(String name);
	/**
	 * 登陆验证
	 * @param userName
	 * @param password
	 * @return
	 */
	Users getUserByNameAndPassword(String userName, String password); 
	/**
	 * 分页查询
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	List<Users> findAllPaging(int currentPage,int pageSize);
	/**
	 * 查找总记录数
	 * @return
	 */
	int getTotal();
	/**
	 * 存储权限
	 * @param role
	 */
	void save(Role role);
	/**
	 * 存储更新用户
	 * @param user
	 */
	void save(Users user);
	/**
	 * 根据权限名查找权限
	 * @param name
	 * @return
	 */
	Role getRoleByName(String name);
}
