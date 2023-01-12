package com.ruoyi.edoc.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edoc.mapper.CommentInfoMapper;
import com.ruoyi.edoc.domain.CommentInfo;
import com.ruoyi.edoc.service.ICommentInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 批注Service业务层处理
 * 
 * @author xuce
 * @date 2020-09-09
 */
@Service
public class CommentInfoServiceImpl implements ICommentInfoService 
{
    @Autowired
    private CommentInfoMapper commentInfoMapper;

    /**
     * 查询批注
     * 
     * @param commentNum 批注ID
     * @return 批注
     */
    @Override
    public CommentInfo selectCommentInfoById(Long commentNum)
    {
        return commentInfoMapper.selectCommentInfoById(commentNum);
    }

    /**
     * 查询批注列表
     * 
     * @param commentInfo 批注
     * @return 批注
     */
    @Override
    public List<CommentInfo> selectCommentInfoList(CommentInfo commentInfo)
    {
        return commentInfoMapper.selectCommentInfoList(commentInfo);
    }

    /**
     * 新增批注
     * 
     * @param commentInfo 批注
     * @return 结果
     */
    @Override
    public int insertCommentInfo(CommentInfo commentInfo)
    {
        return commentInfoMapper.insertCommentInfo(commentInfo);
    }

    /**
     * 修改批注
     * 
     * @param commentInfo 批注
     * @return 结果
     */
    @Override
    public int updateCommentInfo(CommentInfo commentInfo)
    {
        return commentInfoMapper.updateCommentInfo(commentInfo);
    }

    /**
     * 删除批注对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCommentInfoByIds(String ids)
    {
        return commentInfoMapper.deleteCommentInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除批注信息
     * 
     * @param commentNum 批注ID
     * @return 结果
     */
    @Override
    public int deleteCommentInfoById(Long commentNum)
    {
        return commentInfoMapper.deleteCommentInfoById(commentNum);
    }

    /**
     * 查询批注内容
     *
     * @param billNumUuid 文书uuid
     * @return 结果
     */
    @Override
    public CommentInfo selectCommentInfoByBillUuid(Long billNumUuid)
    {
       return commentInfoMapper.selectCommentInfoByBillUuid(billNumUuid);
    }

    /**
     * 新增批注
     *
     * @param commentInfo 批注
     * @return 结果
     */
    @Override
    public int insertCommentInfoByBillUuid(CommentInfo commentInfo)
    {
        return commentInfoMapper.insertCommentInfoByBillUuid(commentInfo);
    }

    /**
     * 修改批注
     *
     * @param billNumUuid 文书uuid
     * @param commentText 批注内容
     * @param operName 操作人
     * @return 结果
     */
    @Override
    public int updateCommentInfoByBillUuid(Long billNumUuid, String commentText, String operName)
    {
        CommentInfo commentInfo = commentInfoMapper.selectCommentInfoByBillUuid(billNumUuid);
        commentInfo.setCommentText(commentText);
        commentInfo.setUpdateBy(operName);
        commentInfo.setUpdateDatetime(DateUtils.getNowDate());
        return commentInfoMapper.updateCommentInfoByBillUuid(commentInfo);
    }

}
