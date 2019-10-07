package com.xlh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xlh.mapper.GarbageMapper;
import com.xlh.pojo.Garbage;
import com.xlh.pojo.GarbageInfo;
import com.xlh.service.GarbageService;

@Service
public class GarbageServiceimpl implements GarbageService {
	@Resource
	GarbageMapper garbageMapper;

	@Override
	public List<GarbageInfo> show() {
		List<GarbageInfo> selAll = garbageMapper.selAll();
		return selAll;
	}

	@Override
	public List<GarbageInfo> selByName(String name, int pageStart, int pageSize) {
		List<GarbageInfo> selByName = garbageMapper.selByName(name, pageStart, pageSize);
		return selByName;
	}

	@Override
	public List<GarbageInfo> selByTypeId(String tid, int pageStart, int pageSize) {
		List<GarbageInfo> selByTypeId = garbageMapper.selByTypeId(tid, pageStart, pageSize);
		return selByTypeId;
	}

	
	@Override
	public List<GarbageInfo> selByNameAndType(String tid, String name) {
		List<GarbageInfo> selByNameAndType = garbageMapper.selByNameAndType(tid, name);
		return selByNameAndType;
	}
	 

	@Override
	public List<GarbageInfo> selByRealName(String name) {
		List<GarbageInfo> selByRealName = garbageMapper.selByRealName(name);
		return selByRealName;
	}

	@Override
	public boolean addGarbage(Garbage garbage) {
		int addGarbage = garbageMapper.addGarbage(garbage);
		if (addGarbage > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delGarbage(String name) {
		int delGarbage = garbageMapper.delGarbage(name);
		if (delGarbage > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updGarbage(Garbage garbage) {
		int updGarbage = garbageMapper.updGarbage(garbage);
		if (updGarbage > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int selCountByTid(String tid) {
		int selCountByTid = garbageMapper.selCountByTid(tid);
		return selCountByTid;
	}

	@Override
	public int selCountByName(String name) {
       int selCountByName = garbageMapper.selCountByName(name);
		return selCountByName;
	}

	@Override
	public int selCountByNameAndTid(String tid, String name) {
        int selCountByNameAndTid = garbageMapper.selCountByNameAndTid(tid, name);
		return selCountByNameAndTid;
	}
}
