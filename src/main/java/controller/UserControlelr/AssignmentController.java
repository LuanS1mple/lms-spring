package controller.UserControlelr;

import constant.AssignmentStatus;
import constant.Message;
import constant.ResponseStatus;
import dto.request.AssignmentRequest;
import dto.request.AssignmentResultRequest;
import dto.request.GradeRequest;
import dto.response.AssignmentResultResponse;
import dto.response.AssignmentSubmissionResponse;
import dto.response.ApiResponse;
import entity.Assignment;
import entity.AssignmentResult;
import entity.ClassRoom;
import entity.User;
import exception.AppException;
import exception.ErrorCode;
import jakarta.servlet.http.HttpSession;
import mapper.AssignmentMapper;
import mapper.AssignmentResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import service.IAssignmentResultService;
import service.IAssignmentService;
import service.IClassRoomService;
import service.IUserService;

import java.util.List;

@Controller
@RequestMapping("assignment")
public class AssignmentController {

    @Autowired
    private IAssignmentResultService assignmentResultService;
    @Autowired
    private AssignmentResultMapper assignmentResultMapper;
    @Autowired
    private IUserService userService;
    @Autowired
    private IAssignmentService assignmentService;
    @Autowired
    private AssignmentMapper assignmentMapper;
    @Autowired
    private IClassRoomService classRoomService;

    @GetMapping("result")
    @ResponseBody
    public ApiResponse<AssignmentResultResponse> getResult(@RequestParam int assignmentId, HttpSession session) {
            int userId = (int) session.getAttribute("userId");
            AssignmentResult assignmentResult = assignmentResultService.getResult(userId, assignmentId);
            return ApiResponse.<AssignmentResultResponse>builder()
                    .data(assignmentResultMapper.toAssignmentResultResponse(assignmentResult))
                    .message(Message.GET_RESULTASSIGNMENT_SUCCESS.getMessage())
                    .status(ResponseStatus.GET_RESULTASSIGNMENT_SUCESS.getStatus())
                    .build();
    }

    @PostMapping("submit")
    @ResponseBody
    public ApiResponse<AssignmentResultResponse> submit(@RequestBody AssignmentResultRequest request, @RequestParam int assignmentId, HttpSession session) {
            int userId = (int) session.getAttribute("userId");
            User user = userService.getById(userId);
            Assignment assignment = assignmentService.getById(assignmentId);
            String comment = null;
            int mark = AssignmentStatus.UN_MARKED.getValue();
            int status;
            boolean isExpire = assignmentService.isExpireAssignment(assignment);
            if (isExpire) {
                status = AssignmentStatus.UN_LATE.getValue();
            } else {
                status = AssignmentStatus.LATE.getValue();
            }
            AssignmentResult assignmentResult = assignmentResultMapper.fromAssignmentResultRequest(request, user, assignment, mark, status, comment);
            return ApiResponse.<AssignmentResultResponse>builder()
                    .data(assignmentResultMapper.toAssignmentResultResponse(assignmentResultService.submit(assignmentResult)))
                    .message(Message.SUBMIT_ASSIGNMENT_SUCCESS.getMessage())
                    .status(ResponseStatus.SUBMIT_ASSIGNMENT_SUCCESS.getStatus())
                    .build();
    }

    @PostMapping("add")
    public String addAssignment(@ModelAttribute AssignmentRequest request, Model model, BindingResult bindingResult, HttpSession session) {
        ApiResponse<Assignment> response = null;
            if (bindingResult.hasErrors()) throw new AppException(ErrorCode.INVALID_INPUT);
            int userId = (int) session.getAttribute("userId");
            User createdBy = userService.getById(userId);
            ClassRoom classRoom = classRoomService.getById(request.getClassId());
            Assignment assignment = assignmentMapper.fromAssignmentRequest(request, createdBy, classRoom);
            response = ApiResponse.<Assignment>builder()
                    .data(assignmentService.add(assignment))
                    .message(Message.CREATE_ASSIGNMENT_SUCCESS.getMessage())
                    .status(ResponseStatus.CREATE_ASSIGNMENT_SUCCESS.getStatus())
                    .build();
        System.out.println(response);
        return "redirect:/class-room/" + request.getClassId();
    }

    @GetMapping("submissions")
    public String getStudentSubmissin(@RequestParam int assignmentId, Model model) {
        ApiResponse<AssignmentSubmissionResponse> response;
            Assignment assignment = assignmentService.getById(assignmentId);
            List<AssignmentResult> submissions = assignmentResultService.getByAssignment(assignmentId);
            response = ApiResponse.<AssignmentSubmissionResponse>builder()
                    .status(ResponseStatus.GET_SUBMISSION_SUCCESS.getStatus())
                    .message(Message.GET_SUBMISSION_SUCCESS.getMessage())
                    .data(assignmentResultMapper.toAssignmentSubmissionResponse(assignment, submissions))
                    .build();

        System.out.println(response);
        model.addAttribute("response", response);
        return "submission-teacher";
    }

    @PostMapping("grade")
    public String grade(@ModelAttribute GradeRequest request) {
            AssignmentResult assignmentResult = assignmentResultService.getResult(request.getUserId(), request.getAssignmentId());
            assignmentResultService.mark(request.getMark(), request.getComment(), assignmentResult);

        return "redirect:/assignment/submissions?assignmentId=" + request.getAssignmentId();
    }
}
