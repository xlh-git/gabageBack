package com.xlh.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xlh.pojo.FeedBackMessage;
import com.xlh.service.FeedbackService;

@Controller
public class FeedbackController {

	@Resource
	private FeedbackService feedbackServiceImpl;
	
	@RequestMapping("selAllFeedback")
	public void selAllFeedback(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<FeedBackMessage> selAll = feedbackServiceImpl.selAll();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(selAll);
		response.getWriter().write(result);
	}
	
	@ResponseBody
	@RequestMapping("updFeedback")
	public void updFeedback(String id,HttpServletResponse response) throws IOException {
	int updFeedback = feedbackServiceImpl.updFeedback(id);
	Map<String, Object> map = new HashMap<>();
	ObjectMapper mapper = new ObjectMapper();	
	if (updFeedback>0) {
		map.put("updInfo", "更新成功");
		}
	else {
		map.put("updInfo", "更新失败");
	}
	String result = mapper.writeValueAsString(map);
	response.getWriter().write(result);
	}
	
	@RequestMapping("delFeedback")
	public void delFeedback(String id,HttpServletResponse response) throws IOException {
		int delFeedback = feedbackServiceImpl.delFeedback(id);
		Map<String, Object> map = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();	
		if (delFeedback>0) {
			map.put("delInfo", "刪除成功");
	}
		else {
			map.put("delInfo", "刪除失败");
		}
		String result = mapper.writeValueAsString(map);
		response.getWriter().write(result);
	}
	
}
