package controller.AdminController;

import constant.Message;
import constant.ResponseStatus;
import dto.request.UserRequest;
import dto.response.ApiResponse;
import dto.response.DashBoardUser;
import entity.User;
import exception.AppException;
import exception.ErrorCode;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import service.IUserService;

import java.util.List;

@Controller
@RequestMapping("users")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private UserMapper userMapper;
    @GetMapping("all")
    public String getAllUser(Model model){
        ApiResponse<DashBoardUser> response;
            List<User> users = userService.getAll();
            response =  ApiResponse.<DashBoardUser>builder()
                    .status(ResponseStatus.GET_USER_SUCCESS.getStatus())
                    .message(Message.GET_USERS_SUCCESS.getMessage())
                    .data(DashBoardUser.builder()
                            .users(users)
                            .totalUserActive(userService.countActive())
                            .totalUser(userService.countAll())
                            .totalAdmin(userService.countAdmin())
                            .build())
                    .build();

        model.addAttribute("response", response);
        return "admin_UM";
    }
    @PostMapping("add")
    public String addUser(@RequestBody UserRequest request, BindingResult bindingResult, Model model){
        ApiResponse<User> response;
            if(bindingResult.hasErrors()) throw new AppException(ErrorCode.INVALID_INPUT);
            User newUser = userMapper.userRequesttoUser(request);
            response = ApiResponse.<User>builder()
                    .data(userService.save(newUser))
                    .status(ResponseStatus.CREATED_USER_SUCCESS.getStatus())
                    .message(Message.CREATED_USER_SUCCESS.getMessage())
                    .build();
        model.addAttribute("response",response);
        return "admin_UM";

    }
    @DeleteMapping("{id}")
    public String deleteUser(@PathVariable int id, Model model){
        System.out.println(id);
        ApiResponse<User> response;
            User user = userService.getById(id);
            userService.remove(user);
            response = ApiResponse.<User>builder()
                    .data(null)
                    .status(ResponseStatus.DELETE_USER_SUCCESS.getStatus())
                    .message(Message.DELETE_USER_SUCCESS.getMessage())
                    .build();
        model.addAttribute("response",response);
        return "admin_UM";
    }
    @GetMapping("all/search")
    public String getSearchUser(Model model, @RequestParam int role,@RequestParam String name){
        ApiResponse<DashBoardUser> response;
        List<User> users = userService.findByRoleAndName(role,name);
        response =  ApiResponse.<DashBoardUser>builder()
                .status(ResponseStatus.GET_USER_SUCCESS.getStatus())
                .message(Message.GET_USERS_SUCCESS.getMessage())
                .data(DashBoardUser.builder()
                        .users(users)
                        .totalUserActive(userService.countActive())
                        .totalUser(userService.countAll())
                        .totalAdmin(userService.countAdmin())
                        .build())
                .build();

        model.addAttribute("response", response);
        return "admin_UM";
    }
}
