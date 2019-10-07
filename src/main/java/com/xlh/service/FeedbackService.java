package com.xlh.service;

import java.util.List;

import com.xlh.pojo.FeedBackMessage;

public interface FeedbackService {

	List<FeedBackMessage> selAll();

	int updFeedback(String id);

	int delFeedback(String id);
}
