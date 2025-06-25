/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author Long0
 */
public class CourseDAO {

    public static ArrayList<Course> getCourses() {
        DBContext db = DBContext.getInstance();
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = """
                     Select 
                         CourseID,
                         SubjectID,
                         CourseTitle,
                         CourseTag,
                         URLCourse,
                         CourseDetail,
                         CourseLevel,
                         FeatureFlag,
                         Status,
                         CourseraDuration,
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
        String sql = "SELECT TOP 3 * FROM Course WHERE status = 1 ORDER BY CourseID DESC";
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
   
}





