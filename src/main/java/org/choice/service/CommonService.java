package org.choice.service;

/**
 * Created by user on 2017/5/26.
 */
public interface CommonService {

    /**
     * 批量删除
     * @param tableName
     * @param rowName
     * @param rowIds
     * @return
     */
    void deleteBatchs(String tableName, String rowName, long[] rowIds);
}
