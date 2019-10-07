package com.xlh.pojo;

public class Element {
private int id;
private String eleno;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getEleno() {
	return eleno;
}
public void setEleno(String eleno) {
	this.eleno = eleno;
}
@Override
public String toString() {
	return "Element [id=" + id + ", eleno=" + eleno + "]";
}
}
