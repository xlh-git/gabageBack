package com.xlh.pojo;

public class FeedBackMessage {
private int id;
private String feedbackmessage;
private int fid;
private String name;
private int isread;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFeedbackmessage() {
	return feedbackmessage;
}
public void setFeedbackmessage(String feedbackmessage) {
	this.feedbackmessage = feedbackmessage;
}
public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}


public int getIsread() {
	return isread;
}
public void setIsread(int isread) {
	this.isread = isread;
}
@Override
public String toString() {
	return "FeedBackMessage [id=" + id + ", feedbackmessage=" + feedbackmessage + ", fid=" + fid + ", name=" + name
			+ ", isread=" + isread + "]";
}

}
