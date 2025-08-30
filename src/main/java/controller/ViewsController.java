package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewsController {
    @GetMapping("/admin-course-submissionAss")
    public String adminCourseSubmissionAss() {
        return "admin-course-submissionAss";
    }

    @GetMapping("/new-assignment")
    public String adminNewAssignment() {
        return "new-assignment";
    }

    @GetMapping("/new-course-test")
    public String adminNewCourseTest() {
        return "admin-new-courseTest";
    }

    @GetMapping("/admin-cd")
    public String adminCD() {
        return "admin_CD";
    }

    @GetMapping("/admin-cm")
    public String adminCM() {
        return "admin_CM";
    }

    @GetMapping("/admin-home")
    public String adminHome() {
        return "admin_home";
    }

    @GetMapping("/admin-um")
    public String adminUM() {
        return "admin_UM";
    }

    @GetMapping("/class-detail-student")
    public String classDetailStudent() {
        return "class-detail-student";
    }

    @GetMapping("/class-detail-teacher")
    public String classDetailTeacher() {
        return "class-detail-teacher";
    }

    @GetMapping("/class-user")
    public String classUser() {
        return "class_user";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/navbar")
    public String nav() {
        return "navbar";
    }

    @GetMapping("/navbar-user")
    public String navbarUser() {
        return "navbar-user";
    }

    @GetMapping("/navbar-admin")
    public String navbarAdmin() {
        return "navbar_admin";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/submission-teacher")
    public String submissionTeacher() {
        return "submission-teacher";
    }

    @GetMapping("/user-browser-couses")
    public String userBrowserCouses() {
        return "user-browser-couses";
    }

    @GetMapping("/user-cd")
    public String userCD() {
        return "user_CD";
    }

    @GetMapping("/user-cm")
    public String userCM() {
        return "user_CM";
    }
}
