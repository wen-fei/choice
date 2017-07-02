package org.choice.entity;

/**
 * Created by user on 2017/4/22.
 */
public class ArticleType {

    private int article_type_id;

    private String article_type_name;

    public int getArticle_type_id() {
        return article_type_id;
    }

    public void setArticle_type_id(int article_type_id) {
        this.article_type_id = article_type_id;
    }

    public String getArticle_type_name() {
        return article_type_name;
    }

    public void setArticle_type_name(String article_type_name) {
        this.article_type_name = article_type_name;
    }

    @Override
    public String toString() {
        return "ArticleType{" +
                "article_type_id=" + article_type_id +
                ", article_type_name='" + article_type_name + '\'' +
                '}';
    }
}
