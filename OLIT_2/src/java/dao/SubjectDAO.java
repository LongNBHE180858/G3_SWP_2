/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import model.Subject;
import java.sql.*;
import java.util.*;

/**
 *
 * @author macbook
 */
public class SubjectDAO extends DBContext {
    public List<Subject> getAllSubjects() {
    List<Subject> list = new ArrayList<>();
    String sql = "SELECT * FROM Subject WHERE Status = 1";
    try {
        PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Subject s = new Subject();
            s.setSubjectID(rs.getInt("SubjectID"));
            s.setSubjectName(rs.getString("SubjectName"));
            s.setCategory(rs.getString("Category"));
            list.add(s);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
}
