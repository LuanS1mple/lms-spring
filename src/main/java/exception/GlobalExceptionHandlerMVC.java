//package exception;
//
//
//import constant.Message;
//import constant.ResponseStatus;
//import dto.response.ApiResponse;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//@ControllerAdvice
//public class GlobalExceptionHandlerMVC {
//
//    @ExceptionHandler(value = Exception.class)
//    String handleExceptionMVC(Exception exception, Model model){
//        ApiResponse apiResponse= new ApiResponse<>();
//        apiResponse.setMessage(Message.FAIL.getMessage());
//        apiResponse.setStatus(ResponseStatus.FAIL.getStatus());
//        model.addAttribute("error",apiResponse);
//        return "errorPage";
//    }
//    @ExceptionHandler(value = AppException.class)
//    String handKnownException(AppException appException, Model model){
//        ErrorCode errorCode = appException.getErrorCode();
//        ApiResponse apiResponse  = new ApiResponse();
//        apiResponse.setStatus(errorCode.getStatusCode().value());
//        apiResponse.setMessage(errorCode.getMessage());
//        model.addAttribute("error",apiResponse);
//        return "errorPage";
//    }
//
//}
