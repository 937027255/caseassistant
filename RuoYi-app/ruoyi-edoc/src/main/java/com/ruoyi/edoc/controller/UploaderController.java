package com.ruoyi.edoc.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.domain.BoostrapFileinputError;
import com.ruoyi.edoc.exception.DuplicateCaseException;
import com.ruoyi.edoc.exception.EmptyResultException;
import com.ruoyi.edoc.service.IAnalyzingService;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.edoc.service.ILawCaseInfoService;
import com.ruoyi.edoc.service.ILowRecordInfoService;
import org.apache.commons.io.IOUtils;
import org.apache.http.NoHttpResponseException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 案件上传Controller
 *
 * @author BillXuce
 * @date 2020-09-04
 */
@Controller
@RequestMapping("/edoc/upload")
public class UploaderController extends BaseController
{
    private String prefix = "edoc/uploader";

    @Autowired
    private ILawCaseInfoService lawCaseInfoService;

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @Autowired
    private ILowRecordInfoService lowRecordInfoService;

    @Autowired
    private IAnalyzingService AnalyzingService;

    /**
     * 上传新案件页面
     */
    @RequiresPermissions("edoc:upload")
    @GetMapping()
    public String uploadPage()
    {
        return prefix + "/upload";
    }

    /**
     * 上传新案件请求
     */
    @RequiresPermissions("edoc:upload:request")
    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult uploader( @RequestParam("file") MultipartFile[] file) throws Exception {

        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");

        if (file != null && file.length > 0) {
            List<String> inputStrings = new ArrayList<String>();

            try {
                for (int i = 0; i < file.length; i++) {
                    if (!file[i].isEmpty()) {
                        //上传文件
                        InputStream inputStream = file[i].getInputStream();
                        inputStrings.add(IOUtils.toString(inputStream, "utf-8"));
                    }
                }
                //上传成功
                if (inputStrings != null && inputStrings.size() > 0 ) {
                    if(AnalyzingService.SubmitAnkaRequest(inputStrings, operName)) return success("上传成功！");
                    else {
                        String msg = "上传失败！数据写入失败！";
                        return new BoostrapFileinputError(msg);
                    }
                } else {
                    String msg = "上传失败！文件格式错误！";
                    return new BoostrapFileinputError(msg);
                }
            } catch (NoHttpResponseException e){
                String msg = "连接到分析服务失败，请联系管理员";
                return new BoostrapFileinputError(msg);
            } catch (DuplicateCaseException e) {
                String msg = e.getMessage() + "案件重复，请删除";
                return new BoostrapFileinputError(msg);
            } catch (EmptyResultException e){
                String msg = e.getMessage();
                return new BoostrapFileinputError(msg);
            } catch (Exception e) {
                e.printStackTrace();
                String msg = "未知错误，请联系管理员";
                return new BoostrapFileinputError(msg);
            }
        } else {
            String msg = "未检测到文件！";
            return new BoostrapFileinputError(msg);
        }
    }


}
