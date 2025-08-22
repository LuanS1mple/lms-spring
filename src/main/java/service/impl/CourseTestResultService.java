package service.impl;

import constant.TestStatus;
import entity.CourseTest;
import entity.CourseTestResult;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.ICourseTestRepository;
import repositories.ICourseTestResultRepository;
import repositories.IUserRepository;
//import repositories.db.SQLCourseTestRepository;
//import repositories.db.SQLCourseTestResultRepository;
//import repositories.db.SQLUserRepository;
import service.ICourseTestResultService;

import javax.swing.*;
import java.io.File;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class CourseTestResultService implements ICourseTestResultService {
    @Autowired
    private ICourseTestResultRepository courseTestResultRepository;
    @Autowired
    private IUserRepository userRepository;
    @Autowired
    private ICourseTestRepository courseTestRepository;
    private static final int statusPassNumber = TestStatus.PASSED.getValue();

    public static int getStatusPassNumber(){
        return statusPassNumber;
    }
    @Override
    public CourseTestResult add(CourseTestResult result) {
        return Optional.ofNullable(courseTestResultRepository.save(result))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSETESTRESULT_FAIL));
    }

    @Override
    public CourseTestResult getResults(int userId,int courseTestId) {
        return Optional.ofNullable(courseTestResultRepository.getResults(userId,courseTestId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSETESTRESULT_FAIL));
    }

    @Override
    public String getSubmitUrl() {
        final String[] resultPath = {null};

        try {
            // Bắt buộc gọi từ EDT để an toàn
            SwingUtilities.invokeAndWait(() -> {
                JFrame frame = new JFrame();
                frame.setAlwaysOnTop(true);
                frame.setUndecorated(true);
                frame.setLocationRelativeTo(null);
                frame.setVisible(true);

                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setDialogTitle("Chọn một file");

                int result = fileChooser.showOpenDialog(frame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    File selectedFile = fileChooser.getSelectedFile();
                    resultPath[0] = selectedFile.getAbsolutePath();
                }

                frame.dispose(); // Giải phóng frame ẩn
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultPath[0];
    }

    @Override
    public void submit(int userId,int testId) {
        String url  = getSubmitUrl();
        int mark = autoMark(url,testId);
        CourseTest test = courseTestRepository.findById(testId);
        int status =(float) mark > test.getMaxScore() * CourseTestService.getRateScorePass()? 1:0;
        CourseTestResult courseTestResult = new CourseTestResult();
        courseTestResult.setUser(userRepository.findById(userId));
        courseTestResult.setCourseTest(test);
        courseTestResult.setMark(mark);
        courseTestResult.setDoneAt(LocalDateTime.now());
        courseTestResult.setStatus(status);
        courseTestResultRepository.save(courseTestResult);
    }

    @Override
    public int autoMark(String submitUrl, int testId) {
        return 100;
    }

    public static void main(String[] args) {
        CourseTestResultService courseTestResultService = new CourseTestResultService();
        courseTestResultService.getSubmitUrl();
    }
}
