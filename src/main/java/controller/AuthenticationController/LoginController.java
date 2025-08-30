package controller.AuthenticationController;

import config.AuthenticationConfig.JwtService;
import constant.Message;
import constant.ResponseStatus;
import constant.UserRole;
import dto.request.LoginRequest;
import dto.response.LoginResponse;
import entity.User;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.IUserService;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private IUserService userService;
    @Autowired
    private JwtService jwtService;
    @GetMapping("/authenticate")
    public String login(/*LoginRequest account,*/ Model model, HttpSession session, HttpServletResponse httpResponse){
//        boolean isCorrectAccount = userService.isCorrectAccount(account.getEmail(), account.getPassword());
//        LoginResponse response;
//        System.out.println(isCorrectAccount);
//        if(isCorrectAccount){
////            response = LoginResponse.builder()
////                    .status(ResponseStatus.LOGIN_SUCCESS_STATUS.getStatus())
////                    .message(Message.LOGIN_SUCCESS.getMessage())
////                    .build();
////            model.addAttribute("response", response);
////            System.out.println(response);
//            User user = userService.getByEmail(account.getEmail());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User user = userService.getByEmail(email);
        jwtService.killAllKindOfToken(user.getId());
            String accessToken = jwtService.generateJwt(user);
            jwtService.save(accessToken, user);
            String refreshToken = jwtService.generateRefreshToken(user);

            addCookies(httpResponse,accessToken,refreshToken);
            if(user.getRole()== UserRole.USER.getCode()){
                session.setAttribute("userId", user.getId());
                return "redirect:/courses?userId="+user.getId();
            }
            else{
                return "admin_CM";
            }
//        else{
//            response = LoginResponse.builder()
//                    .status(ResponseStatus.LOGIN_FAIL_STATUS.getStatus())
//                    .message(Message.LOGIN_FAIL.getMessage())
//                    .build();
//            model.addAttribute("response", response);
//            System.out.println(response);
//            return "login";
//        }
    }
    public void addCookies(HttpServletResponse response, String accessToken, String refreshToken) {
        Cookie accessCookie = new Cookie("accessToken", accessToken);
        accessCookie.setHttpOnly(true);
        accessCookie.setSecure(true);
        accessCookie.setPath("/");
        accessCookie.setMaxAge(60 * 15);

        Cookie refreshCookie = new Cookie("refreshToken", refreshToken);
        refreshCookie.setHttpOnly(true);
        refreshCookie.setSecure(true);
        refreshCookie.setPath("/");
        refreshCookie.setMaxAge(60 * 60 * 24 * 7);

        response.addCookie(accessCookie);
        response.addCookie(refreshCookie);
    }
}
