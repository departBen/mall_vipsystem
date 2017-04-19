package com.bs.mall.dao.impl;

import java.lang.reflect.Method;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bs.mall.dao.UserDao;
import com.bs.mall.entity.Users;
import com.bs.mall.service.UserService;

public class UserDaoImplTest {

	@Test
	public void test() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = context.getBean("userService",UserService.class);
		Users u = userService.login("admin", "123456");
		System.out.println(u.getUsername() + " " + u.getPassword() );
	}
	
	@Test
	public void test2(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserDao userDao = context.getBean("userDao",UserDao.class);
		SessionFactory sessionFactory = context.getBean("sessionFactory",SessionFactory.class);
		Session session = sessionFactory.getCurrentSession();
		Transaction ts = session.beginTransaction();
		Users u = userDao.getUserByNameAndPassword("admin", "123456");
		System.out.println(u.getUsername() + " " + u.getPassword() );
		ts.commit();
	}

}
