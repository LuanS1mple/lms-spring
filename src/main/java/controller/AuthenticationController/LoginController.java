package controller.AuthenticationController;

import constant.Message;
import constant.ResponseStatus;
import constant.UserRole;
import dto.request.LoginRequest;
import dto.response.LoginResponse;
import entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import service.IUserService;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private IUserService userService;
    @PostMapping("/authenticate")
    public String login(LoginRequest account, Model model, HttpSession session){
        boolean isCorrectAccount = userService.isCorrectAccount(account.getEmail(), account.getPassword());
        LoginResponse response;
        System.out.println(isCorrectAccount);
        if(isCorrectAccount){
//            response = LoginResponse.builder()
//                    .status(ResponseStatus.LOGIN_SUCCESS_STATUS.getStatus())
//                    .message(Message.LOGIN_SUCCESS.getMessage())
//                    .build();
//            model.addAttribute("response", response);
//            System.out.println(response);
            User user = userService.getByEmail(account.getEmail());
            if(user.getRole()== UserRole.USER.getCode()){
                session.setAttribute("userId", user.getId());
                return "redirect:/courses?userId="+user.getId();
            }
            else{
                return "admin_CM";
            }
        }
        else{
            response = LoginResponse.builder()
                    .status(ResponseStatus.LOGIN_FAIL_STATUS.getStatus())
                    .message(Message.LOGIN_FAIL.getMessage())
                    .build();
            model.addAttribute("response", response);
            System.out.println(response);
            return "login";
        }
    }
}
