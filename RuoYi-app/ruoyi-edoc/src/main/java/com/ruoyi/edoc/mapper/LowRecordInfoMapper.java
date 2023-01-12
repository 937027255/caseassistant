package com.ruoyi.edoc.mapper;

import java.util.List;
import com.ruoyi.edoc.domain.LowRecordInfo;

/**
 * 笔录信息Mapper接口
 * 
 * @author xuce
 * @date 2020-08-22
 */
public interface LowRecordInfoMapper 
{
    /**
     * 查询笔录信息
     * 
     * @param uuid 笔录信息ID
     * @return 笔录信息
     */
    public LowRecordInfo selectLowRecordInfoById(Long uuid);

    /**
     * 根据文书编号查询笔录信息
     *
     * @param billNum 文书ID
     * @return 笔录信息
     */
    public List<LowRecordInfo> selectLowRecordInfoByBillNum(String billNum);

    /**
     * 根据文书编号列表查询笔录信息
     *
     * @param billNumList 文书ID列表
     * @return 笔录信息列表
     */
    public List<LowRecordInfo> selectLowRecordInfoByBillNumList(List<String> billNumList);

    /**
     * 查询笔录信息列表
     * 
     * @param lowRecordInfo 笔录信息
     * @return 笔录信息集合
     */
    public List<LowRecordInfo> selectLowRecordInfoList(LowRecordInfo lowRecordInfo);

    /**
     * 新增笔录信息
     * 
     * @param lowRecordInfo 笔录信息
     * @return 结果
     */
    public int insertLowRecordInfo(LowRecordInfo lowRecordInfo);

    /**
     * 修改笔录信息
     * 
     * @param lowRecordInfo 笔录信息
     * @return 结果
     */
    public int updateLowRecordInfo(LowRecordInfo lowRecordInfo);

    /**
     * 删除笔录信息
     * 
     * @param uuid 笔录信息ID
     * @return 结果
     */
    public int deleteLowRecordInfoById(Long uuid);

    /**
     * 批量删除笔录信息
     * 
     * @param uuids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLowRecordInfoByIds(String[] uuids);
}
