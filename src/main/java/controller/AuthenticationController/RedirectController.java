package controller.AuthenticationController;

import constant.UserRole;
import entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.IUserService;

@Controller
@RequestMapping("redirect")
public class RedirectController {
    @Autowired
    private IUserService userService;

    @GetMapping("home")
    public String redirectToHome(HttpSession session){
        int userId =(int) session.getAttribute("userId");
        User user = userService.getById(userId);
        if(user.getRole()== UserRole.USER.getCode()){
            session.setAttribute("userId", user.getId());
            return "redirect:/courses?userId="+user.getId();
        }
        else{
            return "admin_CM";
        }
    }
    @GetMapping("access-denied")
    public String redirectTo403(HttpSession session){
        return "403";
    }
}
