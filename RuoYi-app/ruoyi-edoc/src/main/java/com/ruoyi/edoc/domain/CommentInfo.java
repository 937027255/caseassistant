package com.ruoyi.edoc.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 comment_info
 * 
 * @author xuce
 * @date 2020-09-09
 */
public class CommentInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批注编号 */
    private Long commentNum;

    /** 文书编号 */
    @Excel(name = "文书编号")
    private String billNum;

    /** 批注内容 */
    @Excel(name = "批注内容")
    private String commentText;

    /** 文书uuid */
    private Long billNumUuid;

    /** 记录状态 */
    @Excel(name = "记录状态")
    private Integer recordStatus;

    /** 创建时间 */
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDatetime;

    /** 更新时间 */
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDatetime;

    public void setCommentNum(Long commentNum) 
    {
        this.commentNum = commentNum;
    }

    public Long getCommentNum() 
    {
        return commentNum;
    }
    public void setBillNum(String billNum) 
    {
        this.billNum = billNum;
    }

    public String getBillNum() 
    {
        return billNum;
    }
    public void setCommentText(String commentText) 
    {
        this.commentText = commentText;
    }

    public String getCommentText() 
    {
        return commentText;
    }
    public void setBillNumUuid(Long billNumUuid) 
    {
        this.billNumUuid = billNumUuid;
    }

    public Long getBillNumUuid() 
    {
        return billNumUuid;
    }
    public void setRecordStatus(Integer recordStatus) 
    {
        this.recordStatus = recordStatus;
    }

    public Integer getRecordStatus() 
    {
        return recordStatus;
    }
    public void setCreateDatetime(Date createDatetime) 
    {
        this.createDatetime = createDatetime;
    }

    public Date getCreateDatetime() 
    {
        return createDatetime;
    }
    public void setUpdateDatetime(Date updateDatetime) 
    {
        this.updateDatetime = updateDatetime;
    }

    public Date getUpdateDatetime() 
    {
        return updateDatetime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("commentNum", getCommentNum())
            .append("billNum", getBillNum())
            .append("commentText", getCommentText())
            .append("billNumUuid", getBillNumUuid())
            .append("recordStatus", getRecordStatus())
            .append("createDatetime", getCreateDatetime())
            .append("createBy", getCreateBy())
            .append("updateDatetime", getUpdateDatetime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
