package com.ruoyi.edoc.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 分析结果对象 return_json_info
 * 
 * @author xuce
 * @date 2020-08-25
 */
public class ReturnJsonInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** json_uid */
    private Long jsonUid;

    /** 文书编号 */
    private String billNum;

    /** 返回的json */
    private String json;

    /** 对应文书uid */
    private Long billUid;

    /** 创建时间 */
    private Date createDatetime;

    /** 更新时间 */
    private Date updateDatetime;

    public void setJsonUid(Long jsonUid) 
    {
        this.jsonUid = jsonUid;
    }

    public Long getJsonUid() 
    {
        return jsonUid;
    }
    public void setBillNum(String billNum) 
    {
        this.billNum = billNum;
    }

    public String getBillNum() 
    {
        return billNum;
    }
    public void setJson(String json) 
    {
        this.json = json;
    }

    public String getJson() 
    {
        return json;
    }
    public void setBillUid(Long billUid) 
    {
        this.billUid = billUid;
    }

    public Long getBillUid() 
    {
        return billUid;
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
            .append("jsonUid", getJsonUid())
            .append("billNum", getBillNum())
            .append("json", getJson())
            .append("billUid", getBillUid())
            .append("createDatetime", getCreateDatetime())
            .append("createBy", getCreateBy())
            .append("updateDatetime", getUpdateDatetime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
