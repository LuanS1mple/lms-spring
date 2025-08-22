package service;



import entity.Assignment;

import java.util.List;

public interface IAssignmentService {
    public List<Assignment> getExpireAssignment(int classId);
    public List<Assignment> getGoingAssignment(int classId);
    public boolean isExpireAssignment(Assignment assignment);
    public List<Assignment> getAssignment(int classId);
    public void downLoad(Assignment assignment);
    public int size();
    public String uploadMeterial();
    public Assignment add(Assignment assignment);
    public List<Assignment> search(String pattern, int classId);
    public Assignment getById(int assignmentId);
}
