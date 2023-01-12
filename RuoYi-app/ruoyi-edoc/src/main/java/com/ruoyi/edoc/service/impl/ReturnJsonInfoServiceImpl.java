package com.ruoyi.edoc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edoc.mapper.ReturnJsonInfoMapper;
import com.ruoyi.edoc.domain.ReturnJsonInfo;
import com.ruoyi.edoc.service.IReturnJsonInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 分析结果Service业务层处理
 * 
 * @author xuce
 * @date 2020-08-25
 */
@Service
public class ReturnJsonInfoServiceImpl implements IReturnJsonInfoService 
{
    @Autowired
    private ReturnJsonInfoMapper returnJsonInfoMapper;

    /**
     * 查询分析结果
     * 
     * @param jsonUid 分析结果ID
     * @return 分析结果
     */
    @Override
    public ReturnJsonInfo selectReturnJsonInfoById(Long jsonUid)
    {
        return returnJsonInfoMapper.selectReturnJsonInfoById(jsonUid);
    }

    /**
     * 查询分析结果
     *
     * @param billUid 起诉文书ID
     * @return 分析结果
     */
    @Override
    public ReturnJsonInfo selectReturnJsonInfoByBillUid(Long billUid)
    {
        return returnJsonInfoMapper.selectReturnJsonInfoByBillUid(billUid);
    }

    /**
     * 查询分析结果列表
     * 
     * @param returnJsonInfo 分析结果
     * @return 分析结果
     */
    @Override
    public List<ReturnJsonInfo> selectReturnJsonInfoList(ReturnJsonInfo returnJsonInfo)
    {
        return returnJsonInfoMapper.selectReturnJsonInfoList(returnJsonInfo);
    }

    /**
     * 新增分析结果
     * 
     * @param returnJsonInfo 分析结果
     * @return 结果
     */
    @Override
    public int insertReturnJsonInfo(ReturnJsonInfo returnJsonInfo)
    {
        return returnJsonInfoMapper.insertReturnJsonInfo(returnJsonInfo);
    }

    /**
     * 修改分析结果
     * 
     * @param returnJsonInfo 分析结果
     * @return 结果
     */
    @Override
    public int updateReturnJsonInfo(ReturnJsonInfo returnJsonInfo)
    {
        return returnJsonInfoMapper.updateReturnJsonInfo(returnJsonInfo);
    }

    /**
     * 删除分析结果对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteReturnJsonInfoByIds(String ids)
    {
        return returnJsonInfoMapper.deleteReturnJsonInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除分析结果信息
     * 
     * @param jsonUid 分析结果ID
     * @return 结果
     */
    @Override
    public int deleteReturnJsonInfoById(Long jsonUid)
    {
        return returnJsonInfoMapper.deleteReturnJsonInfoById(jsonUid);
    }
}
