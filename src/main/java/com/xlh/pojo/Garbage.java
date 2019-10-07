package com.xlh.pojo;

public class Garbage {
private int id;
private String name;
private  int tid;
private int count;
private int ishot;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getTid() {
	return tid;
}
public void setTid(int tid) {
	this.tid = tid;
}

public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public int getIshot() {
	return ishot;
}
public void setIshot(int ishot) {
	this.ishot = ishot;
}
@Override
public String toString() {
	return "Garbage [id=" + id + ", name=" + name + ", tid=" + tid + ", count=" + count + ", ishot=" + ishot + "]";
}

}
