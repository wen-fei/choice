package org.choice.entity;

/**
 * Created by user on 2017/4/24.
 */
public class Book {

    private int book_id;

    private String book_name;

    private String book_author;

    private String book_publisher;

    private int book_pub_year; //出版年份

    private String book_buy_url;

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_publisher() {
        return book_publisher;
    }

    public void setBook_publisher(String book_publisher) {
        this.book_publisher = book_publisher;
    }

    public int getBook_pub_year() {
        return book_pub_year;
    }

    public void setBook_pub_year(int book_pub_year) {
        this.book_pub_year = book_pub_year;
    }

    public String getBook_buy_url() {
        return book_buy_url;
    }

    public void setBook_buy_url(String book_buy_url) {
        this.book_buy_url = book_buy_url;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_publisher='" + book_publisher + '\'' +
                ", book_pub_year=" + book_pub_year +
                ", book_buy_url='" + book_buy_url + '\'' +
                '}';
    }
}
