package com.xlh.pojo;

public class GarbageType {
private int id;
private String name;
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
@Override
public String toString() {
	return "GarbageType [id=" + id + ", name=" + name + "]";
}

}
