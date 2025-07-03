package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Question;
import java.util.List;

/**
 *
 * @author Admin
 */
public class QuestionDAO extends DBContext {

    public List<Question> getAllQuestion() {
        List<Question> questions = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        try {
            String sql = """
                            SELECT * FROM Question
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
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
            return null;
        }
        return questions;
    }

    public List<Question> getAllQuestionWithParam(String searchQuery, String filterLevel, int pageSize, int pageIndex) {
        List<Question> questions = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Question WHERE 1=1");

        // Gắn thêm điều kiện nếu có
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
            sql.append(" AND questionContent LIKE ?");
        }
        if (filter != null && !filter.trim().isEmpty()) {
            sql.append(" AND questionLevel = ?");
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
        String sql = """
                     SELECT * FROM Question WHERE QuestionID = ?
                     """;
        try (PreparedStatement ps = DBContext.getInstance().getConnection().prepareCall(sql)) {
            ps.setInt(1, questionID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Question question = new Question(
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
                    return question;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        QuestionDAO dao = new QuestionDAO();
//        // Tham số test
//        String searchQuery = "Java";      // tìm các câu hỏi chứa từ "What", có thể để null
//        String filterLevel = "Beginner";      // lọc theo Level, có thể để null
//        int pageSize = 5;                 // số lượng câu hỏi trên mỗi trang
//        int pageIndex = 1;                // trang số 1
//
//        List<Question> questions = dao.getAllQuestionWithParam(searchQuery, filterLevel, pageSize, pageIndex);
//
//        // In kết quả
//        for (Question q : questions) {
//            System.out.println("ID: " + q.getQuestionID());
//            System.out.println("Content: " + q.getQuestionContent());
//            System.out.println("Level: " + q.getQuestionLevel());
//            System.out.println("Status: " + q.getStatus());
//            System.out.println("------------------------");
//        }
//    }
}
