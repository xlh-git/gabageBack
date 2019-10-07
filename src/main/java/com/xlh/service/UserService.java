package com.xlh.service;

import java.util.List;
import java.util.Map;

import com.xlh.pojo.Element;
import com.xlh.pojo.User;
import com.xlh.pojo.UserInfo;

public interface UserService {
	
	//账户密码不匹配,登录时使用
	int ACCOUNT_PASSWORD_NOT_MATCH=1;
	
	//注册账号成功
	int REGISTER_SUCESS=2;
	
	//注册账号失败
	int REGISTER_ERROR=3;
	
	//账号已存在,注册时使用
	int ACCOUNT_EXIST=4;
	
    //验证登录
	Map<String,Object> login(User user);
	
	//查询全部用户
	List<UserInfo> selAllUser();
	
	//添加用户
	int addUser(UserInfo userInfo);
	
	//通过账号来查询用户是否存在
	Boolean selByUsername(String username);
	
	//删除用户
	int delUserByUsername(String username);
	
	//通过角色id查询用户权限
	List<Element>  selAuthorityByrid(int rid);
	
}
