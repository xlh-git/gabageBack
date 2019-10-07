package com.xlh.pojo;

public class UserAuthority {
private int id;
private int rid;
private int eid;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getRid() {
	return rid;
}
public void setRid(int rid) {
	this.rid = rid;
}
public int getEid() {
	return eid;
}
public void setEid(int eid) {
	this.eid = eid;
}
@Override
public String toString() {
	return "UserAuthority [id=" + id + ", rid=" + rid + ", eid=" + eid + "]";
}


}
