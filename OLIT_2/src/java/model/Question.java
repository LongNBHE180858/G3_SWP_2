/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Question {
    private int QuestionID;
    private String QuestionContent;
    private String Solution;
    private String QuestionType;
    private int Status;
    private String QuestionLevel;
    private String MediaURL;

    public Question() {
    }

    public int getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(int QuestionID) {
        this.QuestionID = QuestionID;
    }

    public String getQuestionContent() {
        return QuestionContent;
    }

    public void setQuestionContent(String QuestionContent) {
        this.QuestionContent = QuestionContent;
    }

    public String getSolution() {
        return Solution;
    }

    public void setSolution(String Solution) {
        this.Solution = Solution;
    }

    public String getQuestionType() {
        return QuestionType;
    }

    public void setQuestionType(String QuestionType) {
        this.QuestionType = QuestionType;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getQuestionLevel() {
        return QuestionLevel;
    }

    public void setQuestionLevel(String QuestionLevel) {
        this.QuestionLevel = QuestionLevel;
    }

    public String getMediaURL() {
        return MediaURL;
    }

    public void setMediaURL(String MediaURL) {
        this.MediaURL = MediaURL;
    }

    @Override
    public String toString() {
        return "Question{" + "QuestionID=" + QuestionID + ", QuestionContent=" + QuestionContent + ", Solution=" + Solution + ", QuestionType=" + QuestionType + ", Status=" + Status + ", QuestionLevel=" + QuestionLevel + ", MediaURL=" + MediaURL + '}';
    }
    
    
    
}
