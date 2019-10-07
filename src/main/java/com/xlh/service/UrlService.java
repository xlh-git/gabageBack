package com.xlh.service;

import java.util.List;

import com.xlh.pojo.Url;


public interface UrlService {
    //查询url表中的全部信息
	List<Url> selAll();	
 	//通过rid查询是否拥有该url
	List<Url> selUrlByRid(int rid);

}
