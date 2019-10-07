package com.xlh.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xlh.service.UrlService;

@Controller
public class UrlController {
@Resource
private UrlService urlServiceimpl;
	@RequestMapping("selAllUrl")
	public String selAllUrl() {
		return "redirect:/main.jsp";
	}
}
