package com.ruoyi.edoc.controller;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.ruoyi.common.json.JSONObject.JSONArray;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.system.domain.SysRole;
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
import com.ruoyi.edoc.domain.LowRecordInfo;
import com.ruoyi.edoc.service.ILowRecordInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 笔录信息Controller
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Controller
@RequestMapping("/edoc/lowrecordinfo")
public class LowRecordInfoController extends BaseController
{
    private String prefix = "edoc/lowrecordinfo";

    @Autowired
    private ILowRecordInfoService lowRecordInfoService;

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @RequiresPermissions("edoc:lowrecordinfo:view")
    @GetMapping()
    public String lowrecordinfo()
    {
        return prefix + "/lowrecordinfo";
    }

    @RequiresPermissions("edoc:lowrecordinfo:view")
    @GetMapping("/{uuid}")
    public String lowrecordinfoSearchByBillUuid(@PathVariable("uuid") Long uuid, ModelMap mmap)
    {
        mmap.put("billNum", indictmentBillInfoService.selectIndictmentBillInfoById(uuid).getBillNum());
        return prefix + "/lowrecordinfo";
    }

    /**
     * 查询笔录信息列表
     */
    @RequiresPermissions("edoc:lowrecordinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LowRecordInfo lowRecordInfo)
    {
        ArrayList<SysRole> roles = (ArrayList<SysRole>) PermissionUtils.getPrincipalProperty("roles");
        ArrayList<Long> roleIdList = new ArrayList<>();
        for (SysRole x: roles) roleIdList.add(x.getRoleId());
        List<LowRecordInfo> list = new ArrayList<>();
        if(roleIdList.contains(Long.valueOf(1)) || roleIdList.contains(Long.valueOf(2))){
            startPage();
            list = lowRecordInfoService.selectLowRecordInfoList(lowRecordInfo);
        }else{
            IndictmentBillInfo indictmentBillInfo = new IndictmentBillInfo();
            String userId = ((Long)PermissionUtils.getPrincipalProperty("userId")).toString();
            indictmentBillInfo.setResponseBy(userId);
            List<String> billNumList = indictmentBillInfoService.getAuthorizedBillNumByResponseBy(indictmentBillInfo);
            startPage();
            list = lowRecordInfoService.selectLowRecordInfoByBillNumList(billNumList);
        }
        return getDataTable(list);
    }

    /**
     * 下拉框显示案件信息
     */
    @RequestMapping(value = "getData")
    @GetMapping("/getData")
    @ResponseBody
    public JSONArray getBillNumSelectList(LowRecordInfo lowRecordInfo) {
        List<LowRecordInfo> lowRecordInfoList = lowRecordInfoService.selectLowRecordInfoList(lowRecordInfo);
        Set<String> billNumSet = new LinkedHashSet<>() ;
        JSONArray jsonArray = new JSONArray();
        for (LowRecordInfo x: lowRecordInfoList) billNumSet.add(x.getBillNum());
        for (String billNum: billNumSet) jsonArray.add(billNum);
        return jsonArray;
    }

    /**
     * 导出笔录信息列表
     */
    @RequiresPermissions("edoc:lowrecordinfo:export")
    @Log(title = "笔录信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LowRecordInfo lowRecordInfo)
    {
        List<LowRecordInfo> list = lowRecordInfoService.selectLowRecordInfoList(lowRecordInfo);
        ExcelUtil<LowRecordInfo> util = new ExcelUtil<LowRecordInfo>(LowRecordInfo.class);
        return util.exportExcel(list, "lowrecordinfo");
    }

    /**
     * 新增笔录信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存笔录信息
     */
    @RequiresPermissions("edoc:lowrecordinfo:add")
    @Log(title = "笔录信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LowRecordInfo lowRecordInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(lowRecordInfoService.insertLowRecordInfo(lowRecordInfo, operName));
    }

    /**
     * 修改笔录信息
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") Long uuid, ModelMap mmap)
    {
        LowRecordInfo lowRecordInfo = lowRecordInfoService.selectLowRecordInfoById(uuid);
        mmap.put("lowRecordInfo", lowRecordInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存笔录信息
     */
    @RequiresPermissions("edoc:lowrecordinfo:edit")
    @Log(title = "笔录信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LowRecordInfo lowRecordInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(lowRecordInfoService.updateLowRecordInfo(lowRecordInfo, operName));
    }

    /**
     * 删除笔录信息
     */
    @RequiresPermissions("edoc:lowrecordinfo:remove")
    @Log(title = "笔录信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(lowRecordInfoService.deleteLowRecordInfoByIds(ids));
    }
}
