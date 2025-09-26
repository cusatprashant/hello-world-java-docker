package com.myProject.controller;

import com.myProject.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
public class HomeController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public Map<String, Object> home() {
        return messageService.getHomeMessage();
    }
}