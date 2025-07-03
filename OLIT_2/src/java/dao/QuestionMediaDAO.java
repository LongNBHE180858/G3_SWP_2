/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.util.List;
import model.QuestionMedia;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Long0
 */
public class QuestionMediaDAO {

    public static List<QuestionMedia> getQuestionAnswerByQuestionID(int questionID) {
        List<QuestionMedia> questionMedias = new ArrayList<QuestionMedia>();
        DBContext db = new DBContext().getInstance();
        String sql = """
                     SELECT * FROM QuestionMedia WHERE QuestionID = ?
                     """;
        try (PreparedStatement ps = db.getConnection().prepareCall(sql)) {
            ps.setInt(1, questionID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QuestionMedia questionMedia = new QuestionMedia(
                            rs.getInt("MediaID"),
                            rs.getString("MediaURL"),
                            rs.getInt("MediaType"),
                            rs.getString("MediaDescription"),
                            rs.getInt("QuestionID")
                    );
                    questionMedias.add(questionMedia);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questionMedias;
    }

    public static boolean createQuestionMedia(int questionID, String mediaURL, String mediaDescription) {
        DBContext db = DBContext.getInstance();

        try {
            String sql = """
                        INSERT INTO QuestionMedia (QuestionID, MediaURL, MediaDescription)
                        VALUES (?, ?, ?)
                        """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, questionID);
            statement.setString(2, mediaURL);
            statement.setString(3, mediaDescription);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean changeQuestionMedia(int questionID, int mediaID, String mediaURL, int mediaType, String mediaDescription) {
        DBContext db = DBContext.getInstance();

        try {
            String sql = """
                        UPDATE QuestionMedia
                        SET MediaURL = ?, MediaType = ?, MediaDescription = ?
                        WHERE MediaID = ? AND QuestionID = ?
                        """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, mediaURL);
            statement.setInt(2, mediaType);
            statement.setString(2, mediaDescription);
            statement.setInt(3, mediaID);
            statement.setInt(4, questionID);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteQuestionMedia(int mediaID) {
        DBContext db = DBContext.getInstance();

        try {
            String sql = """
                        DELETE FROM QuestionMedia
                        WHERE MediaID = ?
                        """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, mediaID);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
