package service.impl;



import entity.Assignment;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IAssignmentRepository;
//import repositories.db.SQLAssignmentRepository;
import service.IAssignmentService;

import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class AssignmentService implements IAssignmentService {
    @Autowired
    private IAssignmentRepository assignmentRepository;
    @Override
    public List<Assignment> getExpireAssignment(int classId) {
        return assignmentRepository.getAssignmentByClass(classId).stream()
                .filter(assignment -> this.isExpireAssignment(assignment)).toList();
    }

    @Override
    public List<Assignment> getGoingAssignment(int classId) {
        return assignmentRepository.getAssignmentByClass(classId).stream()
                .filter(assignment -> !this.isExpireAssignment(assignment)).toList();
    }

    @Override
    public boolean isExpireAssignment(Assignment assignment) {
        LocalDateTime now = LocalDateTime.now();
        return assignment.getEndAt().isAfter(now);
    }

    @Override
    public List<Assignment> getAssignment(int classId) {
        return Optional.ofNullable(assignmentRepository.getAssignmentByClass(classId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_ASSIGNMENT_FAIL));
    }

    @Override
    public void downLoad(Assignment assignment) {
        System.out.println("Chuẩn bị tải: " + assignment.getTittle());

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
                Path sourcePath = Paths.get(assignment.getAssignmentUrl());
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
    public int size() {
        return (int)assignmentRepository.count();
    }

    @Override
    public String uploadMeterial() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Chọn một file");

        int result = fileChooser.showOpenDialog(null);

        if (result == JFileChooser.APPROVE_OPTION) {
            File selectedFile = fileChooser.getSelectedFile();
            return selectedFile.getAbsolutePath();
        } else {
            return null;
        }
    }

    @Override
    public Assignment add(Assignment assignment) {
        return Optional.ofNullable(assignmentRepository.save(assignment))
                .orElseThrow(()-> new AppException(ErrorCode.CREATE_ASSIGNMENT_FAIL));
    }

    @Override
    public List<Assignment> search(String pattern, int classId) {
        return assignmentRepository.getAssignmentByClass(classId).stream()
                .filter(assignment -> assignment.getTittle().toLowerCase().contains(pattern.toLowerCase()))
                .toList();
    }

    @Override
    public Assignment getById(int assignmentId) {
        return Optional.ofNullable(assignmentRepository.getById(assignmentId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_ASSIGNMENT_FAIL));
    }
}
