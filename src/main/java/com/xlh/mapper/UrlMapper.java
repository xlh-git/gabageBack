package com.xlh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.xlh.pojo.Url;

public interface UrlMapper {
	@Select("select * from url where id in(select uid from role_url where rid=#{0})")
    List<Url> selByRid(int rid);
	@Select("select * from url")
	List<Url> selAll();
}
