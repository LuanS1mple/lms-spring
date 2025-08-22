package service.impl;

import constant.AssignmentStatus;
import entity.Assignment;
import entity.AssignmentResult;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IAssignmentResultRepository;
import repositories.IUserRepository;
//import repositories.db.SQLAssignmentResultRepository;
//import repositories.db.SQLUserRepository;
import service.IAssignmentResultService;

import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class AssignmentResultSerivice implements IAssignmentResultService {
    @Autowired
    private IAssignmentResultRepository assignmentResultRepository;
    @Autowired
    private IUserRepository userRepository;
    private static final int unMarkedNumber = AssignmentStatus.UN_MARKED.getValue();
    private static final int lateNumber =AssignmentStatus.LATE.getValue();
    public static int getUnMarkedNumber(){
        return unMarkedNumber;
    }
    public static int getLateNumber(){
        return lateNumber;
    }
    @Override
    public List<AssignmentResult> getByAssignment(int assignmentId) {
        return Optional.ofNullable(assignmentResultRepository.getByAssignment(assignmentId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_RESULTASSIGNMENT_FAIL));
    }

    @Override
    public List<AssignmentResult> getUnMarkedAssignment(int assignmentId) {
        return getByAssignment(assignmentId).stream()
                .filter(assignmentResult -> assignmentResult.getMark()==unMarkedNumber).toList();
    }

    @Override
    public List<AssignmentResult> getMarkedAssignment(int assignmentId) {
        return getByAssignment(assignmentId).stream()
                .filter(assignmentResult -> assignmentResult.getMark()!=unMarkedNumber).toList();
    }

    @Override
    public List<AssignmentResult> search(String pattern,int assignmentId) {
        return getUnMarkedAssignment(assignmentId).stream()
                .filter(result ->
                        result.getUser().getFullName().toLowerCase().contains(pattern.toLowerCase()))
                .filter(assignmentResult -> assignmentResult.getDoneAt().isAfter(LocalDateTime.now()))
                .filter(assignmentResult ->assignmentResult.getAssignment().getEndAt().isBefore(LocalDateTime.now().plusDays(7)))
        .toList();
    }

    @Override
    public AssignmentResult mark(int score,String commnet, AssignmentResult assignmentResult) {
        return Optional.ofNullable(assignmentResultRepository.mark(score,commnet,assignmentResult))
                .orElseThrow(()-> new AppException(ErrorCode.GET_RESULTASSIGNMENT_FAIL));
    }

    @Override
    public void downLoadSubmission(AssignmentResult assignmentResult) {
        System.out.println("Chuẩn bị tải bài làm của: " + assignmentResult.getUser().getFullName());

        SwingUtilities.invokeLater(() -> {
            JFileChooser chooser = new JFileChooser();
            chooser.setDialogTitle("Chọn thư mục để lưu tài liệu");
            chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

            // Tạo frame ẩn để đảm bảo JFileChooser hiện ra trước
            JFrame frame = new JFrame();
            frame.setAlwaysOnTop(true);
            frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
            frame.setVisible(false);

            int returnValue = chooser.showSaveDialog(frame);

            if (returnValue == JFileChooser.APPROVE_OPTION) {
                File selectedDirectory = chooser.getSelectedFile();
                Path sourcePath = Paths.get(assignmentResult.getSubmissionUrl());
                Path destinationPath = selectedDirectory.toPath().resolve(sourcePath.getFileName());

                if (!Files.exists(sourcePath)) {
                    JOptionPane.showMessageDialog(null, "File nguồn không tồn tại: " + sourcePath);
                    return;
                }

                try {
                    Files.copy(sourcePath, destinationPath, StandardCopyOption.REPLACE_EXISTING);
                    JOptionPane.showMessageDialog(null, "Đã tải file về: " + destinationPath);
                } catch (IOException e) {
                    e.printStackTrace();
                    JOptionPane.showMessageDialog(null, "Lỗi khi sao chép: " + e.getMessage());
                }
            } else {
                System.out.println("Người dùng đã hủy chọn thư mục.");
            }
        });
    }

    @Override
    public boolean submit(Assignment assignment) {
        AssignmentResult assignmentResult = new AssignmentResult();
//        int userId = SessionCLI.getInstance().getUserId();
        int userId =1;
        assignmentResult.setUser(userRepository.findById(userId));
        assignmentResult.setAssignment(assignment);
        assignmentResult.setSubmissionUrl(getSubmissionUrl());
        assignmentResult.setDoneAt(LocalDateTime.now());
        assignmentResult.setMark(AssignmentResultSerivice.getUnMarkedNumber());
        assignmentResult.setComment(null);
        assignmentResult.setStatus(isLateSubmit(assignment.getEndAt()));

        if(this.isSubmitBefore(assignmentResult) && this.isMarkedBefore(assignmentResult)){
            return false;
        }
        if(this.isSubmitBefore(assignmentResult) && !this.isMarkedBefore(assignmentResult)){
            this.replaceSubmit(assignmentResult);
            return true;
        }
        assignmentResultRepository.save(assignmentResult);
        return  true;
    }

    @Override
    public AssignmentResult submit(AssignmentResult assignmentResult) {
        return Optional.ofNullable(assignmentResultRepository.save(assignmentResult))
                .orElseThrow(()-> new AppException(ErrorCode.SUBMIT_ASSIGNMENT_FAIL));
    }

    @Override
    public String getSubmissionUrl() {
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
    public int isLateSubmit(LocalDateTime submitTime){
        if(LocalDateTime.now().isAfter(submitTime)) return 1;
        else return 0;
    }

    @Override
    public AssignmentResult getResult(int userId, int assignmentId) {
            return getByAssignment(assignmentId).stream()
                    .filter(assignmentResult -> assignmentResult.getUser().getId() == userId)
                    .findFirst().orElseThrow(()->new AppException(ErrorCode.GET_RESULTASSIGNMENT_FAIL));
    }

    @Override
    public boolean isSubmitBefore(AssignmentResult assignmentResult) {
        AssignmentResult result =this.getResult(assignmentResult.getUser().getId(),assignmentResult.getAssignment().getId());
        return result!=null;
    }

    @Override
    public boolean isMarkedBefore(AssignmentResult assignmentResult) {
        AssignmentResult result =this.getResult(assignmentResult.getUser().getId(),assignmentResult.getAssignment().getId());
        return (result!=null && result.getMark()!= AssignmentResultSerivice.getUnMarkedNumber());
    }

    @Override
    public void replaceSubmit(AssignmentResult assignmentResult) {
        assignmentResultRepository.save(assignmentResult);
    }

    @Override
    public boolean canUpdateScore(AssignmentResult assignmentResult) {
        AssignmentResult a = this.getResult(assignmentResult.getUser().getId(),assignmentResult.getAssignment().getId());
        return a.getMark()== -1;
    }
}
