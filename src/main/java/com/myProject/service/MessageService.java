package com.myProject.service;

import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

@Service
public class MessageService {
    public Map<String, Object> getHomeMessage() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("hello", "world");
        response.put("new-message", "A sample java application deployed with REST API, Maven and docker");
        return response;
    }
}