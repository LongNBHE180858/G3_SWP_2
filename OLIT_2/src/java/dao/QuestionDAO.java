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

    public List<Question> getAllQuestionWithParam(String searchQuery, String filterLevel, int pageSize, int pageIndex) {
        List<Question> list = new ArrayList<>();
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
                    Question q = new Question();
                    q.setQuestionID(rs.getInt("QuestionID"));
                    q.setQuestionContent(rs.getString("QuestionContent"));
                    q.setQuestionLevel(rs.getString("QuestionLevel"));
                    q.setStatus(rs.getInt("Status"));
                    q.setSolution(rs.getString("Solution"));
                    q.setQuestionType(rs.getString("QuestionType"));
                    q.setMediaURL(rs.getString("MediaURL"));
                    list.add(q);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        // Tham số test
        String searchQuery = "Java";      // tìm các câu hỏi chứa từ "What", có thể để null
        String filterLevel = "Beginner";      // lọc theo Level, có thể để null
        int pageSize = 5;                 // số lượng câu hỏi trên mỗi trang
        int pageIndex = 1;                // trang số 1

        List<Question> questions = dao.getAllQuestionWithParam(searchQuery, filterLevel, pageSize, pageIndex);

        // In kết quả
        for (Question q : questions) {
            System.out.println("ID: " + q.getQuestionID());
            System.out.println("Content: " + q.getQuestionContent());
            System.out.println("Level: " + q.getQuestionLevel());
            System.out.println("Status: " + q.getStatus());
            System.out.println("------------------------");
        }
    }

}
