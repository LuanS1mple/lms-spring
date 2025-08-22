package service.impl;


import entity.CourseContent;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.ICourseContentRepository;
//import repositories.db.SQLCourseContentRepository;
import service.ICourseContentService;

import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class CourseContentService implements ICourseContentService {
    @Autowired
    private ICourseContentRepository courseContentRepository;

    @Override
    public List<CourseContent> getByCourseId(int courseId) {
        return Optional.ofNullable(courseContentRepository.getByCourseId(courseId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSECONTENT_FAIL))
                .stream().sorted(Comparator.comparing(CourseContent::getOrderIndex)).toList();
    }
    @Override
    public void downLoadCourseContent(CourseContent courseContent) {
        System.out.println("Chuẩn bị tải: " + courseContent.getTitle());

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
                Path sourcePath = Paths.get(courseContent.getContentUrl());
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
    public List<CourseContent> getByTittle(String tittle, int courseId) {
        return courseContentRepository.getByCourseId(courseId).stream()
                .filter(courseContent -> courseContent.getTitle().toLowerCase().contains(tittle.toLowerCase())).toList();
    }

    @Override
    public String getContentUrl() {
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
    public CourseContent add(CourseContent courseContent) {
        return Optional.ofNullable(courseContentRepository.save(courseContent))
                .orElseThrow(()-> new AppException(ErrorCode.CREATE_COURSECONTENT_FAIL));
    }

    @Override
    public int size() {
        return (int)courseContentRepository.count();
    }




}


