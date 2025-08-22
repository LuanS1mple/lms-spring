package exception;

import constant.Message;
import constant.ResponseStatus;
import controller.AdminController.CourseController;
import dto.response.ApiResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestControllerAdvice(assignableTypes = CourseController.class)

public class GlobalExceptionHandlerREST {
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    ResponseEntity<ApiResponse> handleExceptionREST(Exception exception){
        ApiResponse apiResponse= new ApiResponse<>();
        apiResponse.setMessage(Message.FAIL.getMessage());
        apiResponse.setStatus(ResponseStatus.FAIL.getStatus());
        return ResponseEntity.badRequest().body(apiResponse);
    }
    @ExceptionHandler(value = AppException.class)
    @ResponseBody
    ResponseEntity<ApiResponse> handKnownException(AppException appException){
        ErrorCode errorCode = appException.getErrorCode();
        ApiResponse apiResponse  = new ApiResponse();
        apiResponse.setStatus(errorCode.getStatusCode().value());
        apiResponse.setMessage(errorCode.getMessage());
        return ResponseEntity.status(errorCode.getStatusCode()).body(apiResponse);
    }
}
