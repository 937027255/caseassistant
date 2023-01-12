package com.ruoyi.edoc.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edoc.mapper.LawCaseInfoMapper;
import com.ruoyi.edoc.domain.LawCaseInfo;
import com.ruoyi.edoc.service.ILawCaseInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 案件信息Service业务层处理
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Service
public class LawCaseInfoServiceImpl implements ILawCaseInfoService 
{
    @Autowired
    private LawCaseInfoMapper lawCaseInfoMapper;

    /**
     * 查询案件信息
     * 
     * @param lowCaseNum 案件信息ID
     * @return 案件信息
     */
    @Override
    public LawCaseInfo selectLawCaseInfoById(String lowCaseNum)
    {
        return lawCaseInfoMapper.selectLawCaseInfoById(lowCaseNum);
    }

    /**
     * 查询案件信息列表
     * 
     * @param lawCaseInfo 案件信息
     * @return 案件信息
     */
    @Override
    public List<LawCaseInfo> selectLawCaseInfoList(LawCaseInfo lawCaseInfo)
    {
        return lawCaseInfoMapper.selectLawCaseInfoList(lawCaseInfo);
    }

    /**
     * 新增案件信息
     * 
     * @param lawCaseInfo 案件信息
     * @return 结果
     */
    @Override
    public int insertLawCaseInfo(LawCaseInfo lawCaseInfo, String operName)
    {
        lawCaseInfo.setCreateBy(operName);
        lawCaseInfo.setCreateDatetime(DateUtils.getNowDate());
        lawCaseInfo.setUpdateBy(operName);
        lawCaseInfo.setUpdateDatetime(DateUtils.getNowDate());
        return lawCaseInfoMapper.insertLawCaseInfo(lawCaseInfo);
    }

    /**
     * 修改案件信息
     * 
     * @param lawCaseInfo 案件信息
     * @return 结果
     */
    @Override
    public int updateLawCaseInfo(LawCaseInfo lawCaseInfo, String operName)
    {
        lawCaseInfo.setUpdateBy(operName);
        lawCaseInfo.setUpdateDatetime(DateUtils.getNowDate());
        return lawCaseInfoMapper.updateLawCaseInfo(lawCaseInfo);
    }

    /**
     * 删除案件信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteLawCaseInfoByIds(String ids)
    {
        return lawCaseInfoMapper.deleteLawCaseInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除案件信息信息
     * 
     * @param lowCaseNum 案件信息ID
     * @return 结果
     */
    @Override
    public int deleteLawCaseInfoById(String lowCaseNum)
    {
        return lawCaseInfoMapper.deleteLawCaseInfoById(lowCaseNum);
    }

    /**
     * 假删除案件信息信息
     *
     * @param ids 需要删除的数据ID
     * @param operName 操作人
     * @return 结果
     */
    @Override
    public int fakeDeleteLawCaseInfoById(String ids, String operName)
    {
        LawCaseInfo lawCaseInfo = lawCaseInfoMapper.selectLawCaseInfoById(ids);
        lawCaseInfo.setRecordStatus("0");
        lawCaseInfo.setUpdateBy(operName);
        lawCaseInfo.setUpdateDatetime(DateUtils.getNowDate());
        return lawCaseInfoMapper.updateLawCaseInfo(lawCaseInfo);
    }
}
