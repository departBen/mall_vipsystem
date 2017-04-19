package com.bs.mall.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.mall.dao.VipDao;
import com.bs.mall.entity.Consume;
import com.bs.mall.entity.Vip;

public class VipDaoImpl implements VipDao {
	private SessionFactory sessionFactory;

	@Override
	public int addVip(Vip vip) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(vip);
		return id;
	}
	
	@Override
	public List<Vip> findAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select v from Vip v");
		List<Vip> vlist = (List<Vip>)query.list();
		return vlist;
	}
	
	@Override
	public Vip get(int id) {
		Session session = sessionFactory.getCurrentSession();
		return (Vip) session.get(Vip.class, id);
	}
	
	@Override
	public int saveConsume(Consume consume) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(consume);
		return id;
	}

	@Override
	public List<Consume> findAllPaging(int currentPage, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c from Consume c order by c.vip.vipid asc ");
		int startRow=(currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<Consume> clist = (List<Consume>)query.list();
		for (Consume consume : clist) {
			consume.getVip().getName();
		}
		return clist;
	}
	
	@Override
	public int getTotal() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c from Consume c");
		List<Consume> clist = (List<Consume>)query.list();
		return clist.size();
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	


}
