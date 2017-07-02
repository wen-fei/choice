package org.choice.entity;

/**
 * Created by user on 2017/4/24.
 */
public class Exam {

    private int exam_id;

    private String book_id_str;

    private int book_id;

    private Book book;

    private int book_count;

    private int exam_star;

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getBook_id_str() {
        return book_id_str;
    }

    public void setBook_id_str(String book_id_str) {
        this.book_id_str = book_id_str;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getBook_count() {
        return book_count;
    }

    public void setBook_count(int book_count) {
        this.book_count = book_count;
    }

    public int getExam_star() {
        return exam_star;
    }

    public void setExam_star(int exam_star) {
        this.exam_star = exam_star;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "exam_id=" + exam_id +
                ", book_id_str='" + book_id_str + '\'' +
                ", book_id=" + book_id +
                ", book_count=" + book_count +
                ", exam_star=" + exam_star +
                '}';
    }
}
