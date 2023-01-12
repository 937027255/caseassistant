package com.ruoyi.edoc.mapper;

import java.util.List;
import com.ruoyi.edoc.domain.ReturnJsonInfo;

/**
 * 分析结果Mapper接口
 * 
 * @author xuce
 * @date 2020-08-25
 */
public interface ReturnJsonInfoMapper 
{
    /**
     * 查询分析结果
     * 
     * @param jsonUid 分析结果ID
     * @return 分析结果
     */
    public ReturnJsonInfo selectReturnJsonInfoById(Long jsonUid);

    /**
     * 查询分析结果
     *
     * @param billUid 起诉文书ID
     * @return 分析结果
     */
    public ReturnJsonInfo selectReturnJsonInfoByBillUid(Long billUid);

    /**
     * 查询分析结果列表
     * 
     * @param returnJsonInfo 分析结果
     * @return 分析结果集合
     */
    public List<ReturnJsonInfo> selectReturnJsonInfoList(ReturnJsonInfo returnJsonInfo);

    /**
     * 新增分析结果
     * 
     * @param returnJsonInfo 分析结果
     * @return 结果
     */
    public int insertReturnJsonInfo(ReturnJsonInfo returnJsonInfo);

    /**
     * 修改分析结果
     * 
     * @param returnJsonInfo 分析结果
     * @return 结果
     */
    public int updateReturnJsonInfo(ReturnJsonInfo returnJsonInfo);

    /**
     * 删除分析结果
     * 
     * @param jsonUid 分析结果ID
     * @return 结果
     */
    public int deleteReturnJsonInfoById(Long jsonUid);

    /**
     * 批量删除分析结果
     * 
     * @param jsonUids 需要删除的数据ID
     * @return 结果
     */
    public int deleteReturnJsonInfoByIds(String[] jsonUids);
}
