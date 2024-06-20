package com.example.getinstanceload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class GetInstanceLoadApplication {

    public static void main(String[] args) {
        SpringApplication.run(GetInstanceLoadApplication.class, args);
    }

}
