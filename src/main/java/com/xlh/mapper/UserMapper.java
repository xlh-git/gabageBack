package com.xlh.mapper;

import java.util.List;

import com.xlh.pojo.User;
import com.xlh.pojo.UserInfo;

public interface UserMapper {
	//通过用户信息查找用户
	User selByUser(User user);
	
	//查询全部的userInfo信息
	List<UserInfo> selAll();
	
	//新建一个用户
	int addUser(UserInfo userInfo);
	
	//通过用户名查询账户是否存在
	User selByUsername(String username);
	
	//更新用户信息
	
	//删除用户
	int delUserByUsername(String username);
}
