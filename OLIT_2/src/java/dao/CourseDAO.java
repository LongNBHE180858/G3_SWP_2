package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.*;

public class CourseDAO {

    public static ArrayList<Course> getCourses() {
        DBContext db = DBContext.getInstance();
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = """
                SELECT 
                    CourseID,
                    SubjectID,
                    CourseTitle,
                    CourseTag,
                    URLCourse,
                    CourseDetail,
                    CourseLevel,
                    FeatureFlag,
                    Status,
                    CourseraDuration
                FROM Course
            """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("CourseID"),
                        rs.getInt("SubjectID"),
                        rs.getString("CourseTitle"),
                        rs.getString("CourseTag"),
                        rs.getString("URLCourse"),
                        rs.getString("CourseDetail"),
                        rs.getString("CourseLevel"),
                        rs.getString("FeatureFlag"),
                        rs.getInt("Status"),
                        rs.getInt("CourseraDuration")
                );
                courses.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return courses;
    }

    public Course getCourseById(int id) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Course WHERE CourseID = ?";
        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseTitle(rs.getString("CourseTitle"));
                course.setCourseDetail(rs.getString("CourseDetail"));
                course.setUrlCourse(rs.getString("URLCourse"));
                
                return course;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Course> getTopCourses(int count) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Course WHERE status = 1";
        try {
            PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql);
            ps.setInt(1, count);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getInt("CourseID"));
                c.setCourseTitle(rs.getString("CourseTitle"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getHotCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM Course WHERE status = 1 ORDER BY CourseID DESC";
        try {
            PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getInt("CourseID"));
                c.setCourseTitle(rs.getString("CourseTitle"));
                c.setCourseTag(rs.getString("CourseTag"));
                c.setUrlCourse(rs.getString("urlCourse"));
                c.setCourseDetail(rs.getString("courseDetail"));
                c.setCourseLevel(rs.getString("courseLevel"));
                c.setFeatureFlag(rs.getString("featureFlag"));
                c.setStatus(rs.getInt("status"));
                c.setCourseraDuration(rs.getInt("courseraDuration"));
                c.setSubjectID(rs.getInt("subjectID"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getCoursesBySubjectIds(List<Integer> subjectIds) {
        List<Course> list = new ArrayList<>();
        if (subjectIds == null || subjectIds.isEmpty()) {
            return list;
        }

        String placeholders = subjectIds.stream().map(id -> "?").collect(Collectors.joining(","));
        String sql = "SELECT * FROM Course WHERE SubjectID IN (" + placeholders + ")";
        try (PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql)) {
            for (int i = 0; i < subjectIds.size(); i++) {
                ps.setInt(i + 1, subjectIds.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getInt("CourseID"));
                c.setSubjectID(rs.getInt("SubjectID"));
                c.setCourseTitle(rs.getString("CourseTitle"));
                c.setCourseTag(rs.getString("CourseTag"));
                c.setUrlCourse(rs.getString("URLCourse"));
                c.setCourseDetail(rs.getString("CourseDetail"));
                c.setCourseLevel(rs.getString("CourseLevel"));
                c.setFeatureFlag(rs.getString("FeatureFlag"));
                c.setStatus(rs.getInt("Status"));
                c.setCourseraDuration(rs.getInt("CourseraDuration"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<Course> courses = getCourses(); // Gọi hàm tĩnh getCourses()

        if (courses != null && !courses.isEmpty()) {
            System.out.println("===== Danh sách khóa học từ CSDL =====");
            for (Course c : courses) {
                System.out.println("Course ID: " + c.getCourseID());
                System.out.println("Title    : " + c.getCourseTitle());
                System.out.println("SubjectID: " + c.getSubjectID());
                System.out.println("Tag      : " + c.getCourseTag());
                System.out.println("URL      : " + c.getUrlCourse());
                System.out.println("Detail   : " + c.getCourseDetail());
                System.out.println("Level    : " + c.getCourseLevel());
                System.out.println("Feature  : " + c.getFeatureFlag());
                System.out.println("Status   : " + c.getStatus());
                System.out.println("Duration : " + c.getCourseraDuration() + " giờ");
                System.out.println("--------------------------------------");
            }
        } else {
            System.out.println("Không có dữ liệu hoặc xảy ra lỗi.");
        }
    }
}
