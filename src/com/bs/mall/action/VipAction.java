package com.bs.mall.action;

import java.util.Date;

import com.bs.mall.entity.Vip;
import com.bs.mall.service.VipService;
import com.opensymphony.xwork2.ActionSupport;

public class VipAction extends ActionSupport{
	private Vip vip;
	private VipService vipService;
	private String message;
	
	/**
	 * 添加会员
	 * @return
	 */
	public String addVip(){
		Vip v = new Vip();
		v.setName(vip.getName());
		v.setAge(vip.getAge());
		v.setProfession(vip.getProfession());
		v.setJoinTime(new Date());
		vipService.addVip(v);
		vip = new Vip();
		message = "添加会员成功";
		return SUCCESS;
	}
	
	
	public Vip getVip() {
		return vip;
	}
	public void setVip(Vip vip) {
		this.vip = vip;
	}
	public VipService getVipService() {
		return vipService;
	}
	public void setVipService(VipService vipService) {
		this.vipService = vipService;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
