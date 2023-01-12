package com.ruoyi.edoc.service;

import java.util.List;
import com.ruoyi.edoc.domain.ReturnJsonInfo;

/**
 * 分析结果Service接口
 * 
 * @author xuce
 * @date 2020-08-25
 */
public interface IReturnJsonInfoService 
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
     * @param billUid 起诉文书uid
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
     * 批量删除分析结果
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteReturnJsonInfoByIds(String ids);

    /**
     * 删除分析结果信息
     * 
     * @param jsonUid 分析结果ID
     * @return 结果
     */
    public int deleteReturnJsonInfoById(Long jsonUid);
}
