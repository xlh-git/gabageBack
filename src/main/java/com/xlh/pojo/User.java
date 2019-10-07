package com.xlh.pojo;

import java.util.List;

//用户实体类
public class User {
private int id;
private String username;
private String password;
private int rid;
List<Url> urls;
List<Element> elements;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}


public int getRid() {
	return rid;
}
public void setRid(int rid) {
	this.rid = rid;
}
public List<Url> getUrls() {
	return urls;
}
public void setUrls(List<Url> urls) {
	this.urls = urls;
}

public List<Element> getElements() {
	return elements;
}
public void setElements(List<Element> elements) {
	this.elements = elements;
}
@Override
public String toString() {
	return "User [id=" + id + ", username=" + username + ", password=" + password + ", rid=" + rid + ", urls=" + urls
			+ ", elements=" + elements + "]";
}

}
