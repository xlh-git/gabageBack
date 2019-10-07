package com.xlh.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.xlh.pojo.Garbage;
import com.xlh.pojo.GarbageInfo;
import com.xlh.pojo.UserInfo;

public interface GarbageService {
	
//显示所需要的信息
List<GarbageInfo> show();

//通过名字来模糊查询垃圾种类
List<GarbageInfo> selByName(String name,int pageStart, int pageSize);

//通过类型来查询
List<GarbageInfo> selByTypeId(String tid, int pageStart, int pageSize);

//通过名字和类型来查询
List<GarbageInfo> selByNameAndType(String tid,String name);

//通过名字来准确查询垃圾种类
List<GarbageInfo> selByRealName(String name);

//添加垃圾
boolean addGarbage(Garbage garbage);

//删除垃圾
boolean delGarbage(String name);

//更新操作
boolean updGarbage(Garbage garbage);

//通过查询Tid查询总量
int selCountByTid(String tid);

//通过查询名字查询总量
int selCountByName(String name);

//通过查询名字和类型查询总量
int selCountByNameAndTid(String tid,String name);
}
