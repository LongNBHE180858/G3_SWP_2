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
 * @author khain
 */
public class SubjectMediaDAO {
    public void insertMedia(int subjectId, String mediaUrl, String mediaType, String desc) {
        String sql = "INSERT INTO SubjectMedia (SubjectID, MediaURL, MediaType, MediaDescription) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBContext.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ps.setString(2, mediaUrl);
            ps.setString(3, mediaType);
            ps.setString(4, desc);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

