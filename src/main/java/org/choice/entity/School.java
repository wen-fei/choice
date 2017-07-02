package org.choice.entity;

/**
 * Created by user on 2017/4/24.
 */
public class School {

    private int school_id;

    private String school_name;

    private int hot_score;

    private String school_url;     //官网那个url

    private int school_type_id;

    private String school_type_name;

    private String school_zsjz; //招生简章url

    private int info_year;

    private int pass_score;

    private int pass_score_min;

    private int pass_score_max;

    private int pass_score_average;

    private int pass_score_countryA;

    private int pass_score_countryB;

    private int peoplesCount_bk;//报考人数

    private int peoplesCount_lq;//录取人数

    private int peoplesCount_tm;//推免人数

    private int peoplesCount_lq_per;//录取比例

    private String teacher_url;

    private int exam_id;        //考试科目代码

    private Exam exam;

    private String school_province;

    private String school_city;

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public int getHot_score() {
        return hot_score;
    }

    public void setHot_score(int hot_score) {
        this.hot_score = hot_score;
    }

    public String getSchool_url() {
        return school_url;
    }

    public void setSchool_url(String school_url) {
        this.school_url = school_url;
    }

    public int getSchool_type_id() {
        return school_type_id;
    }

    public void setSchool_type_id(int school_type_id) {
        this.school_type_id = school_type_id;
    }

    public String getSchool_type_name() {
        return school_type_name;
    }

    public void setSchool_type_name(String school_type_name) {
        this.school_type_name = school_type_name;
    }

    public String getSchool_zsjz() {
        return school_zsjz;
    }

    public void setSchool_zsjz(String school_zsjz) {
        this.school_zsjz = school_zsjz;
    }

    public int getInfo_year() {
        return info_year;
    }

    public void setInfo_year(int info_year) {
        this.info_year = info_year;
    }

    public int getPass_score() {
        return pass_score;
    }

    public void setPass_score(int pass_score) {
        this.pass_score = pass_score;
    }

    public int getPass_score_min() {
        return pass_score_min;
    }

    public void setPass_score_min(int pass_score_min) {
        this.pass_score_min = pass_score_min;
    }

    public int getPass_score_max() {
        return pass_score_max;
    }

    public void setPass_score_max(int pass_score_max) {
        this.pass_score_max = pass_score_max;
    }

    public int getPass_score_average() {
        return pass_score_average;
    }

    public void setPass_score_average(int pass_score_average) {
        this.pass_score_average = pass_score_average;
    }

    public int getPass_score_countryA() {
        return pass_score_countryA;
    }

    public void setPass_score_countryA(int pass_score_countryA) {
        this.pass_score_countryA = pass_score_countryA;
    }

    public int getPass_score_countryB() {
        return pass_score_countryB;
    }

    public void setPass_score_countryB(int pass_score_countryB) {
        this.pass_score_countryB = pass_score_countryB;
    }

    public int getPeoplesCount_bk() {
        return peoplesCount_bk;
    }

    public void setPeoplesCount_bk(int peoplesCount_bk) {
        this.peoplesCount_bk = peoplesCount_bk;
    }

    public int getPeoplesCount_lq() {
        return peoplesCount_lq;
    }

    public void setPeoplesCount_lq(int peoplesCount_lq) {
        this.peoplesCount_lq = peoplesCount_lq;
    }

    public int getPeoplesCount_tm() {
        return peoplesCount_tm;
    }

    public void setPeoplesCount_tm(int peoplesCount_tm) {
        this.peoplesCount_tm = peoplesCount_tm;
    }

    public int getPeoplesCount_lq_per() {
        return peoplesCount_lq_per;
    }

    public void setPeoplesCount_lq_per(int peoplesCount_lq_per) {
        this.peoplesCount_lq_per = peoplesCount_lq_per;
    }

    public String getTeacher_url() {
        return teacher_url;
    }

    public void setTeacher_url(String teacher_url) {
        this.teacher_url = teacher_url;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public String getSchool_province() {
        return school_province;
    }

    public void setSchool_province(String school_province) {
        this.school_province = school_province;
    }

    public String getSchool_city() {
        return school_city;
    }

    public void setSchool_city(String school_city) {
        this.school_city = school_city;
    }
}
