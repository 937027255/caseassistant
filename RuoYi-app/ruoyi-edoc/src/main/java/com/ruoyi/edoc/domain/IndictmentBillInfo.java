package com.ruoyi.edoc.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 起诉文书信息对象 indictment_bill_info
 * 
 * @author xuce
 * @date 2020-08-22
 */
public class IndictmentBillInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 案件编号 */
    @Excel(name = "案件编号")
    private String lowCaseNum;

    /** 文书编号 */
    @Excel(name = "文书编号")
    private String billNum;

    /** 原告 */
    @Excel(name = "原告")
    private String billPlaintiff;

    /** 被告 */
    @Excel(name = "被告")
    private String billDemandant;

    /** 第三人 */
    @Excel(name = "第三人")
    private String billThirdParty;

    /** 起诉人 */
    @Excel(name = "起诉人")
    private String billProsecutor;

    /** 诉讼请求 */
    @Excel(name = "诉讼请求")
    private String billClaim;

    /** 移送案由 */
    @Excel(name = "移送案由")
    private String billCrime;

    /** 事实与理由 */
    private String billFactAndReason;

    /** 记录状态 */
    private String recordStatus;

    /** 创建时间 */
    private Date createDatetime;

    /** 更新时间 */
    private Date updateDatetime;

    /** 嫌疑人身份证号 */
    @Excel(name = "嫌疑人身份证号")
    private String billPersonId;

    /** 强制执行时间 */
    @Excel(name = "强制执行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date billForceExecuteTime;

    /** 移送机关 */
    @Excel(name = "移送机关")
    private String billTransDepartment;

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
    public void setBillNum(String billNum) 
    {
        this.billNum = billNum;
    }

    public String getBillNum() 
    {
        return billNum;
    }
    public void setBillPlaintiff(String billPlaintiff) 
    {
        this.billPlaintiff = billPlaintiff;
    }

    public String getBillPlaintiff() 
    {
        return billPlaintiff;
    }
    public void setBillDemandant(String billDemandant) 
    {
        this.billDemandant = billDemandant;
    }

    public String getBillDemandant() 
    {
        return billDemandant;
    }
    public void setBillThirdParty(String billThirdParty) 
    {
        this.billThirdParty = billThirdParty;
    }

    public String getBillThirdParty() 
    {
        return billThirdParty;
    }
    public void setBillCrime(String billCrime)
    {
        this.billCrime = billCrime;
    }

    public String getBillCrime()
    {
        return billCrime;
    }
    public void setBillProsecutor(String billProsecutor) 
    {
        this.billProsecutor = billProsecutor;
    }

    public String getBillProsecutor() 
    {
        return billProsecutor;
    }
    public void setBillClaim(String billClaim) 
    {
        this.billClaim = billClaim;
    }

    public String getBillClaim() 
    {
        return billClaim;
    }
    public void setBillFactAndReason(String billFactAndReason) 
    {
        this.billFactAndReason = billFactAndReason;
    }

    public String getBillFactAndReason() 
    {
        return billFactAndReason;
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
    public void setBillPersonId(String billPersonId) 
    {
        this.billPersonId = billPersonId;
    }

    public String getBillPersonId() 
    {
        return billPersonId;
    }
    public void setBillForceExecuteTime(Date billForceExecuteTime) 
    {
        this.billForceExecuteTime = billForceExecuteTime;
    }

    public Date getBillForceExecuteTime() 
    {
        return billForceExecuteTime;
    }
    public void setBillTransDepartment(String billTransDepartment) 
    {
        this.billTransDepartment = billTransDepartment;
    }

    public String getBillTransDepartment() 
    {
        return billTransDepartment;
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
            .append("billNum", getBillNum())
            .append("billPlaintiff", getBillPlaintiff())
            .append("billDemandant", getBillDemandant())
            .append("billThirdParty", getBillThirdParty())
            .append("billProsecutor", getBillProsecutor())
            .append("billClaim", getBillClaim())
            .append("billFactAndReason", getBillFactAndReason())
            .append("recordStatus", getRecordStatus())
            .append("createDatetime", getCreateDatetime())
            .append("createBy", getCreateBy())
            .append("updateDatetime", getUpdateDatetime())
            .append("updateBy", getUpdateBy())
            .append("billPersonId", getBillPersonId())
            .append("billForceExecuteTime", getBillForceExecuteTime())
            .append("billTransDepartment", getBillTransDepartment())
            .append("uuid", getUuid())
            .append("responseBy", getResponseBy())
            .toString();
    }
}
