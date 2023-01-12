package com.ruoyi.edoc.controller;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.service.IAnalyzingService;
import org.apache.http.NoHttpResponseException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edoc.domain.ReturnJsonInfo;
import com.ruoyi.edoc.service.IReturnJsonInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 分析结果Controller
 * 
 * @author xuce
 * @date 2020-08-25
 */
@Controller
@RequestMapping("/edoc/analyzing")
public class AnalyzingController extends BaseController
{
    private String prefix = "edoc/analyzing";

    @Autowired
    private IReturnJsonInfoService returnJsonInfoService;

    @Autowired
    private IAnalyzingService AnalyzingService;

    @RequiresPermissions("edoc:ReturnJsonInfo:view")
    @GetMapping("uid/{bill_uid}")
    public String ReturnJsonInfo(@PathVariable("bill_uid") Long uid, ModelMap mmap)
    {
        mmap.put("bill_uid", uid);
        return prefix + "/qisushuAnalyzing";
    }


    /**
     * 获取分析结果
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:list")
    @GetMapping("api/{bill_uid}")
    @ResponseBody
    public JSONObject GetJsonResult(@PathVariable("bill_uid") Long uid)
    {
        ReturnJsonInfo json_result = returnJsonInfoService.selectReturnJsonInfoByBillUid(uid);
        JSONObject result = JSON.parseObject(json_result.getJson());
        return result;
    }

    /**
     * 查询分析结果列表
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ReturnJsonInfo returnJsonInfo)
    {
        startPage();
        List<ReturnJsonInfo> list = returnJsonInfoService.selectReturnJsonInfoList(returnJsonInfo);
        return getDataTable(list);
    }

    /**
     * 导出分析结果列表
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:export")
    @Log(title = "分析结果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ReturnJsonInfo returnJsonInfo)
    {
        List<ReturnJsonInfo> list = returnJsonInfoService.selectReturnJsonInfoList(returnJsonInfo);
        ExcelUtil<ReturnJsonInfo> util = new ExcelUtil<ReturnJsonInfo>(ReturnJsonInfo.class);
        return util.exportExcel(list, "ReturnJsonInfo");
    }

    /**
     * 新增分析结果
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 提交分析请求
     */
    @GetMapping("/analyzer/{bill_uid}")
    @ResponseBody
    public AjaxResult analyzer(@PathVariable("bill_uid") Long uid)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        try{
            AnalyzingService.SubmitAnalyzingRequest(uid, operName);
            return success("分析完成！");
        } catch(NoHttpResponseException e){
            return error("连接到分析服务失败，请联系管理员");
        } catch(Exception e){
            e.printStackTrace();
            return error("未知错误，请联系管理员");
        }
    }

    /**
     * 新增保存分析结果
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:add")
    @Log(title = "分析结果", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ReturnJsonInfo returnJsonInfo)
    {
        return toAjax(returnJsonInfoService.insertReturnJsonInfo(returnJsonInfo));
    }

    /**
     * 修改分析结果
     */
    @GetMapping("/edit/{jsonUid}")
    public String edit(@PathVariable("jsonUid") Long jsonUid, ModelMap mmap)
    {
        ReturnJsonInfo returnJsonInfo = returnJsonInfoService.selectReturnJsonInfoById(jsonUid);
        mmap.put("returnJsonInfo", returnJsonInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存分析结果
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:edit")
    @Log(title = "分析结果", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ReturnJsonInfo returnJsonInfo)
    {
        return toAjax(returnJsonInfoService.updateReturnJsonInfo(returnJsonInfo));
    }

    /**
     * 删除分析结果
     */
    @RequiresPermissions("edoc:ReturnJsonInfo:remove")
    @Log(title = "分析结果", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(returnJsonInfoService.deleteReturnJsonInfoByIds(ids));
    }

    @RequiresPermissions("edoc:ReturnJsonInfo:edit")
    @Log(title = "修改信任状态", businessType = BusinessType.UPDATE)
    @PostMapping("/updateBelieve")
    @ResponseBody
    public AjaxResult believeSave(@RequestBody(required = true) Map<String, Object> map)
    {
        Long billUid = Long.valueOf( map.get("billUid").toString());
        ReturnJsonInfo returnJsonInfo = returnJsonInfoService.selectReturnJsonInfoByBillUid(billUid);
        JSONObject returnJsonInfoJsonObject = JSONObject.parseObject(returnJsonInfo.getJson());
        JSONArray believeJsonArray =  JSONObject.parseArray(map.get("believe").toString());
        returnJsonInfoJsonObject.put("believe", believeJsonArray);
        String modifiedBelieveResult = JSONObject.toJSONString(returnJsonInfoJsonObject);
        returnJsonInfo.setJson(modifiedBelieveResult);
        return toAjax(returnJsonInfoService.updateReturnJsonInfo(returnJsonInfo));
    }

}
