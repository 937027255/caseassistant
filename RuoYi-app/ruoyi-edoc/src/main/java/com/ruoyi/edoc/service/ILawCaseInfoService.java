package com.ruoyi.edoc.service;

import java.util.List;
import com.ruoyi.edoc.domain.LawCaseInfo;

/**
 * 案件信息Service接口
 * 
 * @author xuce
 * @date 2020-08-22
 */
public interface ILawCaseInfoService 
{
    /**
     * 查询案件信息
     * 
     * @param lowCaseNum 案件信息ID
     * @return 案件信息
     */
    public LawCaseInfo selectLawCaseInfoById(String lowCaseNum);

    /**
     * 查询案件信息列表
     * 
     * @param lawCaseInfo 案件信息
     * @return 案件信息集合
     */
    public List<LawCaseInfo> selectLawCaseInfoList(LawCaseInfo lawCaseInfo);

    /**
     * 新增案件信息
     * 
     * @param lawCaseInfo 案件信息
     * @param operName 操作人
     * @return 结果
     */
    public int insertLawCaseInfo(LawCaseInfo lawCaseInfo, String operName);

    /**
     * 修改案件信息
     * 
     * @param lawCaseInfo 案件信息
     * @param operName 操作人
     * @return 结果
     */
    public int updateLawCaseInfo(LawCaseInfo lawCaseInfo, String operName);

    /**
     * 批量删除案件信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLawCaseInfoByIds(String ids);

    /**
     * 删除案件信息信息
     * 
     * @param lowCaseNum 案件信息ID
     * @return 结果
     */
    public int deleteLawCaseInfoById(String lowCaseNum);

    /**
     * 假删除案件信息信息
     *
     * @param ids 需要删除的数据ID
     * @param operName 操作人
     * @return 结果
     */
    public int fakeDeleteLawCaseInfoById(String ids, String operName);
}
