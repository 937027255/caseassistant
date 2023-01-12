package com.ruoyi.edoc.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.json.JSONObject.JSONArray;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.service.IExportWordService;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.edoc.service.ILawCaseInfoService;
import com.ruoyi.system.domain.SysRole;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 起诉文书信息Controller
 * 
 * @author xuce
 * @date 2020-08-22
 */
@Controller
@RequestMapping("/edoc/indictmentinfo")
public class IndictmentBillInfoController extends BaseController
{
    private String prefix = "edoc/indictmentinfo";

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @Autowired
    private ILawCaseInfoService lawCaseInfoService;

    @Autowired
    private IExportWordService exportWordService;

    private List<IndictmentBillInfo> selectIndictmentinfoByRole(IndictmentBillInfo indictmentBillInfo){
        ArrayList<SysRole> roles = (ArrayList<SysRole>) PermissionUtils.getPrincipalProperty("roles");
        ArrayList<Long> roleIdList = new ArrayList<>();
        for (SysRole x: roles) roleIdList.add(x.getRoleId());
        List<IndictmentBillInfo> list = new ArrayList<>();
        if(roleIdList.contains(Long.valueOf(1)) || roleIdList.contains(Long.valueOf(2))){
            list = indictmentBillInfoService.selectIndictmentBillInfoList(indictmentBillInfo);
        }else{
            String userId = ((Long)PermissionUtils.getPrincipalProperty("userId")).toString();
            indictmentBillInfo.setResponseBy(userId);
            list = indictmentBillInfoService.selectIndictmentBillInfoListByResponseBy(indictmentBillInfo);
        }
        return list;
    }

    @RequiresPermissions("edoc:indictmentinfo:view")
    @GetMapping()
    public String indictmentinfo()
    {
        return prefix + "/indictmentinfo";
    }

    /**
     * 查询起诉文书信息列表
     */
    @RequiresPermissions("edoc:indictmentinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(IndictmentBillInfo indictmentBillInfo)
    {
        startPage();
        List<IndictmentBillInfo> list = selectIndictmentinfoByRole(indictmentBillInfo);
        return getDataTable(list);
    }

    /**
     * 下拉框显示案件信息
     */
    @RequestMapping(value = "getData")
    @GetMapping("/getData")
    @ResponseBody
    public JSONArray getBillNumSelectList(IndictmentBillInfo indictmentBillInfo) {
        List<IndictmentBillInfo> indictmentBillInfoList = selectIndictmentinfoByRole(indictmentBillInfo);
        JSONArray jsonArray = new JSONArray();
        for (IndictmentBillInfo x: indictmentBillInfoList){
            if(x.getRecordStatus().equals("1")) jsonArray.add(x.getBillNum());
        }
        return jsonArray;
    }

    /**
     * 导出起诉文书信息列表
     */
    @Log(title = "起诉文书信息", businessType = BusinessType.EXPORT)
    @ResponseBody
    public AjaxResult exportExcel(IndictmentBillInfo indictmentBillInfo)
    {
        List<IndictmentBillInfo> list = indictmentBillInfoService.selectIndictmentBillInfoList(indictmentBillInfo);
        ExcelUtil<IndictmentBillInfo> util = new ExcelUtil<IndictmentBillInfo>(IndictmentBillInfo.class);
        return util.exportExcel(list, "indictmentinfo");
    }

    /**
     * 导出审查报告
     */
    @RequiresPermissions("edoc:indictmentinfo:export")
    @Log(title = "起诉文书信息", businessType = BusinessType.EXPORT)
    @PostMapping("/exportWord")
    @ResponseBody
    public AjaxResult export(String ids) {
        String operName = (String) PermissionUtils.getPrincipalProperty("userName");
        List<String> list = Arrays.asList(ids.split(","));
        try{
            String zipFileName = exportWordService.exportWord(list, operName);
            return success(zipFileName);
        } catch (Exception e){
            return error();
        }
    }

    /**
     * 新增起诉文书信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存起诉文书信息
     */
    @RequiresPermissions("edoc:indictmentinfo:add")
    @Log(title = "起诉文书信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(IndictmentBillInfo indictmentBillInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(indictmentBillInfoService.insertIndictmentBillInfo(indictmentBillInfo, operName));
    }

    /**
     * 修改起诉文书信息
     */
    @GetMapping("/edit/{billNum}")
    public String edit(@PathVariable("billNum") Long billUid, ModelMap mmap)
    {
        IndictmentBillInfo indictmentBillInfo = indictmentBillInfoService.selectIndictmentBillInfoById(billUid);
        mmap.put("indictmentBillInfo", indictmentBillInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存起诉文书信息
     */
    @RequiresPermissions("edoc:indictmentinfo:edit")
    @Log(title = "起诉文书信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(IndictmentBillInfo indictmentBillInfo)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
        return toAjax(indictmentBillInfoService.updateIndictmentBillInfo(indictmentBillInfo, operName));
    }

    /**
     * 删除起诉文书信息
     */
    @RequiresPermissions("edoc:indictmentinfo:remove")
    @Log(title = "起诉文书信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] idsList = ids.split(",");
        int result = 1;
        for(String id: idsList){
            String lowCaseNum =  indictmentBillInfoService.selectIndictmentBillInfoById(Long.parseLong(id)).getLowCaseNum();
            result *= lawCaseInfoService.deleteLawCaseInfoById(lowCaseNum);
        }
        return toAjax(result);
    }

    /**
     * 查询文书编号
     */
    @RequiresPermissions("edoc:indictmentinfo:query")
    @GetMapping(value = "/query/{billUid}")
    @ResponseBody
    public String selectCommentText(@PathVariable("billUid") Long billUid) {
        IndictmentBillInfo indictmentBillInfo = indictmentBillInfoService.selectIndictmentBillInfoById(billUid);
        return indictmentBillInfo.getBillNum();

    }
}
