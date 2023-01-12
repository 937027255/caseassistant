package com.ruoyi.edoc.service;


import java.util.List;

/**
 * 调用分析APIService接口
 *
 * @author BillXuce
 * @date 2020-09-02
 */
public interface IAnalyzingService {

    /**
     * 提交卷宗分析请求
     *
     * @param BillUid 起诉文书信息ID
     * @param operName 操作人
     * @return boolean
     */
    public boolean SubmitAnalyzingRequest(Long BillUid, String operName) throws Exception;

    /**
     * 提交案卡分析请求
     *
     * @param inputStrings
     * @param operName 操作人
     * @return boolean
     */
    public boolean SubmitAnkaRequest(List<String> inputStrings, String operName) throws Exception;
}
