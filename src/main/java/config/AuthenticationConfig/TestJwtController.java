//package config.AuthenticationConfig;
//
//import dto.request.LoginRequest;
//import entity.User;
//import jakarta.servlet.http.Cookie;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//import service.IUserService;
//
//@RestController
//@RequestMapping("jwt")
//public class TestJwtController {
//    @GetMapping()
//    public String test(){
//        return "Ok";
//    }
//    @Autowired
//    private IUserService userService;
//    @Autowired
//    private JwtService jwtService;
//    @PostMapping("/authenticate")
//    public String login(@RequestBody LoginRequest account, HttpSession session, HttpServletResponse response){
//        boolean isCorrectAccount = userService.isCorrectAccount(account.getEmail(), account.getPassword());
//        System.out.println(isCorrectAccount);
//        if(isCorrectAccount){
////            response = LoginResponse.builder()
////                    .status(ResponseStatus.LOGIN_SUCCESS_STATUS.getStatus())
////                    .message(Message.LOGIN_SUCCESS.getMessage())
////                    .build();
////            model.addAttribute("response", response);
////            System.out.println(response);
//            User user = userService.getByEmail(account.getEmail());
//            String accessToken = jwtService.generateJwt(user);
//            Cookie cookie = new Cookie("accessToken", accessToken);
//            cookie.setHttpOnly(true);
//            cookie.setPath("/");
//            cookie.setMaxAge(60*60);
//            cookie.setSecure(true);
//            response.addCookie(cookie);
//            return "success";
//        }
//        else {
//            return "Cac";
//        }
//    }
//
//}
//
