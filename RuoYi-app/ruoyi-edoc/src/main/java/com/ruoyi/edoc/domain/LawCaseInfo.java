package com.ruoyi.edoc.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 案件信息对象 law_case_info
 * 
 * @author xuce
 * @date 2020-08-22
 */
public class LawCaseInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 案件编号 */
    @Excel(name = "案件编号")
    private String lowCaseNum;

    /** 案件原由 */
    @Excel(name = "案件原由")
    private String lowCaseReason;

    /** 当事人 */
    @Excel(name = "当事人")
    private String lowCaseParty;

    /** 案例事实 */
    private String lowCaseContent;

    /** 审批法院 */
    @Excel(name = "审批法院")
    private String lowCaseCourt;

    /** 判决时间 */
    @Excel(name = "判决时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lowCaseDecisionTime;

    /** 执行法官编号 */
    private String lowCaseExecutiveJudge;

    /** 辩护律师编号 */
    private String lowCaseDefenceCounsel;

    /** 案件名称 */
    @Excel(name = "案件名称")
    private String lowCaseName;

    /** 记录状态 */
    private String recordStatus;

    /** 创建时间 */
    private Date createDatetime;

    /** 更新时间 */
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDatetime;

    /** uuid */
    private Long uuid;

    /** 承办人 */
    private String responseBy;

   public void setLowCaseNum(String lowCaseNum)
    {
        this.lowCaseNum = lowCaseNum;
    }

    public String getLowCaseNum() 
    {
        return lowCaseNum;
    }
    public void setLowCaseReason(String lowCaseReason) 
    {
        this.lowCaseReason = lowCaseReason;
    }

    public String getLowCaseReason() 
    {
        return lowCaseReason;
    }
    public void setLowCaseParty(String lowCaseParty) 
    {
        this.lowCaseParty = lowCaseParty;
    }

    public String getLowCaseParty() 
    {
        return lowCaseParty;
    }
    public void setLowCaseContent(String lowCaseContent) 
    {
        this.lowCaseContent = lowCaseContent;
    }

    public String getLowCaseContent() 
    {
        return lowCaseContent;
    }
    public void setLowCaseCourt(String lowCaseCourt) 
    {
        this.lowCaseCourt = lowCaseCourt;
    }

    public String getLowCaseCourt() 
    {
        return lowCaseCourt;
    }
    public void setLowCaseDecisionTime(Date lowCaseDecisionTime) 
    {
        this.lowCaseDecisionTime = lowCaseDecisionTime;
    }

    public Date getLowCaseDecisionTime() 
    {
        return lowCaseDecisionTime;
    }
    public void setLowCaseExecutiveJudge(String lowCaseExecutiveJudge) 
    {
        this.lowCaseExecutiveJudge = lowCaseExecutiveJudge;
    }

    public String getLowCaseExecutiveJudge() 
    {
        return lowCaseExecutiveJudge;
    }
    public void setLowCaseDefenceCounsel(String lowCaseDefenceCounsel) 
    {
        this.lowCaseDefenceCounsel = lowCaseDefenceCounsel;
    }

    public String getLowCaseDefenceCounsel() 
    {
        return lowCaseDefenceCounsel;
    }
    public void setLowCaseName(String lowCaseName) 
    {
        this.lowCaseName = lowCaseName;
    }

    public String getLowCaseName() 
    {
        return lowCaseName;
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

    public void setResponseBy(String responseBy){
       this.responseBy = responseBy;
    }

    public String getResponseBy(){
       return responseBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("lowCaseNum", getLowCaseNum())
            .append("lowCaseReason", getLowCaseReason())
            .append("lowCaseParty", getLowCaseParty())
            .append("lowCaseContent", getLowCaseContent())
            .append("lowCaseCourt", getLowCaseCourt())
            .append("lowCaseDecisionTime", getLowCaseDecisionTime())
            .append("lowCaseExecutiveJudge", getLowCaseExecutiveJudge())
            .append("lowCaseDefenceCounsel", getLowCaseDefenceCounsel())
            .append("lowCaseName", getLowCaseName())
            .append("recordStatus", getRecordStatus())
            .append("createDatetime", getCreateDatetime())
            .append("createBy", getCreateBy())
            .append("updateDatetime", getUpdateDatetime())
            .append("updateBy", getUpdateBy())
            .append("uuid", getUuid())
            .append("responseBy", getResponseBy())
            .toString();
    }
}
