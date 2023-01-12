package com.ruoyi.edoc.mapper;

import java.util.List;
import com.ruoyi.edoc.domain.CommentInfo;

/**
 * 批注Mapper接口
 * 
 * @author xuce
 * @date 2020-09-09
 */
public interface CommentInfoMapper 
{
    /**
     * 查询批注
     * 
     * @param commentNum 批注ID
     * @return 批注
     */
    public CommentInfo selectCommentInfoById(Long commentNum);

    /**
     * 查询批注列表
     * 
     * @param commentInfo 批注
     * @return 批注集合
     */
    public List<CommentInfo> selectCommentInfoList(CommentInfo commentInfo);

    /**
     * 新增批注
     * 
     * @param commentInfo 批注
     * @return 结果
     */
    public int insertCommentInfo(CommentInfo commentInfo);

    /**
     * 修改批注
     * 
     * @param commentInfo 批注
     * @return 结果
     */
    public int updateCommentInfo(CommentInfo commentInfo);

    /**
     * 删除批注
     * 
     * @param commentNum 批注ID
     * @return 结果
     */
    public int deleteCommentInfoById(Long commentNum);

    /**
     * 批量删除批注
     * 
     * @param commentNums 需要删除的数据ID
     * @return 结果
     */
    public int deleteCommentInfoByIds(String[] commentNums);

    /**
     * 查询批注
     *
     * @param billNumUuid 批注ID
     * @return 批注
     */
    public CommentInfo selectCommentInfoByBillUuid(Long billNumUuid);

    /**
     * 新增批注
     *
     * @param billNumUuid 文书uuid
     *
     * @return 结果
     */
    public int insertCommentInfoByBillUuid(CommentInfo commentInfo);

    /**
     * 修改批注
     *
     * @param billNumUuid 文书uuid
     * @return 结果
     */
    public int updateCommentInfoByBillUuid(CommentInfo commentInfo);
}
