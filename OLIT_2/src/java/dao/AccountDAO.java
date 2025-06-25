/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Long0
 */
public class AccountDAO {

    public static ArrayList<Account> getAccounts() {
        DBContext db = DBContext.getInstance();
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = """
                     Select 
                         UserID,
                         RoleID,
                         FullName,
                         Gender,
                         Email,
                         PhoneNumber,
                         Password,
                         URLAvatar,
                         Status,
                         Address,
                         Birthday
                         FROM Account
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("UserID"),
                        rs.getInt("RoleID"),
                        rs.getString("Fullname"),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password"),
                        rs.getString("URLAvatar"),
                        rs.getString("Status"),
                        rs.getString("Address"),
                        rs.getString("Birthday")
                );
                accounts.add(account);
            }
        } catch (Exception e) {
            return null;
        }
        return accounts;
    }

    public static boolean changePassword(String password, int userID) {
        DBContext db = DBContext.getInstance();
        int n = 0;
        String sql = """
                    Update Account
                    set Password = ?
                    where UserID = ?
                     """;
        try {
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, password);
            stmt.setInt(2, userID);
            n = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để dễ debug
            return false;
        }
        return n > 0;
    }
    
    public static boolean changePasswordByEmail(String password, String email) {
        DBContext db = DBContext.getInstance();
        int n = 0;
        String sql = """
                    Update Account
                    set Password = ?
                    where Email = ?
                     """;
        try {
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, password);
            stmt.setString(2, email);
            n = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để dễ debug
            return false;
        }
        return n > 0;
    }
    
    public static Account getAccountByID(int ID) {
        DBContext db = DBContext.getInstance();
        Account account = null;
        try {
            String sql = """
                        select * from Account where UserID = ?""";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, ID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                account = new Account(
                        rs.getInt("UserID"),
                        rs.getInt("RoleID"),
                        rs.getString("Fullname"),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password"),
                        rs.getString("URLAvatar"),
                        rs.getString("Status"),
                        rs.getString("Address"),
                        rs.getString("Birthday")
                );
            }

        } catch (Exception e) {
            return null;
        }
        return account;
    }
    
    public static Account getAccountByMail(String email) {
        DBContext db = DBContext.getInstance();
        Account account = null;
        try {
            String sql = """
                        select * from Account where Email = ?""";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                account = new Account(
                        rs.getInt("UserID"),
                        rs.getInt("RoleID"),
                        rs.getString("Fullname"),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password"),
                        rs.getString("URLAvatar"),
                        rs.getString("Status"),
                        rs.getString("Address"),
                        rs.getString("Birthday")
                );
            }

        } catch (Exception e) {
            return null;
        }
        return account;
    }
    
    public static boolean insertAccount(Account account) {
    DBContext db = DBContext.getInstance();
    String sql = """
        INSERT INTO Account (
            RoleID, FullName, Gender, Email, PhoneNumber, Password,
            URLAvatar, Status, Address, Birthday
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """;

    try {
        PreparedStatement stmt = db.getConnection().prepareStatement(sql);
        stmt.setInt(1, account.getRoleID());
        stmt.setString(2, account.getFullName());
        stmt.setString(3, account.getGender());
        stmt.setString(4, account.getEmail());
        stmt.setString(5, account.getPhoneNumber());
        stmt.setString(6, account.getPassword());
        stmt.setString(7, account.getUrlAvatar());
        stmt.setString(8, account.getStatus());
        stmt.setString(9, account.getAddress());
        stmt.setString(10, account.getBirthday()); // yyyy-MM-dd format

        return stmt.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    public static boolean editUserProfile(int userID, String fullName, String gender, String phoneNumber, String birthday) {
    DBContext db = DBContext.getInstance();
    int n = 0;
    String sql = """
        UPDATE Account
        SET FullName = ?,
            Gender = ?,
            PhoneNumber = ?,
            Birthday = ?
        WHERE UserID = ?
    """;
    try {
        PreparedStatement stmt = db.getConnection().prepareStatement(sql);
        stmt.setString(1, fullName);
        stmt.setString(2, gender);
        stmt.setString(3, phoneNumber);
        stmt.setString(4, birthday);
        //stmt.setString(5, address);
        stmt.setInt(5, userID);
        n = stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
    return n > 0;
}
    public static boolean updatePasswordAndActivate(String email, String password) {
    DBContext db = DBContext.getInstance();
    try {
        String sql = "UPDATE Account SET Password=?, Status='active' WHERE Email=?";
        PreparedStatement stmt = db.getConnection().prepareStatement(sql);
        stmt.setString(1, password);
        stmt.setString(2, email);
        return stmt.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

public static Account getAccountByPhone(String phone) {
    DBContext db = DBContext.getInstance();
    try {
        String sql = "SELECT * FROM Account WHERE PhoneNumber = ?";
        PreparedStatement stmt = db.getConnection().prepareStatement(sql);
        stmt.setString(1, phone);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Account acc = new Account();
            acc.setEmail(rs.getString("Email"));
            return acc;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}


//    public static void main(String[] args) {
////        ArrayList<Account> accounts = AccountDAO.getAccounts();
////        for (Account account : accounts) {
////            System.out.println(account);
////        }
//
//        //boolean a = AccountDAO.editUserProfile(1, "NAM", "Male", "0112", "13/05/2004");
//    }
}
