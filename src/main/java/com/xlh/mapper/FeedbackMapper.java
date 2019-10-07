package com.xlh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xlh.pojo.FeedBackMessage;

public interface FeedbackMapper {
	
	@Select("select fm.id,name,fm.feedbackmessage,isread from  feedbackMessage fm LEFT JOIN feedback f on fid=f.id")
	List<FeedBackMessage> selAll();
	
	@Update("update feedbackmessage SET isread =0 where id=#{id}")
	int updFeedbackById(String id);
	
	@Delete("delete from feedbackmessage WHERE id=#{id}")
	int delFeedbackById(String id);
}
