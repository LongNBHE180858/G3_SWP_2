package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Post;
import model.PostCategory;

/**
 *
 * @author Khai
 */
public class PostDAO extends DBContext {

    public List<Post> getAllBlog() {
        List<Post> listBlog = new ArrayList<>();
        String sql = "SELECT p.*, a.FullName, c.categoryName "
                + "FROM Post p "
                + "JOIN Account a ON p.userID = a.userID "
                + "JOIN PostCategory c ON p.categoryID = c.categoryID";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("postID"));
                post.setUserID(rs.getInt("userID"));
                post.setCategoryID(rs.getInt("categoryID"));
                post.setBlogTitle(rs.getString("blogTitle"));
                post.setPostDetails(rs.getString("postDetails"));
                post.setStatus(rs.getInt("status"));
                post.setUpdatedDate(rs.getString("updatedDate"));
                post.setThumbnailURL(rs.getString("thumbnailURL"));

                // Set Account với FullName
                Account acc = new Account();
                acc.setFullName(rs.getString("FullName"));
                post.setAccount(acc);

                // Set PostCategory với categoryName
                PostCategory pc = new PostCategory();
                pc.setCategoryID(rs.getInt("categoryID")); // hoặc lấy trực tiếp từ post.getCategoryID()
                pc.setCategoryName(rs.getString("categoryName"));
                post.setPostCategory(pc);

                listBlog.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listBlog;
    }

    public List<Post> searchPost(String name) {
        List<Post> listBlog = new ArrayList<>();
        String sql = "SELECT p.*, a.fullName, c.categoryName "
                + "FROM Post p "
                + "JOIN Account a ON p.userID = a.userID "
                + "JOIN PostCategory c ON p.categoryID = c.categoryID "
                + "WHERE p.blogTitle LIKE ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");  // tìm kiếm chứa chuỗi name
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setPostID(rs.getInt("postID"));
                    post.setUserID(rs.getInt("userID"));
                    post.setCategoryID(rs.getInt("categoryID"));
                    post.setBlogTitle(rs.getString("blogTitle"));
                    post.setPostDetails(rs.getString("postDetails"));
                    post.setStatus(rs.getInt("status"));

                    // Nếu bạn đã chuyển updatedDate sang Date kiểu java.util.Date hoặc java.sql.Timestamp
                    post.setUpdatedDate(rs.getString("updatedDate")); // hoặc rs.getTimestamp("updatedDate")

                    post.setThumbnailURL(rs.getString("thumbnailURL"));

                    // Set Account
                    Account account = new Account();
                    account.setFullName(rs.getString("fullName"));
                    post.setAccount(account);

                    // Set PostCategory
                    PostCategory category = new PostCategory();
                    category.setCategoryName(rs.getString("categoryName"));
                    post.setPostCategory(category);

                    listBlog.add(post);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listBlog;
    }

    public List<Post> getBlogByCategory(int categoryId) {
        List<Post> listBlog = new ArrayList<>();
        String sql = "SELECT p.*, a.fullName, c.categoryName "
                + "FROM Post p "
                + "JOIN Account a ON p.userID = a.userID "
                + "JOIN PostCategory c ON p.categoryID = c.categoryID "
                + "WHERE p.categoryID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setPostID(rs.getInt("postID"));
                    post.setUserID(rs.getInt("userID"));
                    post.setCategoryID(rs.getInt("categoryID"));
                    post.setBlogTitle(rs.getString("blogTitle"));
                    post.setPostDetails(rs.getString("postDetails"));
                    post.setStatus(rs.getInt("status"));
                    post.setUpdatedDate(rs.getString("updatedDate"));
                    post.setThumbnailURL(rs.getString("thumbnailURL"));

                    Account acc = new Account();
                    acc.setFullName(rs.getString("fullName"));
                    post.setAccount(acc);

                    PostCategory pc = new PostCategory();
                    pc.setCategoryID(rs.getInt("categoryID"));
                    pc.setCategoryName(rs.getString("categoryName"));
                    post.setPostCategory(pc);

                    listBlog.add(post);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listBlog;
    }

    public List<Post> getNewestPost() {
        List<Post> listBlog = new ArrayList<>();
        String sql = "SELECT TOP 2 p.*, a.fullName, c.categoryName "
                + "FROM Post p "
                + "JOIN Account a ON p.userID = a.userID "
                + "JOIN PostCategory c ON p.categoryID = c.categoryID "
                + "ORDER BY p.updatedDate DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("postID"));
                post.setUserID(rs.getInt("userID"));
                post.setCategoryID(rs.getInt("categoryID"));
                post.setBlogTitle(rs.getString("blogTitle"));
                post.setPostDetails(rs.getString("postDetails"));
                post.setStatus(rs.getInt("status"));
                post.setUpdatedDate(rs.getString("updatedDate"));
                post.setThumbnailURL(rs.getString("thumbnailURL"));

                Account acc = new Account();
                acc.setFullName(rs.getString("fullName"));
                post.setAccount(acc);

                PostCategory pc = new PostCategory();
                pc.setCategoryID(rs.getInt("categoryID"));
                pc.setCategoryName(rs.getString("categoryName"));
                post.setPostCategory(pc);

                listBlog.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listBlog;
    }

    public static void main(String[] args) {
        PostDAO postDAO = new PostDAO();
        List<Post> blogs = postDAO.getBlogByCategory(1);

        for (Post post : blogs) {
            System.out.println(post);
        }
    }

}
