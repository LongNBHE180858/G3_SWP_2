/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Question {

    private int questionID;
    private String questionContent;
    private int questionType;
    private boolean status;
    private int questionLevel;
    private int createdBy;
    private String createdAt;
    private int subjectID;
    private int lessonID;

    public Question() {
    }

    public Question(int questionID, String questionContent, int questionType, boolean status, int questionLevel, int createdBy, String createdAt, int subjectID, int lessonID) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.questionType = questionType;
        this.status = status;
        this.questionLevel = questionLevel;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
        this.subjectID = subjectID;
        this.lessonID = lessonID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public int getQuestionType() {
        return questionType;
    }

    public String getQuestionTypeStr() {
        return questionType == 1 ? "Type 1" : "Type 2";
    }

    public void setQuestionType(int questionType) {
        this.questionType = questionType;
    }

    public boolean isStatus() {
        return status;
    }

    public String isStatusStr() {
        return (status ? "Active" : "Inactive");
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuestionLevel() {
        return questionLevel;
    }

    public void setQuestionLevel(int questionLevel) {
        this.questionLevel = questionLevel;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getDate() throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        // Định dạng đầu ra chỉ có giờ và phút
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

        // Chuyển đổi chuỗi thành Date
        Date date = inputFormat.parse(createdAt.split(" ")[0]);
        return outputFormat.format(date);
    }

    public String getTime() {
        if (createdAt != null && createdAt.contains(" ")) {
            String[] parts = createdAt.split(" "); // Tách chuỗi thành mảng
            String timePart = parts[1]; // Lấy phần tử thứ hai (giờ)
            return timePart.substring(0, 5); // Lấy "HH:mm"
        }
        return ""; // Trả về chuỗi rỗng nếu không hợp lệ
    }
}
