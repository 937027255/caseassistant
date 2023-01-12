package com.ruoyi.edoc.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 笔录信息对象 low_record_info
 * 
 * @author xuce
 * @date 2020-08-22
 */
public class LowRecordInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文书编号 */
    @Excel(name = "文书编号")
    private String billNum;

    /** 笔录编号 */
    @Excel(name = "笔录编号")
    private String lowRecordNum;

    /** 笔录类型 */
    @Excel(name = "笔录类型")
    private String lowRecordType;

    /** 笔录模板 */
    private String lowRecordTemplate;

    /** 案件地点 */
    private String lowRecordCaseAddress;

    /** 询/讯问人 */
    @Excel(name = "询/讯问人")
    private String lowRecordInterviewerName;

    /** 被询/讯问人 */
    @Excel(name = "被询/讯问人")
    private String lowRecordIntervieweeName;

    /** 被询问人身份证号 */
    private String lowRecordIntervieweeId;

    /** 笔录日期 */
    @Excel(name = "笔录日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lowRecordDate;

    /** 笔录开始时间 */
    private String lowRecordStartTime;

    /** 笔录结束时间 */
    private String lowRecordEndTime;

    /** 笔录内容 */
    private String lowRecordContent;

    /** 笔录人 */
    @Excel(name = "笔录人")
    private String lowRecordNoteTaker;

    /** 笔录次数 */
    private Long lowRecordTimes;

    /** 记录状态 */
    private String recordStatus;

    /** 创建时间 */
    private Date createDatetime;

    /** 更新时间 */
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDatetime;

    /** uuid */
    private Long uuid;

    public void setBillNum(String billNum) 
    {
        this.billNum = billNum;
    }

    public String getBillNum() 
    {
        return billNum;
    }
    public void setLowRecordNum(String lowRecordNum) 
    {
        this.lowRecordNum = lowRecordNum;
    }

    public String getLowRecordNum() 
    {
        return lowRecordNum;
    }
    public void setLowRecordType(String lowRecordType) 
    {
        this.lowRecordType = lowRecordType;
    }

    public String getLowRecordType() 
    {
        return lowRecordType;
    }
    public void setLowRecordTemplate(String lowRecordTemplate) 
    {
        this.lowRecordTemplate = lowRecordTemplate;
    }

    public String getLowRecordTemplate() 
    {
        return lowRecordTemplate;
    }
    public void setLowRecordCaseAddress(String lowRecordCaseAddress) 
    {
        this.lowRecordCaseAddress = lowRecordCaseAddress;
    }

    public String getLowRecordCaseAddress() 
    {
        return lowRecordCaseAddress;
    }
    public void setLowRecordInterviewerName(String lowRecordInterviewerName) 
    {
        this.lowRecordInterviewerName = lowRecordInterviewerName;
    }

    public String getLowRecordInterviewerName() 
    {
        return lowRecordInterviewerName;
    }
    public void setLowRecordIntervieweeName(String lowRecordIntervieweeName) 
    {
        this.lowRecordIntervieweeName = lowRecordIntervieweeName;
    }

    public String getLowRecordIntervieweeName() 
    {
        return lowRecordIntervieweeName;
    }
    public void setLowRecordIntervieweeId(String lowRecordIntervieweeId) 
    {
        this.lowRecordIntervieweeId = lowRecordIntervieweeId;
    }

    public String getLowRecordIntervieweeId() 
    {
        return lowRecordIntervieweeId;
    }
    public void setLowRecordDate(Date lowRecordDate) 
    {
        this.lowRecordDate = lowRecordDate;
    }

    public Date getLowRecordDate() 
    {
        return lowRecordDate;
    }
    public void setLowRecordStartTime(String lowRecordStartTime) 
    {
        this.lowRecordStartTime = lowRecordStartTime;
    }

    public String getLowRecordStartTime() 
    {
        return lowRecordStartTime;
    }
    public void setLowRecordEndTime(String lowRecordEndTime) 
    {
        this.lowRecordEndTime = lowRecordEndTime;
    }

    public String getLowRecordEndTime() 
    {
        return lowRecordEndTime;
    }
    public void setLowRecordContent(String lowRecordContent) 
    {
        this.lowRecordContent = lowRecordContent;
    }

    public String getLowRecordContent() 
    {
        return lowRecordContent;
    }
    public void setLowRecordNoteTaker(String lowRecordNoteTaker) 
    {
        this.lowRecordNoteTaker = lowRecordNoteTaker;
    }

    public String getLowRecordNoteTaker() 
    {
        return lowRecordNoteTaker;
    }
    public void setLowRecordTimes(Long lowRecordTimes) 
    {
        this.lowRecordTimes = lowRecordTimes;
    }

    public Long getLowRecordTimes() 
    {
        return lowRecordTimes;
    }
    public void setRecordStatus(String recordStatus) 
    {
        this.recordStatus = recordStatus;
    }

    public String getRecordStatus() 
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
    public void setUuid(Long uuid) 
    {
        this.uuid = uuid;
    }

    public Long getUuid() 
    {
        return uuid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("billNum", getBillNum())
            .append("lowRecordNum", getLowRecordNum())
            .append("lowRecordType", getLowRecordType())
            .append("lowRecordTemplate", getLowRecordTemplate())
            .append("lowRecordCaseAddress", getLowRecordCaseAddress())
            .append("lowRecordInterviewerName", getLowRecordInterviewerName())
            .append("lowRecordIntervieweeName", getLowRecordIntervieweeName())
            .append("lowRecordIntervieweeId", getLowRecordIntervieweeId())
            .append("lowRecordDate", getLowRecordDate())
            .append("lowRecordStartTime", getLowRecordStartTime())
            .append("lowRecordEndTime", getLowRecordEndTime())
            .append("lowRecordContent", getLowRecordContent())
            .append("lowRecordNoteTaker", getLowRecordNoteTaker())
            .append("lowRecordTimes", getLowRecordTimes())
            .append("recordStatus", getRecordStatus())
            .append("createDatetime", getCreateDatetime())
            .append("createBy", getCreateBy())
            .append("updateDatetime", getUpdateDatetime())
            .append("updateBy", getUpdateBy())
            .append("uuid", getUuid())
            .toString();
    }
}
