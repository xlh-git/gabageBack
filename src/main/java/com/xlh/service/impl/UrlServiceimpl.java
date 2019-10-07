package com.xlh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xlh.mapper.UrlMapper;
import com.xlh.mapper.UserMapper;
import com.xlh.pojo.Url;
import com.xlh.service.UrlService;
@Service
public class UrlServiceimpl implements UrlService{
@Resource
private UrlMapper urlMapper;
	@Override
	public List<Url> selAll() {
		List<Url> selAll = urlMapper.selAll();
		return selAll;
	}
	@Override
	public List<Url> selUrlByRid(int rid) {
        List<Url> selByRid = urlMapper.selByRid(rid);
		return selByRid;
	}
   
}
