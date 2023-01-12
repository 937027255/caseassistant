package com.ruoyi.edoc.mapper;

import java.util.List;
import com.ruoyi.edoc.domain.LawCaseInfo;

/**
 * 案件信息Mapper接口
 * 
 * @author xuce
 * @date 2020-08-22
 */
public interface LawCaseInfoMapper 
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
     * @return 结果
     */
    public int insertLawCaseInfo(LawCaseInfo lawCaseInfo);

    /**
     * 修改案件信息
     * 
     * @param lawCaseInfo 案件信息
     * @return 结果
     */
    public int updateLawCaseInfo(LawCaseInfo lawCaseInfo);

    /**
     * 删除案件信息
     * 
     * @param lowCaseNum 案件信息ID
     * @return 结果
     */
    public int deleteLawCaseInfoById(String lowCaseNum);

    /**
     * 批量删除案件信息
     * 
     * @param lowCaseNums 需要删除的数据ID
     * @return 结果
     */
    public int deleteLawCaseInfoByIds(String[] lowCaseNums);
}
