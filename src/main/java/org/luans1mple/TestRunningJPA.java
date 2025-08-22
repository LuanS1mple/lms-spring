package org.luans1mple;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import repositories.*;

import java.util.List;

//@SpringBootApplication
//@EnableJpaRepositories(basePackages = "repositories")
//@EntityScan(basePackages = "entity") // hoặc package chứa entity của bạn
//public class TestRunningJPA implements CommandLineRunner {
//
//    @Autowired
//    private IAssignmentRepository dao;
//
//    public static void main(String[] args) {
//        SpringApplication.run(TestRunningJPA.class, args);
//    }
//
//    @Override
//    public void run(String... args) throws Exception {
////        dao.delete(5);
//        System.out.println(dao.getAssignmentByClass(1));
//    }
//}