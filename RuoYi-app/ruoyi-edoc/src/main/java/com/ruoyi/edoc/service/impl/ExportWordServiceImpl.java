package com.ruoyi.edoc.service.impl;

import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.edoc.domain.CommentInfo;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.domain.LowRecordInfo;
import com.ruoyi.edoc.service.ICommentInfoService;
import com.ruoyi.edoc.service.IExportWordService;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.edoc.service.ILowRecordInfoService;
import com.ruoyi.edoc.utils.word.WordMap;
import com.ruoyi.edoc.utils.word.WordOutput;
import com.ruoyi.edoc.utils.zipUtils.ZipUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.core.env.Environment;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ExportWordServiceImpl implements IExportWordService {

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @Autowired
    private ILowRecordInfoService lowRecordInfoService;

    @Autowired
    private ICommentInfoService commentInfoService;

    @Autowired
    private Environment env;

    private String prefixTemplateWord = "reportTemplate.docx";

    private String exportZipFileName = "exportZip.zip";

    private String prefixFilePath;

    private String prefixDownloadPath;

    private String prefixTemplatePath;

    @Autowired
    public void ExportWordServiceImpl(){
        prefixFilePath = env.getProperty("ruoyi.profile") + "/exportWord/";
        prefixDownloadPath = env.getProperty("ruoyi.profile") + "/download/";
        prefixTemplatePath = env.getProperty("edoc.templatePath");
        File downloadPath = new File(prefixDownloadPath);
        if (!downloadPath.exists()  && !downloadPath .isDirectory()) downloadPath.mkdir();
        File exportwordPath =new File(prefixFilePath);
        if (!exportwordPath.exists()  && !exportwordPath.isDirectory()) exportwordPath.mkdir();
    }

    /**
     * 查询起诉文书信息
     * @param ids 起诉文书信息ID列表
     * @param operName 操作人
     * @return 生成word压缩包的文件名
     */
    @Override
    public String exportWord(List<String> ids, String operName) throws Exception{

        List<File> resultFile = new ArrayList<>();
        List<String> wordFileNameList = new ArrayList<>();

        for (String billNum: ids){
            IndictmentBillInfo indictmentBillInfo =  indictmentBillInfoService.selectIndictmentBillInfoById(Long.valueOf(billNum));
            String uuid = indictmentBillInfo.getUuid().toString();
            List<LowRecordInfo> lowRecordInfoList = lowRecordInfoService.selectLowRecordInfoByBillNum(billNum);
            CommentInfo commentInfo = commentInfoService.selectCommentInfoByBillUuid(indictmentBillInfo.getUuid());
            Map<String, Object> wordMap = WordMap.setWordMap(indictmentBillInfo, lowRecordInfoList, commentInfo, operName);
            WordOutput wordOut = new WordOutput();
            String fileName = wordOut.createDocx(prefixTemplatePath,prefixTemplateWord, prefixFilePath, uuid , wordMap);
            wordFileNameList.add(prefixFilePath +fileName);
        }

        for (String x: wordFileNameList){
            resultFile.add(new File(x));
        }

        String zipFileName = UUID.randomUUID().toString() + "_" + exportZipFileName;
        File exportZipFile = new File(prefixDownloadPath + zipFileName);

        ZipUtil.toZip(resultFile, exportZipFile );

        for (String x: wordFileNameList){
            FileUtils.deleteFile(x);
        }

        return zipFileName;
    }
}
