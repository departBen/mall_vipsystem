package com.bs.mall.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.mall.dao.UserDao;
import com.bs.mall.entity.Role;
import com.bs.mall.entity.Users;

public class UserDaoImpl implements UserDao{
	
	private SessionFactory sessionFactory;

	@Override
	public Users getUserByNameAndPassword(String userName, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select u from Users u where u.username ='" + userName + "' and u.password = '" + password + "'"; 
		Query query = session.createQuery(hql);
		Users user = null;
		if (query.list().size() > 0) {
			user = (Users) query.list().get(0);
			if(user.getRole() != null){
				user.getRole().getRoles();
			}
		}
		return user;
	}
	
	@Override
	public List<Users> findAllPaging(int currentPage, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select u from Users u");
		int startRow=(currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<Users> clist = (List<Users>)query.list();
		for (Users users : clist) {
			if(users.getRole() != null){
				users.getRole().getRoles();
			}
		}
		return clist;
	}

	@Override
	public int getTotal() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select u from Users u");
		List<Users> clist = (List<Users>)query.list();
		return clist.size();
	}
	
	@Override
	public Users getUserByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select u from Users u where u.username ='" + name + "'";
		Query query = session.createQuery(hql);
		Users user = null;
		if (query.list().size() > 0) {
			user = (Users) query.list().get(0);
			if(user.getRole() != null){
				user.getRole().getRoles();
			}
		}
		return user;
	}
	
	@Override
	public void save(Users user) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(user);
	}
	
	@Override
	public Role getRoleByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select r from Role r where r.roles = '" + name + "'";
		Query query = session.createQuery(hql);
		Role role = null;
		if(query.list().size() > 0){
			role = (Role) query.list().get(0);
		}
		return role;
	}
	
	@Override
	public void save(Role role) {
		Session session = sessionFactory.getCurrentSession();
		session.save(role);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	

}
