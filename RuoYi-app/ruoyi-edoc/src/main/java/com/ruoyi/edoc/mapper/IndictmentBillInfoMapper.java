package com.ruoyi.edoc.mapper;

import java.util.List;
import com.ruoyi.edoc.domain.IndictmentBillInfo;

/**
 * 起诉文书信息Mapper接口
 * 
 * @author xuce
 * @date 2020-08-22
 */
public interface IndictmentBillInfoMapper 
{
    /**
     * 查询起诉文书信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 起诉文书信息
     */
    public IndictmentBillInfo selectIndictmentBillInfoById(Long uuid);

    /**
     * 查询起诉文书信息
     *
     * @param billNum 起诉文书信息ID
     * @return 起诉文书信息
     */
    public IndictmentBillInfo selectIndictmentBillInfoByBillNum(String billNum);

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
     * @return 结果
     */
    public int insertIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo);

    /**
     * 修改起诉文书信息
     * 
     * @param indictmentBillInfo 起诉文书信息
     * @return 结果
     */
    public int updateIndictmentBillInfo(IndictmentBillInfo indictmentBillInfo);

    /**
     * 删除起诉文书信息
     * 
     * @param uuid 起诉文书信息ID
     * @return 结果
     */
    public int deleteIndictmentBillInfoById(Long uuid);

    /**
     * 批量删除起诉文书信息
     * 
     * @param uuids 需要删除的数据ID
     * @return 结果
     */
    public int deleteIndictmentBillInfoByIds(String[] uuids);

    /**
     * 通过查询起诉文书信息列表
     *
     * @param indictmentBillInfo 起诉文书信息
     * @return 起诉文书信息集合
     */
    public List<IndictmentBillInfo> selectIndictmentBillInfoListByResponseBy(IndictmentBillInfo indictmentBillInfo);
}
