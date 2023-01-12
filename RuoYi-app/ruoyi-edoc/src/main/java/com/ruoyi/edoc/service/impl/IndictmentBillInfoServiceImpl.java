package com.ruoyi.edoc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.edoc.domain.LowRecordInfo;
import com.ruoyi.edoc.mapper.LowRecordInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edoc.mapper.IndictmentBillInfoMapper;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 起诉文书信息Service业务层处理
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Service
public class IndictmentBillInfoServiceImpl implements IIndictmentBillInfoService 
{
    @Autowired
    private IndictmentBillInfoMapper indictmentBillInfoMapper;

    @Autowired
    private LowRecordInfoMapper lowRecordInfoMapper;

    /**
     * 查询起诉文书信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 起诉文书信息
     */
    @Override
    public IndictmentBillInfo selectIndictmentBillInfoById(Long uuid)
    {
        return indictmentBillInfoMapper.selectIndictmentBillInfoById(uuid);
    }

    /**
     * 查询起诉文书信息
     *
     * @param billNum 起诉文书信息ID
     * @return 起诉文书信息
     */
    @Override
    public IndictmentBillInfo selectIndictmentBillInfoByBillNum(String billNum) {
        return indictmentBillInfoMapper.selectIndictmentBillInfoByBillNum(billNum);
    }

    /**
     * 查询起诉文书信息列表
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息
     */
    @Override
    public List<IndictmentBillInfo> selectIndictmentBillInfoList(IndictmentBillInfo indictmentBillInfo)
    {
        return indictmentBillInfoMapper.selectIndictmentBillInfoList(indictmentBillInfo);
    }

    /**
     * 新增起诉文书信息
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @return 结果
     */
    @Override
    public int insertIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo, String operName)
    {
        indictmentBillInfo.setCreateBy(operName);
        indictmentBillInfo.setCreateDatetime(DateUtils.getNowDate());
        indictmentBillInfo.setUpdateBy(operName);
        indictmentBillInfo.setUpdateDatetime(DateUtils.getNowDate());
        return indictmentBillInfoMapper.insertIndictmentBillInfo(indictmentBillInfo);
    }

    /**
     * 修改起诉文书信息
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @return 结果
     */
    @Override
    public int updateIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo, String operName)
    {
        indictmentBillInfo.setUpdateBy(operName);
        indictmentBillInfo.setUpdateDatetime(DateUtils.getNowDate());
        return indictmentBillInfoMapper.updateIndictmentBillInfo(indictmentBillInfo);
    }

    /**
     * 删除起诉文书信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteIndictmentBillInfoByIds(String ids)
    {
        return indictmentBillInfoMapper.deleteIndictmentBillInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除起诉文书信息信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 结果
     */
    @Override
    public int deleteIndictmentBillInfoById(Long uuid)
    {
        return indictmentBillInfoMapper.deleteIndictmentBillInfoById(uuid);
    }


    /**
     * 假删除起诉文书信息信息
     *
     * @param ids 需要删除的数据ID
     * @param operName 操作人
     * @return 结果
     */
    @Override
    public int fakeDeleteIndictmentBillInfoById(String ids, String operName)
    {
        List<String> idsList = Arrays.asList(ids.split(","));
        try{
            for(String x: idsList){
                IndictmentBillInfo indictmentBillInfo = indictmentBillInfoMapper.selectIndictmentBillInfoById(Long.valueOf(ids));
                String billNum = indictmentBillInfo.getBillNum();
                indictmentBillInfo.setRecordStatus("0");
                indictmentBillInfo.setUpdateBy(operName);
                indictmentBillInfo.setUpdateDatetime(DateUtils.getNowDate());
                indictmentBillInfoMapper.updateIndictmentBillInfo(indictmentBillInfo);
                List<LowRecordInfo> lowRecordInfoList = lowRecordInfoMapper.selectLowRecordInfoByBillNum(billNum);
                for( LowRecordInfo lowRecordInfo: lowRecordInfoList){
                    lowRecordInfo.setRecordStatus("0");
                    lowRecordInfo.setUpdateBy(operName);
                    lowRecordInfo.setUpdateDatetime(DateUtils.getNowDate());
                    lowRecordInfoMapper.updateLowRecordInfo(lowRecordInfo);
                }
            }
            return 1;
        } catch(Exception e){
            return 0;
        }
    }

    /**
     * 根据承办人查询起诉文书信息列表
     *
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    @Override
    public List<IndictmentBillInfo> selectIndictmentBillInfoListByResponseBy(IndictmentBillInfo indictmentBillInfo) {
        return indictmentBillInfoMapper.selectIndictmentBillInfoListByResponseBy(indictmentBillInfo);
    }

    /**
     * 根据承办人获取文书编号列表
     *
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    @Override
    public List<String> getAuthorizedBillNumByResponseBy(IndictmentBillInfo indictmentBillInfo) {
        List<IndictmentBillInfo> indictmentBillInfoList = indictmentBillInfoMapper.selectIndictmentBillInfoListByResponseBy(indictmentBillInfo);
        List<String> billNumList = new ArrayList<>();
        for(IndictmentBillInfo x: indictmentBillInfoList) billNumList.add(x.getBillNum());
        return billNumList;
    }


}
