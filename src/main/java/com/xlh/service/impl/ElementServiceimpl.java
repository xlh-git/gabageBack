package com.xlh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xlh.mapper.ElementMapper;
import com.xlh.pojo.Element;
import com.xlh.service.ElementService;

@Service
public class ElementServiceimpl implements ElementService{
@Resource
private ElementMapper elementMapper;
	@Override
	public List<Element> selByRid(int rid) {
		List<Element> selByRid = elementMapper.selByRid(rid);
		return selByRid;
	}
}
