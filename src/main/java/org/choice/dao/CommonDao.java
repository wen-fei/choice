package org.choice.dao;

/**
 * Created by user on 2017/5/26.
 */

import org.apache.ibatis.annotations.Param;

/**
 * 通用方法DAO
 */
public interface CommonDao {
    /**
     * 删除表中某条记录
     * @param tableName 表名
     * @param rowId     记录ID
     * @return
     */
    int deleteOne(@Param("tableName") String tableName,
                  @Param("rowName") String rowName,
                  @Param("rowId") long rowId);
}
