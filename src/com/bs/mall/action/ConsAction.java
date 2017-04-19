package com.bs.mall.action;

import java.util.List;

import com.bs.mall.entity.Commodity;
import com.bs.mall.entity.Consume;
import com.bs.mall.entity.Vip;
import com.bs.mall.service.CommodityService;
import com.bs.mall.service.VipService;
import com.bs.mall.utils.Pager;
import com.opensymphony.xwork2.ActionSupport;


public class ConsAction extends ActionSupport{
	private CommodityService commodityService;
	private VipService vipService;
	private List<Vip> vips;
	private List<Commodity> commodities;
	private Vip vip;
	private Commodity commodity;
	private int currentPage = 1;
	private Pager pager;
	private List<Consume> consumes;
	
	
	/**
	 * 购物页面准备
	 * @return
	 */
	public String shopping(){
		vips = vipService.findAll();
		commodities = commodityService.findAll();
		return SUCCESS;
	}
	
	/**
	 * 购物
	 * @return
	 */
	public String buyComm(){
		Vip v = vipService.getVip(vip.getVipid());
		Commodity c = commodityService.getComm(commodity.getCommodityId());
		Consume cons = new Consume();
		cons.setVip(v);
		cons.setCommodity(c);
		cons.setName(v.getName());
		cons.setPracticePrice(c.getPrice() * c.getAgio());
		cons.setPrice(c.getPrice());
		cons.setCommodityName(c.getCommodityName());
		
		vipService.saveConsume(cons);
		
		return shopping();
	}
	
	/**
	 * vip购物信息 
	 * @return
	 */
	public String infoVip(){
		int totalSize = vipService.getTotal();
		pager = new Pager(currentPage, totalSize);
		consumes = vipService.findAllPaging(currentPage, pager.getPageSize());
		return "vipInfo";
	}
	
	
	public CommodityService getCommodityService() {
		return commodityService;
	}
	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}
	public VipService getVipService() {
		return vipService;
	}
	public void setVipService(VipService vipService) {
		this.vipService = vipService;
	}
	public List<Vip> getVips() {
		return vips;
	}
	public void setVips(List<Vip> vips) {
		this.vips = vips;
	}
	public List<Commodity> getCommodities() {
		return commodities;
	}
	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	public Vip getVip() {
		return vip;
	}

	public void setVip(Vip vip) {
		this.vip = vip;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public List<Consume> getConsumes() {
		return consumes;
	}

	public void setConsumes(List<Consume> consumes) {
		this.consumes = consumes;
	}
	
}
