package controller.AuthenticationController;

import constant.Message;
import constant.ResponseStatus;
import dto.request.UserRequest;
import dto.response.UserResponse;
import entity.User;
import jakarta.validation.Valid;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.IUserService;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class RegisterController {
    @Autowired
    private IUserService userService;
    @Autowired
    private UserMapper userMapper;
    @PostMapping("register")
    public String register(@Valid UserRequest request, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors() || userService.isExistEmail(request.getEmail())){
            UserResponse response = UserResponse.builder()
                    .user(null)
                    .status(ResponseStatus.CREATED_USER_FAIl.getStatus())
                    .message(Message.CREATED_USER_FAIL.getMessage())
                    .build();
            model.addAttribute("response", response);
//            System.out.println(response);
//            bindingResult.getAllErrors().forEach(error -> {
//                System.out.println("Validation error: " + error.getDefaultMessage());
//            });
            return "user_CM";
        }
        else{
            User newUser = userMapper.userRequesttoUser(request);
            userService.add(newUser);
            UserResponse response = UserResponse.builder()
                    .user(newUser)
                    .status(ResponseStatus.CREATED_USER_SUCCESS.getStatus())
                    .message(Message.CREATED_USER_SUCCESS.getMessage())
                    .build();
            model.addAttribute("response", response);
//            System.out.println(response);
        }
        return "register";
    }
}
