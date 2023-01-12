package com.ruoyi.edoc.service.impl;


import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.domain.LawCaseInfo;
import com.ruoyi.edoc.domain.LowRecordInfo;
import com.ruoyi.edoc.domain.ReturnJsonInfo;
import com.ruoyi.edoc.exception.DuplicateCaseException;
import com.ruoyi.edoc.exception.EmptyResultException;
import com.ruoyi.edoc.service.*;
import com.ruoyi.edoc.utils.http.HTTPRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 调用分析APIService业务层处理
 *
 * @author BillXuce
 * @date 2020-09-02
 */
@Service
public class AnalyzingServiceImpl implements IAnalyzingService { // TODO: 各种异常的提示与处理

    @Autowired
    private ILawCaseInfoService lawCaseInfoService;

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @Autowired
    private ILowRecordInfoService lowRecordInfoService;

    @Autowired
    private IReturnJsonInfoService returnJsonInfoService;

    @Autowired
    private Environment env;

    /**
     * 创建分析请求JSONObject
     *
     * @param BillUid 起诉文书信息ID
     * @return 发送给分析请求的JSONObject
     */
    private JSONObject MakeAnalyerJsonRequest(Long BillUid) {
        IndictmentBillInfo QisuInfo = indictmentBillInfoService.selectIndictmentBillInfoById(BillUid);
        String bill_num = QisuInfo.getBillNum();
        String qisu = QisuInfo.getBillFactAndReason();
        List<LowRecordInfo> lowRecordInfoList = lowRecordInfoService.selectLowRecordInfoByBillNum(bill_num);
        List<String> bilus = new ArrayList<String>();
        for (LowRecordInfo x : lowRecordInfoList) {
            bilus.add(x.getLowRecordContent());
        }
        JSONObject PostRequest = new JSONObject();
        PostRequest.put("case_id", bill_num);
        PostRequest.put("qisu", qisu);
        PostRequest.put("bilus", bilus);

        return PostRequest;
    }

    /**
     * 创建案卡自动填充请求JSONObject
     *
     * @param AnkaStrings 起诉文书信息ID
     * @return 发送给案卡自动填充请求的JSONObject
     */
    private JSONObject.JSONArray MakeAnkaJsonRequest(List<String> AnkaStrings){

        JSONObject.JSONArray PostRequest = new JSONObject.JSONArray();
        for (String x: AnkaStrings){
            PostRequest.add(x);
        }

        return PostRequest;
    }

    private String FillInCheck(String fillIn){ return fillIn.isEmpty() ? "未知" : fillIn; }

    private Date getBiluDate(String biluDateString){
        if(biluDateString == null) return DateUtils.getNowDate();
        String[] dateStartAndEnd = biluDateString.split(",");
        Date biluDate = DateUtils.parseDate(dateStartAndEnd[0].substring(0, 10));
        return biluDate;
    }

    /**
     * 分析请求后更新数据库
     *
     * @param BillUid 起诉文书信息ID
     * @param json 请求返回结果
     * @param operName 操作人
     * @return 起诉文书信息
     */
    private boolean UpdateNewAnalyzingResult(Long BillUid, String json, String operName)  {
        String billNum = indictmentBillInfoService.selectIndictmentBillInfoById(BillUid).getBillNum();

        ReturnJsonInfo returnJsonInfo = returnJsonInfoService.selectReturnJsonInfoByBillUid(BillUid);
        if(!(returnJsonInfo instanceof ReturnJsonInfo)){
            returnJsonInfo = new ReturnJsonInfo();
            returnJsonInfo.setBillNum(billNum);
            returnJsonInfo.setBillUid(BillUid);
            returnJsonInfo.setJson(json);
            returnJsonInfo.setCreateDatetime(DateUtils.getNowDate());
            returnJsonInfo.setUpdateDatetime(DateUtils.getNowDate());
            returnJsonInfo.setCreateBy(operName);
            returnJsonInfo.setUpdateBy(operName);
            returnJsonInfoService.insertReturnJsonInfo(returnJsonInfo);
        }else{
            returnJsonInfo.setJson(json);
            returnJsonInfo.setUpdateDatetime(DateUtils.getNowDate());
            returnJsonInfo.setUpdateBy(operName);
            returnJsonInfoService.updateReturnJsonInfo(returnJsonInfo);
        }

        return true;
    }

    /**
     * 分析请求后更新数据库
     *
     * @param jsonObject 分析结果起诉文书部分
     * @param operName 操作人
     * @return LawCaseInfoUuid
     */
    private Long InsertLawCaseInfo(com.alibaba.fastjson.JSONObject jsonObject, String operName){

        LawCaseInfo lawCaseInfo = new LawCaseInfo();
        lawCaseInfo.setLowCaseNum(jsonObject.getString("文书编号"));
        lawCaseInfo.setLowCaseReason(FillInCheck(jsonObject.getString("案由")));
        lawCaseInfo.setLowCaseParty(FillInCheck(jsonObject.getString("姓名")));
        lawCaseInfo.setLowCaseContent("未知");
        lawCaseInfo.setLowCaseCourt("未知");
        lawCaseInfo.setLowCaseDecisionTime(DateUtils.getNowDate());
        lawCaseInfo.setLowCaseName(FillInCheck(jsonObject.getString("案件名称")));
        lawCaseInfo.setRecordStatus("1");
        lawCaseInfoService.insertLawCaseInfo(lawCaseInfo, operName);
        LawCaseInfo _lawCaseInfo = lawCaseInfoService.selectLawCaseInfoById(jsonObject.getString("文书编号"));
        Long uuid = _lawCaseInfo.getUuid();

        return uuid;
    }

    /**
     * 分析请求后更新数据库
     *
     * @param jsonObject 分析结果起诉文书部分
     * @param operName 操作人
     * @return IndictmentInfoUuid
     */
    private Long InsertIndictmentBillInfo(com.alibaba.fastjson.JSONObject jsonObject, String operName){

        IndictmentBillInfo indictmentBillInfo = new IndictmentBillInfo();
        indictmentBillInfo.setLowCaseNum(jsonObject.getString("文书编号"));
        indictmentBillInfo.setBillNum(jsonObject.getString("文书编号"));
        indictmentBillInfo.setBillPlaintiff(FillInCheck(jsonObject.getString("检察院名称")));
        indictmentBillInfo.setBillDemandant(FillInCheck(jsonObject.getString("姓名")));
        indictmentBillInfo.setBillProsecutor(FillInCheck(jsonObject.getString("检察院名称")));
        indictmentBillInfo.setBillClaim(FillInCheck(jsonObject.getString("案件名称")));
        indictmentBillInfo.setBillFactAndReason(jsonObject.getString("内容"));
        indictmentBillInfo.setBillTransDepartment(FillInCheck(jsonObject.getString("公安局名称")));
        indictmentBillInfo.setBillForceExecuteTime(DateUtils.getNowDate());
        indictmentBillInfo.setBillPersonId(FillInCheck(jsonObject.getString("身份证号")));
        indictmentBillInfo.setBillCrime(FillInCheck(jsonObject.getString("案由")));
        indictmentBillInfo.setRecordStatus("1");
        indictmentBillInfo.setResponseBy("");
        indictmentBillInfoService.insertIndictmentBillInfo(indictmentBillInfo, operName);
        IndictmentBillInfo _indictmentBillInfo = indictmentBillInfoService.selectIndictmentBillInfoByBillNum(jsonObject.getString("文书编号"));
        Long uuid = _indictmentBillInfo.getUuid();

        return uuid;
    }

    /**
     * 分析请求后更新数据库
     *
     * @param indictmentUuid 第n个笔录
     * @param jsonObject 分析结果笔录部分
     * @param operName 操作人
     * @return LawCaseInfoUuid
     */
    private int InsertLowRecordInfo(Long indictmentUuid, com.alibaba.fastjson.JSONObject jsonObject, String operName, String Num){

        String billNum = indictmentBillInfoService.selectIndictmentBillInfoById(indictmentUuid).getBillNum();
        LowRecordInfo lowRecordInfo = new LowRecordInfo();
        lowRecordInfo.setLowRecordNum(billNum + Num);
        lowRecordInfo.setBillNum(billNum);
        lowRecordInfo.setLowRecordCaseAddress("未知");
        lowRecordInfo.setLowRecordInterviewerName(FillInCheck(jsonObject.getString("询问人")));
        lowRecordInfo.setLowRecordIntervieweeName(FillInCheck(jsonObject.getString("被询问人")));
        lowRecordInfo.setLowRecordIntervieweeId("未知");
        lowRecordInfo.setLowRecordDate(getBiluDate(jsonObject.getString("日期")));
        lowRecordInfo.setLowRecordContent(jsonObject.getString("内容"));
        lowRecordInfo.setLowRecordNoteTaker(FillInCheck(jsonObject.getString("记录人")));
        lowRecordInfo.setRecordStatus("1");

        return lowRecordInfoService.insertLowRecordInfo(lowRecordInfo, operName);
    }

    /**
     * 根据案卡结果更新数据库
     *
     * @param ResultJson 案卡分析结果
     * @param operName 操作人
     * @return boolean
     */
    private boolean InsertNewCase(com.alibaba.fastjson.JSONObject ResultJson, String operName){

        int result = 1;
        try{
            Long caseUuid = InsertLawCaseInfo(ResultJson.getJSONArray("qisu").getJSONObject(0), operName);
        } catch (DuplicateKeyException e){
            throw new DuplicateCaseException(ResultJson.getJSONArray("qisu").getJSONObject(0).getString("文书编号"));
        }
        Long indictmentUuid = InsertIndictmentBillInfo(ResultJson.getJSONArray("qisu").getJSONObject(0), operName);
        JSONArray bilus = ResultJson.getJSONArray("bilu");
        for (int i = 0; i < bilus.size(); i++){
            result *= InsertLowRecordInfo(indictmentUuid, bilus.getJSONObject(i), operName, String.valueOf(i));
        }
        return result > 0;
    }

    /**
     * 提交卷宗分析请求
     *
     * @param BillUid 起诉文书信息ID
     * @param operName 操作人
     * @return boolean
     */
    @Override
    public boolean SubmitAnalyzingRequest(Long BillUid, String operName) throws Exception {

        JSONObject AnalyzingRequestJson = MakeAnalyerJsonRequest(BillUid);
        String AnalyzingResponce = HTTPRequest.SendRequest(env.getProperty("edoc.analyzingApi"), AnalyzingRequestJson);
        boolean result = UpdateNewAnalyzingResult(BillUid, AnalyzingResponce, operName);

        return result;
    }

    /**
     * 提交案卡分析请求
     *
     * @param inputStrings 文本材料列表
     * @param operName 操作人
     * @return boolean
     */
    @Override
    public boolean SubmitAnkaRequest(List<String> inputStrings, String operName) throws Exception{

        JSONObject.JSONArray AnkaRequestJson = MakeAnkaJsonRequest(inputStrings);
        String AnkaResponce = HTTPRequest.SendRequest(env.getProperty("edoc.ankaApi"), AnkaRequestJson);
        com.alibaba.fastjson.JSONObject ResultJson = com.alibaba.fastjson.JSONObject.parseObject(AnkaResponce);

        if (ResultJson.getJSONObject("info").getString("msg").equals("error")){
            if (ResultJson.getJSONObject("info").getIntValue("value") == -1) throw (new EmptyResultException("分析结果为空，检查上传文件是否正确"));
            else if (ResultJson.getJSONObject("info").getIntValue("value") == 1) throw (new EmptyResultException("笔录为空，确认上传文件是否正确"));
            else if (ResultJson.getJSONObject("info").getIntValue("value") == 2) throw (new EmptyResultException("起诉意见书为空，确认上传文件是否正确"));
        }

        return InsertNewCase(ResultJson, operName);
    }
}
