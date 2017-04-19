package com.bs.mall.action;

import java.util.List;

import com.bs.mall.entity.Commodity;
import com.bs.mall.service.CommodityService;
import com.bs.mall.utils.Pager;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CommodityService commodityService;
	private Commodity commodity;
	private List<Commodity> commList;
	private int currentPage=1;
	private Pager pager;
	private String errmess;
	
	

	public String addCommodity(){
		if(commodity.getAgio()>1 || commodity.getAgio()<0){
			errmess = "折扣数值不正确";
			commodity = new Commodity();
			return "err";
		} else{
			Commodity comm = new Commodity();
			comm.setCommodityName(commodity.getCommodityName());
			comm.setPrice(commodity.getPrice());
			comm.setAgio(commodity.getAgio());	
			commodityService.saveCommodity(comm);	
			return commodityList();
		}
	}
	
	public String commodityList(){
		int totalSize = commodityService.getTotal();
		pager = new Pager(currentPage, totalSize);
		commList = commodityService.findAllPaging(currentPage, pager.getPageSize());
		return SUCCESS;
	}
	
	public List<Commodity> getCommList() {
		return commList;
	}

	public void setCommList(List<Commodity> commList) {
		this.commList = commList;
	}
			
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public CommodityService getCommodityService() {
		return commodityService;
	}

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public String getErrmess() {
		return errmess;
	}

	public void setErrmess(String errmess) {
		this.errmess = errmess;
	}	
	
}
