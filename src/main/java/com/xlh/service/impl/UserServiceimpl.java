package com.xlh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xlh.mapper.ElementMapper;
import com.xlh.mapper.UrlMapper;
import com.xlh.mapper.UserMapper;
import com.xlh.pojo.Element;
import com.xlh.pojo.User;
import com.xlh.pojo.UserInfo;
import com.xlh.service.UserService;
@Service
public class UserServiceimpl implements UserService{
    @Resource
	private UserMapper userMapper;
    
    @Resource
    private UrlMapper urlMapper;
	
    @Resource 
    private ElementMapper elementMapper;
    
	@Override
	public Map<String, Object> login(User user) {
		Map<String,Object> map =new HashMap<>();
		User user1 = userMapper.selByUser(user);
		if (user1!=null) {
			user1.setElements(elementMapper.selByRid(user1.getId()));
			map.put("allUrl",urlMapper.selAll());
		}
		map.put("user", user1);
		return map;
	}
	@Override
	public List<UserInfo> selAllUser() {
	    List<UserInfo> selAllUser = userMapper.selAll();
		return selAllUser;
	}
	@Override
	public int addUser(UserInfo userInfo) {
		int addUser = userMapper.addUser(userInfo);
		if (addUser>0) 
		return 1;
		else
			return 0;
	}
	@Override
	public Boolean selByUsername(String username) {
		User user = userMapper.selByUsername(username);
		if (user!=null) {
			return true;
		}
		return false;
	}
	@Override
	public int delUserByUsername(String username) {
         int delUserByUsername = userMapper.delUserByUsername(username);		
		return delUserByUsername;
	}
@Override
	public List<Element> selAuthorityByrid(int rid) {
		List<Element> authority = elementMapper.selByRid(rid);
		return authority;
	}

}
