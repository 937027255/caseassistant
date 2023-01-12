package com.ruoyi.edoc.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/edoc/ReturnJsonInfo")
public class ReturnJsonInfoController extends BaseController
{
    private String prefix = "edoc/ReturnJsonInfo";

    @Autowired
    private IReturnJsonInfoService returnJsonInfoService;

    @RequiresPermissions("edoc:ReturnJsonInfo:view")
    @GetMapping()
    public String ReturnJsonInfo()
    {
        return prefix + "/ReturnJsonInfo";
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
}
