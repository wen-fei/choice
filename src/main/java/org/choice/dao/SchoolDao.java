package org.choice.dao;

import org.choice.entity.School;

/**
 * Created by user on 2017/4/24.
 */
public interface SchoolDao {

    /**
     * 根据学校id查找学校信息
     * @param schoolId
     * @return
     */
    School getSchoolInfoById(int schoolId);
}
