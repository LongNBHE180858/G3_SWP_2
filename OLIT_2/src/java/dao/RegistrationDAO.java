package dao;

import model.Registration;
import model.Course;
import model.Account;
import model.PricePackage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dal.DBContext;

public class RegistrationDAO extends DBContext {

    public boolean registerCourse(Registration registration) {
        // Tìm ID trống trước
        int availableId = findAvailableRegistrationId();
        if (availableId == -1) {
            return false; // Không tìm thấy ID trống
        }

        String sql = "INSERT INTO Registration (RegistrationID, UserID, CourseID, PackageID, Status, ValidFrom, ValidTo) "
                + "VALUES (?, ?, ?, ?, 'Pending', GETDATE(), DATEADD(MONTH, ?, GETDATE()))";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, availableId);
            ps.setInt(2, registration.getUserID());
            ps.setInt(3, registration.getCourseID());
            ps.setInt(4, registration.getPackageID());

            PricePackage pkg = new PricePackageDAO().getPackageById(registration.getPackageID());
            ps.setInt(5, pkg.getAccessDuration());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private int findAvailableRegistrationId() {
        String sql = "SELECT TOP 1 t1.RegistrationID + 1 "
                + "FROM Registration t1 "
                + "WHERE NOT EXISTS (SELECT 1 FROM Registration t2 WHERE t2.RegistrationID = t1.RegistrationID + 1) "
                + "UNION "
                + "SELECT 1 WHERE NOT EXISTS (SELECT 1 FROM Registration WHERE RegistrationID = 1) "
                + "ORDER BY 1";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Registration> getRegistrationsByUserID(int userID) {
        Connection conn = DBContext.getInstance().getConnection();
        List<Registration> list = new ArrayList<>();

        String sql = "SELECT r.RegistrationID, r.UserID, r.CourseID, r.PackageID, r.ApprovedBy, "
                + "r.Status, r.ValidFrom, r.ValidTo, "
                + "c.CourseTitle, "
                + "pp.Name AS PackageName, pp.SalePrice "
                + "FROM Registration r "
                + "JOIN Course c ON r.CourseID = c.courseID "
                + "JOIN PricePackage pp ON r.PackageID = pp.PackageID "
                + "WHERE r.UserID = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Registration r = new Registration();
                r.setRegistrationID(rs.getInt("RegistrationID"));
                r.setUserID(rs.getInt("UserID"));
                r.setCourseID(rs.getInt("CourseID"));
                r.setPackageID(rs.getInt("PackageID"));
                r.setApprovedBy(rs.getInt("ApprovedBy"));
                r.setStatus(rs.getString("Status"));
                r.setValidFrom(rs.getString("ValidFrom"));
                r.setValidTo(rs.getString("ValidTo"));

                Course course = new Course();
                course.setCourseTitle(rs.getString("courseTitle"));
                r.setCourse(course);

                PricePackage pp = new PricePackage();
                pp.setName(rs.getString("PackageName"));
                pp.setSalePrice(rs.getInt("SalePrice"));
                r.setPricePackage(pp);

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Registration> getRegistrationsByUserIDWithPaging(int userID, int offset, int limit) {
        List<Registration> list = new ArrayList<>();
        String sql = "SELECT r.RegistrationID, r.UserID, r.CourseID, r.PackageID, r.ApprovedBy, r.Status, r.ValidFrom, r.ValidTo, "
                + "c.CourseID AS CourseID, c.CourseTitle, "
                + "p.PackageID AS PackageID, p.CourseID AS PackageCourseID, p.Name AS PackageName, p.AccessDuration, p.ListPrice, p.SalePrice, p.Status AS PackageStatus, p.Description "
                + "FROM Registration r "
                + "LEFT JOIN Course c ON r.CourseID = c.CourseID "
                + "LEFT JOIN PricePackage p ON r.PackageID = p.PackageID "
                + "WHERE r.UserID = ? ORDER BY r.RegistrationID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql)) {
            ps.setInt(1, userID);
            ps.setInt(2, offset);
            ps.setInt(3, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                r.setRegistrationID(rs.getInt("RegistrationID"));
                r.setUserID(rs.getInt("UserID"));
                r.setCourseID(rs.getInt("CourseID"));
                r.setPackageID(rs.getInt("PackageID"));
                r.setApprovedBy(rs.getInt("ApprovedBy"));
                r.setStatus(rs.getString("Status"));
                r.setValidFrom(rs.getString("ValidFrom")); // Sửa nếu là Timestamp (xem bước 2)
                r.setValidTo(rs.getString("ValidTo"));     // Sửa nếu là Timestamp (xem bước 2)

                // Khởi tạo Course
                if (rs.getInt("CourseID") != 0) {
                    Course course = new Course();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setCourseTitle(rs.getString("CourseTitle"));
                    r.setCourse(course);
                }

                // Khởi tạo PricePackage
                if (rs.getInt("PackageID") != 0) {
                    PricePackage pricePackage = new PricePackage();
                    pricePackage.setPackageID(rs.getInt("PackageID"));
                    pricePackage.setCourseID(rs.getInt("PackageCourseID"));
                    pricePackage.setName(rs.getString("PackageName"));
                    pricePackage.setAccessDuration(rs.getInt("AccessDuration"));
                    pricePackage.setListPrice(rs.getInt("ListPrice"));
                    pricePackage.setSalePrice(rs.getInt("SalePrice"));
                    pricePackage.setStatus(rs.getInt("PackageStatus"));
                    pricePackage.setDescription(rs.getString("Description"));
                    r.setPricePackage(pricePackage);
                }

                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countRegistrationsByUserID(int userID) {
        String sql = "SELECT COUNT(*) FROM Registration WHERE UserID = ?";
        try (PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
