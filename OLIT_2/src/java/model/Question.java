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

    private int questionId;
    private String questionContent;
    private int questionType;
    private boolean status;
    private int questionLevel;
    private int createdBy;
    private String createdAt;
    private int subjectId;
    private int lessonId;

    public Question() {
    }

    public Question(int questionId, String questionContent, int questionType, boolean status, int questionLevel, int createdBy, String createdAt, int subjectId, int lessonId) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.questionType = questionType;
        this.status = status;
        this.questionLevel = questionLevel;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
        this.subjectId = subjectId;
        this.lessonId = lessonId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
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

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
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
