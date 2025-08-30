package controller.UserControlelr;


import constant.Message;
import constant.ResponseStatus;
import dto.request.UserUpdateRequest;
import dto.response.ApiResponse;
import entity.User;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.IUserService;

@Controller
@RequestMapping("personal")
public class UserInfoController {
    @Autowired
    private IUserService userService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @GetMapping("info")
    public String getPersonalDate(HttpSession session, Model model){
        int userId =(int) session.getAttribute("userId");
        User user = userService.getById(userId);
        ApiResponse<User> response = ApiResponse.<User>builder()
                .data(user)
                .message(Message.GET_USERS_SUCCESS.getMessage())
                .status(ResponseStatus.GET_USERS_SUCCESS.getStatus())
                .build();
        model.addAttribute("response",response);
        return "user-info";
    }
    @PostMapping("update")
    public String updatePersonalData(@ModelAttribute @Valid UserUpdateRequest request, HttpSession session, Model model){
        int userId =(int) session.getAttribute("userId");
        User user = userService.getById(userId);
        String rawPw = user.getPassword();
        String newPw = request.getNewPassword();
        String fillPw = request.getOldPassword();
        if(isWannaChangePassword(newPw)){
            if(!isMatchedPassword(rawPw,fillPw)){
                return "redirect:/personal/info";
            }
        }
        userMapper.updateFromRequest(request,user,isWannaChangePassword(newPw));
        ApiResponse<User> response = ApiResponse.<User>builder()
                .data(userService.save(user))
                .message(Message.GET_USERS_SUCCESS.getMessage())
                .status(ResponseStatus.GET_USERS_SUCCESS.getStatus())
                .build();
        model.addAttribute("response",response);
        return "user-info";
    }
    public boolean isWannaChangePassword(String newpw){
        if(newpw == null || newpw.isBlank()) return false;
        return true;
    }
    public boolean isMatchedPassword(String rawPw, String filledPw){
        if(filledPw == null || filledPw.isBlank()) return false;
        return passwordEncoder.matches(filledPw,rawPw);
    }
}
