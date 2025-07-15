package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Question;

/**
 *
 * @author Admin
 */
public class QuestionDAO extends DBContext {

    public List<Question> getAllQuestion() {
        List<Question> questions = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Question";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question question = new Question(
                    rs.getInt("QuestionID"),
                    rs.getString("QuestionContent"),
                    rs.getInt("QuestionType"),
                    rs.getBoolean("Status"),
                    rs.getInt("QuestionLevel"),
                    rs.getInt("CreatedBy"),
                    rs.getString("createdAt"),
                    rs.getInt("SubjectId"),
                    rs.getInt("LessonId")
                );
                questions.add(question);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return questions;
    }

    public List<Question> getAllQuestionWithParam(String searchQuery, String filterLevel, int pageSize, int pageIndex) {
        List<Question> questions = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Question WHERE 1=1");

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            sql.append(" AND QuestionContent LIKE ?");
        }
        if (filterLevel != null && !filterLevel.isEmpty()) {
            sql.append(" AND QuestionLevel = ?");
        }

        sql.append(" ORDER BY QuestionID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchQuery.trim() + "%");
            }
            if (filterLevel != null && !filterLevel.isEmpty()) {
                ps.setString(paramIndex++, filterLevel);
            }

            int offset = (pageIndex - 1) * pageSize;
            ps.setInt(paramIndex++, offset);
            ps.setInt(paramIndex++, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Question question = new Question(
                        rs.getInt("QuestionID"),
                        rs.getString("QuestionContent"),
                        rs.getInt("QuestionType"),
                        rs.getBoolean("Status"),
                        rs.getInt("QuestionLevel"),
                        rs.getInt("CreatedBy"),
                        rs.getString("createdAt"),
                        rs.getInt("SubjectId"),
                        rs.getInt("LessonId")
                    );
                    questions.add(question);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    public int getTotalQuestionCount(String searchQuery, String filter) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM Question WHERE 1=1");

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            sql.append(" AND QuestionContent LIKE ?");
        }
        if (filter != null && !filter.trim().isEmpty()) {
            sql.append(" AND QuestionLevel = ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchQuery + "%");
            }
            if (filter != null && !filter.trim().isEmpty()) {
                ps.setString(paramIndex++, filter);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static Question getQuesionByID(int questionID) {
        String sql = "SELECT * FROM Question WHERE QuestionID = ?";
        try (PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql)) {
            ps.setInt(1, questionID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Question(
                        rs.getInt("QuestionID"),
                        rs.getString("QuestionContent"),
                        rs.getInt("QuestionType"),
                        rs.getBoolean("Status"),
                        rs.getInt("QuestionLevel"),
                        rs.getInt("CreatedBy"),
                        rs.getString("CreatedAt"),
                        rs.getInt("SubjectID"),
                        rs.getInt("LessonID")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(Question q) {
        String sql = """
            UPDATE Question
               SET QuestionContent = ?,
                   Status          = ?
             WHERE QuestionID       = ?
            """;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, q.getQuestionContent());
            ps.setBoolean(2, q.isStatus());
            ps.setInt(3, q.getQuestionID());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a question by its ID.
     * Returns true if the deletion was successful.
     */
    public boolean deleteQuestionByID(int questionID) {
        String sql = "DELETE FROM Question WHERE QuestionID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, questionID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
