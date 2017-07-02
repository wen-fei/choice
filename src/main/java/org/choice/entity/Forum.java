package org.choice.entity;

/**
 * Created by user on 2017/4/22.
 */
public class Forum {
    private int forum_id;

    private String forum_name;

    private long forum_controller_id;

    private int moduleCounts;

    private UserInfo userInfo;

    private Module module;  //一对多

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public int getModuleCounts() {
        return moduleCounts;
    }

    public void setModuleCounts(int moduleCounts) {
        this.moduleCounts = moduleCounts;
    }

    public int getForum_id() {
        return forum_id;
    }

    public void setForum_id(int forum_id) {
        this.forum_id = forum_id;
    }

    public String getForum_name() {
        return forum_name;
    }

    public void setForum_name(String forum_name) {
        this.forum_name = forum_name;
    }

    public long getForum_controller_id() {
        return forum_controller_id;
    }

    public void setForum_controller_id(long forum_controller_id) {
        this.forum_controller_id = forum_controller_id;
    }

    @Override
    public String toString() {
        return "Forum{" +
                "forum_id=" + forum_id +
                ", forum_name='" + forum_name + '\'' +
                ", forum_controller_id=" + forum_controller_id +
                '}';
    }
}
