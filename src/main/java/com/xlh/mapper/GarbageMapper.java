package com.xlh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xlh.pojo.Garbage;
import com.xlh.pojo.GarbageInfo;

//后台使用的
public interface GarbageMapper {
//查询表所需要的信息  包括垃圾名称和垃圾种类 
List<GarbageInfo> selAll();

//通过模糊垃圾名称查询垃圾种类
List<GarbageInfo> selByName(@Param("name")String name,@Param("pageStart") int pageStart ,@Param("pageSize")int pageSize);

//通过查询垃圾种类来查询其中包含的垃圾
List<GarbageInfo> selByTypeId(@Param("tid")String tid,@Param("pageStart") int pageStart ,@Param("pageSize")int pageSize);

//通过查询垃圾种类和垃圾名称查询
List<GarbageInfo> selByNameAndType(@Param("tid")String tid,@Param("name")String name);

//通过查询名字来查询垃圾
List<GarbageInfo> selByRealName(@Param("name")String name);

//添加垃圾
int addGarbage(Garbage garbage);

//通过名字来删除垃圾
int delGarbage(@Param("name")String name);

//通过gname来更新垃圾信息
int updGarbage(Garbage garbage);

//通过查询Tid查询总量
int selCountByTid(@Param("tid")String tid);

//通过查询名字查询总量
int selCountByName(@Param("name")String name);

//通过查询名字和垃圾种类来查询条数
int selCountByNameAndTid(@Param("tid")String tid,@Param("name")String name);

}
