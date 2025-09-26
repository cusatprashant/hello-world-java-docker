package com.myProject;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HomeControllerTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    void homeEndpointReturnsExpectedJson() {
        ResponseEntity<String> response = restTemplate.getForEntity("/", String.class);
        assertThat(response.getBody()).contains("\"success\":true");
        assertThat(response.getBody()).contains("\"hello\":\"world\"");
        assertThat(response.getBody()).contains("\"new-message\":\"A sample java application deployed with REST API, Maven and docker\"");
    }
}