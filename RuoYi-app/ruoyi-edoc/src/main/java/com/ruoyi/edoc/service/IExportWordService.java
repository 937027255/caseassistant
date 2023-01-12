package com.ruoyi.edoc.service;


import java.util.List;

/**
 * 导出审查报告Service接口
 *
 * @author BillXuce
 * @date 2020-09-10
 */
public interface IExportWordService {

    /**
     * 查询起诉文书信息
     *  @param ids 起诉文书信息ID列表
     * @param operName 操作人
     * @return
     */
    public String exportWord(List<String> ids, String operName) throws Exception;

}
