package com.ruoyi.edoc.utils.word;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.edoc.domain.CommentInfo;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.domain.LowRecordInfo;

import java.util.*;


public class WordMap {

    private static String getProcuratorateName(IndictmentBillInfo indictmentBillInfo){
        return indictmentBillInfo.getBillProsecutor();
    }

    private static String getTransDepartment(IndictmentBillInfo indictmentBillInfo){
        return indictmentBillInfo.getBillTransDepartment();
    }

    private static String getCriminal(IndictmentBillInfo indictmentBillInfo){
        return indictmentBillInfo.getBillCrime();
    }

    private static String getSuspectName(IndictmentBillInfo indictmentBillInfo){
        return indictmentBillInfo.getBillDemandant();
    }

    private static String getSuspectInfo(IndictmentBillInfo indictmentBillInfo){
        String indictmentText = indictmentBillInfo.getBillFactAndReason();
        List<String> indictmentTextPara = Arrays.asList(indictmentText.split("\n")) ;
        String suspectInfo = "";
        for (String para: indictmentTextPara){
            if (para.startsWith("犯罪嫌疑人") || para.startsWith("违法犯罪经历")) suspectInfo += para;
        }
        return suspectInfo;
    }

    private static String getCrimeProcess(IndictmentBillInfo indictmentBillInfo){
        String indictmentText = indictmentBillInfo.getBillFactAndReason();
        List<String> indictmentTextPara = Arrays.asList(indictmentText.split("\n")) ;
        String crimeProcess = "";
        int infFlag = 0;
        for( String para: indictmentTextPara){
            if(para.matches("(?:调查查明|侦查[查査]明|依法查明|依法侦查证实|查明.*犯罪事实)")) crimeProcess += para;
        }
        return "";
    }

    private static String getProcesserAdvice(CommentInfo commentInfo){
        if( commentInfo == null) return "";
        return commentInfo.getCommentText();
    }

    private static String getCurrentDate(){
        String getDateString = DateUtils.getDate();
        String destDateString = getDateString.substring(0, 4) + "年" + getDateString.substring(5, 7) + "月" + getDateString.substring(8, 10) + "日";
        return destDateString;
    }



    public static Map<String, Object> setWordMap(IndictmentBillInfo indictmentBillInfo, List<LowRecordInfo> lowRecordInfoList, CommentInfo commentInfo, String operName){

        Map<String, Object> wordMap = new HashMap<String, Object>() ;
        wordMap.put("检察院名称", getProcuratorateName(indictmentBillInfo));
        wordMap.put("收案时间", "");
        wordMap.put("侦察机关", getTransDepartment(indictmentBillInfo));
        wordMap.put("移送单位", getTransDepartment(indictmentBillInfo));
        wordMap.put("移送案由", getCriminal(indictmentBillInfo));
        wordMap.put("犯罪嫌疑人", getSuspectName(indictmentBillInfo));
        wordMap.put("侦查机关承办人", "");
        wordMap.put("承办人", operName);
        wordMap.put("承办人意见", "");
        wordMap.put("犯罪嫌疑人基本情况", getSuspectInfo(indictmentBillInfo));
        wordMap.put("被害人基本情况", "");
        wordMap.put("发破案经过", "");
        wordMap.put("侦查机关部门认定的犯罪事实与意见", "");
        wordMap.put("相关当事人诉讼参与人的意见", "");
        wordMap.put("物证", "");
        wordMap.put("书证", "");
        wordMap.put("被害人陈述", "");
        wordMap.put("犯罪嫌疑人的供述与辩解", "");
        wordMap.put("鉴定意见", "");
        wordMap.put("勘验检查辨认笔录", "");
        wordMap.put("经审查认定的事实", "");
        wordMap.put("需要说明的问题", "");
        wordMap.put("承办人意见", getProcesserAdvice(commentInfo));
        wordMap.put("生成时间", getCurrentDate());

        return wordMap;
    }
}
