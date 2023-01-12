package com.ruoyi.edoc.service;

import java.util.List;
import com.ruoyi.edoc.domain.IndictmentBillInfo;

/**
 * 起诉文书信息Service接口
 * 
 * @author xuce
 * @date 2020-08-22
 */
public interface IIndictmentBillInfoService 
{
    /**
     * 查询起诉文书信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 起诉文书信息
     */
    public IndictmentBillInfo selectIndictmentBillInfoById(Long uuid);

    IndictmentBillInfo selectIndictmentBillInfoByBillNum(String billNum);

    /**
     * 查询起诉文书信息列表
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    public List<IndictmentBillInfo> selectIndictmentBillInfoList(IndictmentBillInfo indictmentBillInfo);

    /**
     * 新增起诉文书信息
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @param operName 操作人
     * @return 结果
     */
    public int insertIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo, String operName);

    /**
     * 修改起诉文书信息
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @param operName 操作人
     * @return 结果
     */
    public int updateIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo, String operName);

    /**
     * 批量删除起诉文书信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteIndictmentBillInfoByIds(String ids);

    /**
     * 删除起诉文书信息信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 结果
     */
    public int deleteIndictmentBillInfoById(Long uuid);

    /**
     * 假删除起诉文书信息信息
     *
     * @param ids 起诉文书信息ID
     * @param operName 操作人
     * @return 结果
     */
    public int fakeDeleteIndictmentBillInfoById(String ids, String operName);

    /**
     * 根据承办人查询起诉文书信息列表
     *
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    public List<IndictmentBillInfo> selectIndictmentBillInfoListByResponseBy(IndictmentBillInfo indictmentBillInfo);

    /**
     * 根据承办人获取文书编号列表
     *
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    public List<String> getAuthorizedBillNumByResponseBy(IndictmentBillInfo indictmentBillInfo);
}
