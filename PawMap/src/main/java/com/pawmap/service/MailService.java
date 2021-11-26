package com.pawmap.service;

import java.util.Map;

public interface MailService {
	public Map<String, Object> send(String email, String title, String body);
}