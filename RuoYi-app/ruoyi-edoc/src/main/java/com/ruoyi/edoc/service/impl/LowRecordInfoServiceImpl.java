package com.ruoyi.edoc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edoc.mapper.LowRecordInfoMapper;
import com.ruoyi.edoc.domain.LowRecordInfo;
import com.ruoyi.edoc.service.ILowRecordInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 笔录信息Service业务层处理
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Service
public class LowRecordInfoServiceImpl implements ILowRecordInfoService 
{
    @Autowired
    private LowRecordInfoMapper lowRecordInfoMapper;

    /**
     * 查询笔录信息
     * 
     * @param uuid 笔录信息ID
     * @return 笔录信息
     */
    @Override
    public LowRecordInfo selectLowRecordInfoById(Long uuid)
    {
        return lowRecordInfoMapper.selectLowRecordInfoById(uuid);
    }

    /**
     * 查询笔录信息
     *
     * @param billNum 文书编号
     * @return 笔录信息
     */
    @Override
    public List<LowRecordInfo> selectLowRecordInfoByBillNum(String billNum)
    {
        return lowRecordInfoMapper.selectLowRecordInfoByBillNum(billNum);
    }

    @Override
    public List<LowRecordInfo> selectLowRecordInfoByBillNumList(List<String> billNumList) {
        if(billNumList.isEmpty()) return new ArrayList<>();
        else return lowRecordInfoMapper.selectLowRecordInfoByBillNumList(billNumList);
    }


    /**
     * 查询笔录信息列表
     * 
     * @param lowRecordInfo 笔录信息
     * @return 笔录信息
     */
    @Override
    public List<LowRecordInfo> selectLowRecordInfoList(LowRecordInfo lowRecordInfo)
    {
        return lowRecordInfoMapper.selectLowRecordInfoList(lowRecordInfo);
    }

    /**
     * 新增笔录信息
     * 
     * @param lowRecordInfo 笔录信息
     * @return 结果
     */
    @Override
    public int insertLowRecordInfo(LowRecordInfo lowRecordInfo, String operName)
    {
        lowRecordInfo.setCreateBy(operName);
        lowRecordInfo.setCreateDatetime(DateUtils.getNowDate());
        lowRecordInfo.setUpdateBy(operName);
        lowRecordInfo.setUpdateDatetime(DateUtils.getNowDate());
        return lowRecordInfoMapper.insertLowRecordInfo(lowRecordInfo);
    }

    /**
     * 修改笔录信息
     * 
     * @param lowRecordInfo 笔录信息
     * @return 结果
     */
    @Override
    public int updateLowRecordInfo(LowRecordInfo lowRecordInfo, String operName)
    {
        lowRecordInfo.setUpdateBy(operName);
        lowRecordInfo.setUpdateDatetime(DateUtils.getNowDate());
        return lowRecordInfoMapper.updateLowRecordInfo(lowRecordInfo);
    }

    /**
     * 删除笔录信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteLowRecordInfoByIds(String ids)
    {
        return lowRecordInfoMapper.deleteLowRecordInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除笔录信息信息
     * 
     * @param uuid 笔录信息ID
     * @return 结果
     */
    @Override
    public int deleteLowRecordInfoById(Long uuid)
    {
        return lowRecordInfoMapper.deleteLowRecordInfoById(uuid);
    }

    /**
     * 假删除笔录信息信息
     *
     * @param ids 笔录信息ID
     * @param operName 操作人
     * @return 结果
     */
    @Override
    public boolean fakeDeleteLowRecordInfoById(String ids,String operName)
    {
        List<String> idsList = Arrays.asList(ids.split(","));
        try{
            for(String x: idsList){
                LowRecordInfo lowRecordInfo = lowRecordInfoMapper.selectLowRecordInfoById(Long.valueOf(x));
                lowRecordInfo.setRecordStatus("0");
                lowRecordInfo.setUpdateBy(operName);
                lowRecordInfo.setUpdateDatetime(DateUtils.getNowDate());
                lowRecordInfoMapper.updateLowRecordInfo(lowRecordInfo);
            }
            return true;
        } catch(Exception e){
            return false;
        }
    }
}
