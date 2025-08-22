package controller.UserControlelr;

import constant.Message;
import constant.ResponseStatus;
import dto.response.ApiResponse;
import entity.EnrollClassRoom;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.IEnrollClassRoomSerivce;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private IEnrollClassRoomSerivce enrollClassRoomSerivce;
    @PostMapping("change")
    public String changeRole(@RequestParam int userId, @RequestParam int classId, Model model){
        ApiResponse<EnrollClassRoom> response;
            EnrollClassRoom enrollClassRoom =enrollClassRoomSerivce.switchRole(userId,classId);
            response = ApiResponse.<EnrollClassRoom>builder()
                    .data(enrollClassRoom)
                    .status(ResponseStatus.CHANGE_ROLE_SUCESS.getStatus())
                    .message(Message.CHANGE_ROLE_SUCCESS.getMessage())
                    .build();

        System.out.println(response);
        return "redirect:/class-room/"+classId;
    }
}
