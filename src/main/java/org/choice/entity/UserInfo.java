package org.choice.entity;

/**
 * Created by user on 2017/4/20.
 */
public class UserInfo {

    private Long user_info_id;

    private String user_name;

    private String password;

    private String name;

    private int user_type;

    private String user_type_name;

    private int user_gender;

    private String user_phoneNumber;

    private String user_email;

    private int undergraduateSchoolID;

    private String bkschool;

    private int wantSchoolID;

    private String wantschool;

    private String userImg;

    private Long registerTime;

    private String registerTime_date;

    private String homeTown_province;

    private String homeTown_city;

    private int ExamYear;


    public String getBkschool() {
        return bkschool;
    }

    public void setBkschool(String bkschool) {
        this.bkschool = bkschool;
    }

    public String getWantschool() {
        return wantschool;
    }

    public void setWantschool(String wantschool) {
        this.wantschool = wantschool;
    }

    public Long getUser_info_id() {
        return user_info_id;
    }

    public void setUser_info_id(Long user_info_id) {
        this.user_info_id = user_info_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegisterTime_date() {
        return registerTime_date;
    }

    public void setRegisterTime_date(String registerTime_date) {
        this.registerTime_date = registerTime_date;
    }

    public int getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(int user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getUndergraduateSchoolID() {
        return undergraduateSchoolID;
    }

    public void setUndergraduateSchoolID(int undergraduateSchoolID) {
        this.undergraduateSchoolID = undergraduateSchoolID;
    }


    public int getWantSchoolID() {
        return wantSchoolID;
    }

    public void setWantSchoolID(int wantSchoolID) {
        this.wantSchoolID = wantSchoolID;
    }


    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public Long getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Long registerTime) {
        this.registerTime = registerTime;
    }

    public String getHomeTown_province() {
        return homeTown_province;
    }

    public void setHomeTown_province(String homeTown_province) {
        this.homeTown_province = homeTown_province;
    }

    public String getHomeTown_city() {
        return homeTown_city;
    }

    public void setHomeTown_city(String homeTown_city) {
        this.homeTown_city = homeTown_city;
    }

    public int getExamYear() {
        return ExamYear;
    }

    public void setExamYear(int examYear) {
        ExamYear = examYear;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public String getUser_type_name() {
        return user_type_name;
    }

    public void setUser_type_name(String user_type_name) {
        this.user_type_name = user_type_name;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "user_info_id=" + user_info_id +
                ", name='" + name + '\'' +
                ", user_type=" + user_type +
                ", user_type_name='" + user_type_name + '\'' +
                '}';
    }
}
