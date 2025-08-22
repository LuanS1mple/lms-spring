package constant;

import lombok.Getter;

@Getter
public enum Message {
    LOGIN_SUCCESS("Đăng nhâp thành công"),
    LOGIN_FAIL("Sai tài khoản hoặc mật khẩu"),
    CREATED_USER_SUCCESS("Tạo người dùng thành công"),
    CREATED_USER_FAIL("Tạo người dùng thất bại, Kiểm tra lại các giá trị"),
    CREATED_COURSE_FAIL("Tạo khóa học thất bại, Kiểm tra lại các giá trị"),
    UPDATE_COURSE_FAIL("Chỉnh sửa khóa học thất bại, hãy xem lại các giá trị"),
    DELETE_COURSE_FAIL("Xóa course thất bại, vui lòng thử lại sau"),
    GET_COURSEDETAIL_FAIL("Không thể lấy course, hãy thử lại sau"),
    CREATED_COURSE_SUCCESS("Tạo khóa học thành công"),
    UPDATE_COURSE_SUCCESS("Chỉnh sửa khóa học thành công"),
    DELETE_COURSE_SUCCESS("Xóa course thành công"),
    GET_COURSEDETAIL_SUCCESS("Lấy thông tin khóa học thàng công"),
    CREATE_COURSECONTENT_SUCCESS("Thêm mới tài liệu thành công"),
    CREATE_COURSECONTENT_FAIL("Thêm mới tài liệu thất bại"),
    CREATE_COURSETEST_SUCCESS("Thêm mới bài thi thành công"),
    CREATE_COURSETEST_FAIL("Thêm mới bài thi thất bại"),
    GET_USERS_SUCCESS("Lấy thông tin users thành công"),
    GET_USERS_FAIL("Lấy thông tin users thất bại"),
    DELETE_USER_SUCCESS("Xóa người dùng thành công"),
    DELETE_USER_FAIL("Xóa người dùng thất bại"),
    GET_COURSES_FAIL("Không thể lấy thông tin các khóa học"),
    GET_COURSETESTRESULT_SUCCESS("Thành công lấy kết quả bài thi"),
    GET_COURSETESTRESULT_FAIL("Lỗi lấy kết quả bài thi"),
    GET_CLASSDETAIL_FAIL("Lỗi lấy thông tin chi tiết lớp học"),
    GET_CLASSDETAIL_SUCCESS("Lấy thông tin chi tiết lớp học thành công"),
    GET_CLASSOVERVIEW_FAIL("Lỗi lấy thông tin tổng quát lớp học"),
    GET_CLASSOVERVIEW_SUCCESS("Lấy thông tin tổng quát lớp học thành công"),
    CREATE_CLASSROOM_SUCCESS("Tạo lớp học thành công"),
    CREATE_CLASSROOM_FAIL("Tạo lớp học thất bại"),
    JOIN_CLASSROOM_SUCCESS("Tham gia lớp học thành công"),
    JOIN_CLASSROOM_FAIL("Tham gia lớp học thất bại"),
    UNENROLL_SUCCESS("Rời khóa học thành công"),
    UNENROLL_FAIL("Rời khóa học thất bại"),
    LEAVE_CLASSROOM_SUCCESS("Rời lớp học thành công"),
    LEAVE_CLASSROOM_FAIL("Rời rời lớp học thất bại"),
    GET_RESULTASSIGNMENT_SUCCESS("Lấy kết quả assignment thành công"),
    GET_RESULTASSIGNMENT_FAIL("Lấy kết quả assignment thất bại"),
    SUBMIT_ASSIGNMENT_SUCCESS("Nộp assignment thành công"),
    SUBMIT_ASSIGNMENT_FAIL("Nộp assignment thất bại"),
    CHANGE_ROLE_SUCCESS("Đổi role thành công"),
    CHANGE_ROLE_FAIL("Đổi role thất bại"),
    CREATE_ASSIGNMENT_SUCCESS("Thêm bài tập thành công"),
    CREATE_ASSIGNMENT_FAIL("Load bài tập thành công"),
    GET_SUBMISSION_SUCCESS("Tải bài nộp thành công"),
    GET_SUBMISSION_FAIL("Tải bài nộp thất bại"),
    GET_COURSES_SUCCESS("Lấy dữ liệu khóa học thành công"),
    GET_ASSIGNMENT_FAIL("Không thể lấy dữ liệu assignment"),
    GET_COURSECONTENT_FAIL("Không thể lấy dữ liệu content"),
    GET_COURSETEST_FAIL("Không thể lấy dữ liệu test"),
    GET_ENROLLCLASROOM_FAIL("Không thể lấy thông tin enroll class"),
    ENROLL_FAIL("Tham gia khóa học thất bại"),
    INVALID_INPUT("Input bạn sai"),
    FAIL("Lỗi");


    String message;
    Message(String message){
        this.message = message;
    }
}
