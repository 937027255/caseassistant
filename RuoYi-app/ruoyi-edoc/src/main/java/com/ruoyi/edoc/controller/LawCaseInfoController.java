package com.ruoyi.edoc.controller;

import java.util.List;

import com.ruoyi.common.utils.security.PermissionUtils;
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
import com.ruoyi.edoc.domain.LawCaseInfo;
import com.ruoyi.edoc.service.ILawCaseInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 案件信息Controller
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Controller
@RequestMapping("/edoc/lawcaseinfo")
public class LawCaseInfoController extends BaseController
{
    private String prefix = "edoc/lawcaseinfo";

    @Autowired
    private ILawCaseInfoService lawCaseInfoService;

    @RequiresPermissions("edoc:lawcaseinfo:view")
    @GetMapping()
    public String lawcaseinfo()
    {
        return prefix + "/lawcaseinfo";
    }

    /**
     * 查询案件信息列表
     */
    @RequiresPermissions("edoc:lawcaseinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LawCaseInfo lawCaseInfo)
    {
        startPage();
        List<LawCaseInfo> list = lawCaseInfoService.selectLawCaseInfoList(lawCaseInfo);
        return getDataTable(list);
    }

    /**
     * 导出案件信息列表
     */
    @Log(title = "案件信息", businessType = BusinessType.EXPORT)
    @ResponseBody
    public AjaxResult export(LawCaseInfo lawCaseInfo)
    {
        List<LawCaseInfo> list = lawCaseInfoService.selectLawCaseInfoList(lawCaseInfo);
        ExcelUtil<LawCaseInfo> util = new ExcelUtil<LawCaseInfo>(LawCaseInfo.class);
        return util.exportExcel(list, "lawcaseinfo");
    }

    /**
     * 新增案件信息
     */
    @RequiresPermissions("edoc:lawcaseinfo:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存案件信息
     */
    @RequiresPermissions("edoc:lawcaseinfo:add")
    @Log(title = "案件信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LawCaseInfo lawCaseInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(lawCaseInfoService.insertLawCaseInfo(lawCaseInfo, operName));
    }

    /**
     * 修改案件信息
     */
    @GetMapping("/edit/{lowCaseNum}")
    public String edit(@PathVariable("lowCaseNum") String lowCaseNum, ModelMap mmap)
    {
        LawCaseInfo lawCaseInfo = lawCaseInfoService.selectLawCaseInfoById(lowCaseNum);
        mmap.put("lawCaseInfo", lawCaseInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存案件信息
     */
    @RequiresPermissions("edoc:lawcaseinfo:edit")
    @Log(title = "案件信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LawCaseInfo lawCaseInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(lawCaseInfoService.updateLawCaseInfo(lawCaseInfo, operName));
    }

    /**
     * 删除案件信息
     */
    @RequiresPermissions("edoc:lawcaseinfo:remove")
    @Log(title = "案件信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(lawCaseInfoService.deleteLawCaseInfoByIds(ids));
    }
}
