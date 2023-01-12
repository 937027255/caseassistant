package com.ruoyi.edoc.service;

import java.util.List;
import com.ruoyi.edoc.domain.CommentInfo;

/**
 * 批注Service接口
 * 
 * @author xuce
 * @date 2020-09-09
 */
public interface ICommentInfoService 
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
     * 批量删除批注
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCommentInfoByIds(String ids);

    /**
     * 删除批注信息
     * 
     * @param commentNum 批注ID
     * @return 结果
     */
    public int deleteCommentInfoById(Long commentNum);

    /**
     * 查询批注内容
     *
     * @param billNumUuid 文书uuid
     * @return 结果
     */
    public CommentInfo selectCommentInfoByBillUuid(Long billNumUuid);

    /**
     * 新增批注
     *
     * @param commentInfo 批注
     * @return 结果
     */
    public int insertCommentInfoByBillUuid(CommentInfo commentInfo);

    /**
     * 修改批注
     *
     * @param billNumUuid 文书uuid
     * @param commentText 批注内容
     * @return 结果
     */
    public int updateCommentInfoByBillUuid(Long billNumUuid, String commentText, String operName);
}
