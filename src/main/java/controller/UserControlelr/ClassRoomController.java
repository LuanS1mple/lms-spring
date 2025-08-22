package controller.UserControlelr;

import constant.ClassRole;
import constant.Message;
import constant.ResponseStatus;
import dto.request.ClassRoomRequest;
import dto.response.ClassRoomDetailResponse;
import dto.response.ClassRoomOverviewResponse;
import dto.response.ClassRoomResponse;
import dto.response.ApiResponse;
import entity.Assignment;
import entity.ClassRoom;
import entity.User;
import exception.AppException;
import exception.ErrorCode;
import jakarta.servlet.http.HttpSession;
import mapper.ClassRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.IAssignmentService;
import service.IClassRoomService;
import service.IEnrollClassRoomSerivce;
import service.IUserService;
import ulties.Ulti;

import java.util.List;

@Controller
@RequestMapping("class-room")
public class ClassRoomController {
    @Autowired
    private IEnrollClassRoomSerivce enrollClassRoomSerivce;
    @Autowired
    private IAssignmentService assignmentService;
    @Autowired
    private ClassRoomMapper classRoomMapper;
    @Autowired
    private IClassRoomService classRoomService;
    @Autowired
    private IUserService userService;

    @GetMapping()
    public String getUserClass(HttpSession session, Model model){
        int userId =(int) session.getAttribute("userId");
        ApiResponse<List<ClassRoomOverviewResponse>> response ;
            List<ClassRoom> classRooms = enrollClassRoomSerivce.getClassesByUserId(userId);
            List<ClassRoomOverviewResponse> dataResponse
                    = classRooms.stream()
                    .map(classRoom -> {
                        List<Assignment> assignments = assignmentService.getAssignment(classRoom.getId());
                        List<User> members = enrollClassRoomSerivce.getStudentInClass(classRoom.getId());
                        return classRoomMapper.toClassRoomOverviewResponse(classRoom,assignments,members);
                    })
                    .toList();
            response = ApiResponse.<List<ClassRoomOverviewResponse>>builder()
                    .data(dataResponse)
                    .message(Message.GET_CLASSOVERVIEW_SUCCESS.getMessage())
                    .status(ResponseStatus.GET_CLASSOVERVIEW_SUCCESS.getStatus())
                    .build();

        model.addAttribute("response",response);
        System.out.println(response);
        return "class_user";
    }
    @GetMapping("{classId}")
    public String getUserClassDetail(HttpSession session, Model model, @PathVariable int classId){
        int userId =(int) session.getAttribute("userId");
        int roleClass =enrollClassRoomSerivce.getRoleByUserId(userId,classId);
        ApiResponse<ClassRoomDetailResponse> response ;
            ClassRoom classRoom = classRoomService.getById(classId);
            List<Assignment> assignments = assignmentService.getAssignment(classRoom.getId());
            List<User> teachers = enrollClassRoomSerivce.getTeacherInClass(classRoom.getId());
            List<User> students = enrollClassRoomSerivce.getStudentInClass(classRoom.getId());

            response = ApiResponse.<ClassRoomDetailResponse>builder()
                    .data(classRoomMapper.toClassRoomDetailResponse(classRoom,teachers,students,assignments))
                    .message(Message.GET_CLASSDETAIL_SUCCESS.getMessage())
                    .status(ResponseStatus.GET_CLASSDETAIL_SUCCESS.getStatus())
                    .build();

        model.addAttribute("response",response);
        System.out.println(response);
        if(roleClass == ClassRole.STUDENT_ROLE.getCode()){
            return "class-detail-student";
        }
        else {
            return "class-detail-teacher";
        }
    }
    @PostMapping
    @ResponseBody
    public ApiResponse<ClassRoomResponse> addClass(@RequestBody ClassRoomRequest request, HttpSession session){
            int userId = (int)session.getAttribute("userId");
            User createBy = userService.getById(userId);
            String inviteCode = Ulti.generateClassCode();
            ClassRoom newClassRoom = classRoomMapper.fromClassRoomRequest(createBy,inviteCode,request);
            classRoomService.add(newClassRoom);
            return ApiResponse.<ClassRoomResponse>builder()
                    .data(classRoomMapper.toClassRoomResponse(newClassRoom))
                    .status(ResponseStatus.CREATE_CLASSROOM_SUCCESS.getStatus())
                    .message(Message.CREATE_CLASSROOM_SUCCESS.getMessage())
                    .build();

    }
    @PostMapping("join/{classCode}")
    @ResponseBody
    public ApiResponse<Boolean> joinClass(HttpSession session, @PathVariable String classCode){
            int userId = (int)session.getAttribute("userId");
            enrollClassRoomSerivce.join(classCode,userId);
            return ApiResponse.<Boolean>builder()
                    .data(true)
                    .message(Message.JOIN_CLASSROOM_SUCCESS.getMessage())
                    .status(ResponseStatus.JOIN_CLASSROOM_SUCCESS.getStatus())
                    .build();

    }
    @DeleteMapping("leave")
    @ResponseBody
    public ApiResponse<Boolean> leaveClassRoom(@RequestParam int classId, HttpSession session){
            int userId = (int) session.getAttribute("userId");
            enrollClassRoomSerivce.removeMember(userId,classId);
            return ApiResponse.<Boolean>builder()
                    .data(true)
                    .message(Message.LEAVE_CLASSROOM_SUCCESS.getMessage())
                    .status(ResponseStatus.LEAVE_CLASSROOM_SUCCESS.getStatus())
                    .build();
    }
    @PostMapping("kick")
    public String kickClassRoom(@RequestParam int classId,@RequestParam int userId, HttpSession session){
        ApiResponse<Boolean> response;
            enrollClassRoomSerivce.removeMember(userId,classId);
            response = ApiResponse.<Boolean>builder()
                    .data(true)
                    .message(Message.LEAVE_CLASSROOM_SUCCESS.getMessage())
                    .status(ResponseStatus.LEAVE_CLASSROOM_SUCCESS.getStatus())
                    .build();
        System.out.println(response);
        return "redirect:/class-room/"+classId;
    }

}
