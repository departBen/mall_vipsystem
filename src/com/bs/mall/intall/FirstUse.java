package com.bs.mall.intall;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bs.mall.entity.Role;
import com.bs.mall.entity.Users;
import com.bs.mall.service.UserService;

public class FirstUse {
	
	/**
	 * 首次安装
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = context.getBean("userService",UserService.class);
		Role roleAdmin = new Role();
		roleAdmin.setRoles("admin");
		Role roleUser = new Role();
		roleUser.setRoles("user");
		userService.save(roleAdmin);
		userService.save(roleUser);
		
		Users admin = new Users();
		admin.setUsername("admin");
		admin.setPassword("123456");
		Role adminRole = userService.getRoleByName("admin");
		admin.setRole(adminRole);
		userService.saveOrUpdate(admin);
		
		System.out.println("初始化成功");
	}
}
