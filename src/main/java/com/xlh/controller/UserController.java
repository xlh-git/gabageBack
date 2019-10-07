package com.xlh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.fabric.Response;
import com.xlh.pojo.Element;
import com.xlh.pojo.User;
import com.xlh.pojo.UserInfo;
import com.xlh.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userServiceimpl;

	@RequestMapping("login")
	public String login(User user, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, Object> map = userServiceimpl.login(user);
		if (map.get("user") != null) {
			session.setAttribute("user", map.get("user"));
			session.setAttribute("allUrl", map.get("allUrl"));
			return "redirect:/main.jsp";
		}
		return "redirect:/login.jsp?istrue=1";
	}

	// 返回全部用户的信息
	@RequestMapping("selAllUser")
	@ResponseBody
	public void selAllUser(HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");
		List<UserInfo> selAllUser = userServiceimpl.selAllUser();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(selAllUser);
		response.getWriter().write(result);
	}

	// 返回添加用户是否成功的信息
	@RequestMapping("addUser")
	@ResponseBody
	public void addUser(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		int rid = Integer.parseInt(request.getParameter("rid"));
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<>();
		int addUser = 0;
		UserInfo userInfo2 = new UserInfo();
		userInfo2.setUsername(username);
		userInfo2.setPassword(repassword);
		userInfo2.setRid(rid);
		if (username != "" & password != "") {
			addUser = userServiceimpl.addUser(userInfo2);
		}
		if (addUser == 0) {
			map.put("addInfo", "用户创建失败");
			String result = mapper.writeValueAsString(map);
			response.getWriter().write(result);
		}
	}

	// 通过账号名查询用户
	@RequestMapping("selByUsername")
	public void selByUsername(String username, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");
		if (username != "") {
			Boolean selByUsername = userServiceimpl.selByUsername(username);
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<>();
			if (selByUsername) {
				map.put("userInfo",0);
				
			} else {
				map.put("userInfo",1);
			}
			String result = mapper.writeValueAsString(map);
			response.getWriter().write(result);

		}
	}
	
	//通过用户名删除用户
	@RequestMapping("delUserByUsername")
	public void delUserByUsername(String username,HttpServletResponse response) throws IOException {
	  int delUserByUsername = userServiceimpl.delUserByUsername(username);	
	  response.setContentType("application/json; charset=UTF-8");
	  ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<>();
		if (delUserByUsername>0) {
			map.put("delUser", "删除用户成功");
		}
		else {
			map.put("delUser", "删除用户失败");
		}
		String result = mapper.writeValueAsString(map);
		response.getWriter().write(result);
		}
	//查询不同角色的权限
	@RequestMapping("selAuthorityByrid")
	public void selAuthorityByrid(int rid, HttpServletResponse response) throws IOException {
		List<Element> selAuthorityByrid = userServiceimpl.selAuthorityByrid(rid);
		String eid="";
		for (Element element : selAuthorityByrid) {
			eid=eid+(eid==""?"":",")+element.getId();
		}	
		 ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<>();
			map.put("eid", eid);
			String result = mapper.writeValueAsString(map);
		response.getWriter().write(result);
	}
}
