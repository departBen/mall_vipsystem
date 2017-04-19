package com.bs.mall.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.mall.dao.CommodityDao;
import com.bs.mall.entity.Commodity;

public class CommodityDaoImpl implements CommodityDao {
	
	private SessionFactory sessionFactory;
	
	@Override
	public int save(Commodity commodity) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(commodity);
		return id;
	}

	@Override
	public List<Commodity> findAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c from Commodity c");
		List<Commodity> clist = (List<Commodity>)query.list();
		return clist;
	}	
	
	/**
	 * 分页查询
	 */
	@Override
	public List<Commodity> findAllPaging(int currentPage,int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c from Commodity c");
		int startRow=(currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<Commodity> clist = (List<Commodity>)query.list();
		return clist;
	}
	
	/**
	 * 总数
	 */
	@Override
	public int getTotal() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c from Commodity c");
		List<Commodity> clist = (List<Commodity>)query.list();
		return clist.size();
	}
	
	@Override
	public Commodity get(int id) {
		Session session = sessionFactory.getCurrentSession();
		return (Commodity) session.get(Commodity.class, id);
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}



	

	

}
