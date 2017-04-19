package com.bs.mall.action;

import java.nio.channels.SeekableByteChannel;
import java.util.List;
import java.util.Map;

import com.bs.mall.entity.Role;
import com.bs.mall.entity.Users;
import com.bs.mall.service.UserService;
import com.bs.mall.utils.Pager;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{

	/**
	 * 序列
	 */
	private static final long serialVersionUID = 1L;
	private Users user;
	private UserService userService;
	private String loginErr;
	private Pager pager;
	private int currentPage = 1;
	private List<Users> users;
	
	/**
	 * 登陆
	 * @return
	 */
	public String login(){
		Users u = userService.login(user.getUsername(), user.getPassword());
		if(u == null){
			loginErr = "用户名或密码错误";
			return Action.LOGIN;
		} else {
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("us", u);
			loginErr = "";
			return SUCCESS;
		}
	}
	
	/**
	 * 退出
	 * @return
	 */
	public String logout(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		loginErr = "";
		session.remove("us");
		return Action.LOGIN;
	}
	
	/**
	 * 分页用户列表
	 * @return
	 */
	public String userList(){
		int totalSize = userService.getTotal();
		pager = new Pager(currentPage, totalSize);
		users = userService.findAllPaging(currentPage, pager.getPageSize());
		return SUCCESS;
	}
	
	/**
	 * 修改用户页面准备
	 * @return
	 */
	public String editUser(){
		Users u = userService.getUserByName(user.getUsername());
		user.setUsername(u.getUsername());
		user.setPassword(u.getPassword());
		user.setRole(u.getRole());
		return SUCCESS;
	}
	
	/**
	 * 保存和修改用户
	 * @return
	 */
	public String save(){
		Users u = new Users();
		Role role = new Role();
		u.setUsername(user.getUsername());
		u.setPassword(user.getPassword());
		role = userService.getRoleByName(user.getRole().getRoles());
		u.setRole(role);
		userService.saveOrUpdate(u);
		return userList();
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getLoginErr() {
		return loginErr;
	}

	public void setLoginErr(String loginErr) {
		this.loginErr = loginErr;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}	
	
	
}
