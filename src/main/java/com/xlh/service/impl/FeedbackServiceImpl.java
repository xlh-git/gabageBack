package com.xlh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xlh.mapper.FeedbackMapper;
import com.xlh.pojo.FeedBackMessage;
import com.xlh.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Resource
	private FeedbackMapper feedbackMapper;

	@Override
	public List<FeedBackMessage> selAll() {
		List<FeedBackMessage> selAll = feedbackMapper.selAll();
		return selAll;
	}

	@Override
	public int updFeedback(String id) {
		int updFeedbackById = feedbackMapper.updFeedbackById(id);
		return updFeedbackById;
	}

	@Override
	public int delFeedback(String id) {
		int delFeedbackById = feedbackMapper.delFeedbackById(id);
		return delFeedbackById;
	}

}
