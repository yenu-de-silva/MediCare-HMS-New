package org.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootAp plication
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
        System.out.println("🏥 MediCare+ Backend Started!");
        System.out.println("🌐 API Base URL: http://localhost:8080/api");
    }
}