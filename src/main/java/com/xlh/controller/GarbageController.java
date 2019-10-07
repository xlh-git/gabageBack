package com.xlh.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xlh.pojo.Garbage;
import com.xlh.pojo.GarbageInfo;
import com.xlh.service.GarbageService;
import com.xlh.service.impl.GarbageServiceimpl;

@Controller
public class GarbageController {
	@Resource
	private GarbageService GarbageServiceimpl;

	@ResponseBody
	@RequestMapping("selAll")
	public void selAll(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<GarbageInfo> show = GarbageServiceimpl.show();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(show);
		response.getWriter().write(result);
	}

	@ResponseBody
	@RequestMapping("selByName")
	public void selByName(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		//name = new String(name.getBytes("iso8859-1"), "UTF-8");
		
		int pageSize = Integer.parseInt(request.getParameter("nums"));
		int pageStart = pageSize * (Integer.parseInt(request.getParameter("curr")) - 1);
		List<GarbageInfo> selByName = GarbageServiceimpl.selByName(name, pageStart, pageSize);
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(selByName);
		response.getWriter().write(result);
	}

	
	@RequestMapping("selByNameAndType")
	public void selByNameAndType(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		//name = new String(name.getBytes("iso8859-1"), "UTF-8");
		String tid = request.getParameter("tid");
		List<GarbageInfo> selByNameAndType = GarbageServiceimpl.selByNameAndType(tid, name);
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(selByNameAndType);
		response.getWriter().write(result);
	}

	@ResponseBody
	@RequestMapping("selByTypeId")
	public void selByTypeId(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		String tid = request.getParameter("tid");	
		int pageSize = Integer.parseInt(request.getParameter("nums"));
		int pageStart = pageSize * (Integer.parseInt(request.getParameter("curr")) - 1);
		List<GarbageInfo> selByTypeId = GarbageServiceimpl.selByTypeId(tid, pageStart, pageSize);
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(selByTypeId);	
	
		response.getWriter().write(result);
	}

	@ResponseBody
	@RequestMapping("selByRealName")
	public void selByRealName(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		// name=new String(name.getBytes("iso8859-1"),"UTF-8");	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<>();
		List<GarbageInfo> selByRealName = GarbageServiceimpl.selByRealName(name);
		if (selByRealName.size() > 0) {
			map.put("chekInfo", 0);
			String result = mapper.writeValueAsString(map);
			response.getWriter().write(result);
		} else {
			map.put("checkInfo", 1);
			String result = mapper.writeValueAsString(map);
			response.getWriter().write(result);
		}
	}

	@ResponseBody
	@RequestMapping("addGarbage")
	public void addGarbage(Garbage garbage, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		Map<String, Object> map = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		if (garbage != null) {
			boolean addGarbage = GarbageServiceimpl.addGarbage(garbage);
			if (addGarbage) {
				map.put("addInfo", "添加物品成功");
			
			}
			else {
				map.put("addInfo", "添加物品失败");
			}			
			String result = mapper.writeValueAsString(map);
			response.getWriter().write(result);
			
			
		}

	}

	@ResponseBody
	@RequestMapping("delGarbage")
	public void delGarbage(String name, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		//name = new String(name.getBytes("iso8859-1"), "UTF-8");
		Map<String, Object> map = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		boolean delGarbage = GarbageServiceimpl.delGarbage(name);
		if (delGarbage) {
			map.put("delInfo", "删除成功");
		} else {
			map.put("delInfo", "删除失败");
		}
		String result = mapper.writeValueAsString(map);
		response.getWriter().write(result);
	}

	@ResponseBody
	@RequestMapping("updGarbage")
	public void updGarbage(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		 response.setContentType("application/json; charset=UTF-8");
		String name = request.getParameter("name");
		String tname = request.getParameter("tname");
		int count = Integer.parseInt(request.getParameter("count"));
		int id = Integer.parseInt(request.getParameter("id"));
		//name = new String(name.getBytes("iso8859-1"), "UTF-8");
		//tname = new String(tname.getBytes("iso8859-1"), "UTF-8");
		Integer tid = null;
		switch (tname) {
		case "可回收物":
			tid = 1;
			break;
		case "有害垃圾":
			tid = 2;
			break;
		case "湿垃圾":
			tid = 3;
			break;
		case "干垃圾":
			tid = 4;
			break;
		}
		Garbage garbage = new Garbage();
		garbage.setCount(count);
		garbage.setId(id);
		garbage.setName(name);
		garbage.setTid(tid);
		boolean updGarbage = GarbageServiceimpl.updGarbage(garbage);
		Map<String, Object> map = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		if (updGarbage) {
			map.put("updInfo", "更新成功");
		}
		else {
			map.put("updInfo", "更新失败");
		}
		String result = mapper.writeValueAsString(map);
		response.getWriter().write(result);
	}
	
	@ResponseBody
	@RequestMapping("selCountByTid")
    public void selCountByTid(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String tid = request.getParameter("tid");
	    int selCountByTid = GarbageServiceimpl.selCountByTid(tid);
		response.getWriter().write("{\"total\":"+selCountByTid+"}");
	
	}
	
	@ResponseBody
	@RequestMapping("selCountByName")
	public void selCountByName(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		int selCountByName = GarbageServiceimpl.selCountByName(name);	
		response.getWriter().write("{\"total\":"+selCountByName+"}");
	}
	
	@ResponseBody
	@RequestMapping("selCountByNameAndTid")
	public void selCountByNameAndTid(String tid,String name,HttpServletResponse response) throws IOException {
		int selCountByNameAndTid = GarbageServiceimpl.selCountByNameAndTid(tid, name);
		response.getWriter().write("{\"total\":"+selCountByNameAndTid+"}");
	}
}

