package com.ruoyi.edoc.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.json.JSONObject.JSONArray;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.service.IExportWordService;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edoc.domain.IndictmentBillInfo;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 起诉文书信息Controller
 *
 * @author xuce
 * @date 2020-08-22
 */
@Controller
@RequestMapping("/edoc/appoint")
public class AppointController extends BaseController
{
    private String prefix = "edoc/appoint";

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;

    @Autowired
    private IExportWordService exportWordService;

    @Autowired
    private ISysUserService userService;

    @RequiresPermissions("edoc:appoint:view")
    @GetMapping()
    public String indictmentinfo()
    {
        return prefix + "/appoint";
    }

    /**
     * 查询起诉文书信息列表
     */
    @RequiresPermissions("edoc:appoint:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(IndictmentBillInfo indictmentBillInfo)
    {
        startPage();
        List<IndictmentBillInfo> list = indictmentBillInfoService.selectIndictmentBillInfoList(indictmentBillInfo);
        return getDataTable(list);
    }

    /**
     * 下拉框显示案件信息
     */
    @RequiresPermissions("edoc:appoint:list")
    @RequestMapping(value = "getData")
    @GetMapping("/getData")
    @ResponseBody
    public JSONArray getBillNumSelectList(IndictmentBillInfo indictmentBillInfo) {
        List<IndictmentBillInfo> indictmentBillInfoList = indictmentBillInfoService.selectIndictmentBillInfoList(indictmentBillInfo);
        JSONArray jsonArray = new JSONArray();
        for (IndictmentBillInfo x: indictmentBillInfoList){
            if(x.getRecordStatus().equals("1")) jsonArray.add(x.getBillNum());
        }
        return jsonArray;
    }


    /**
     * 修改指派信息页面
     */
    @RequiresPermissions("edoc:appoint:appint")
    @GetMapping("/edit/{billNum}")
    public String edit(@PathVariable("billNum") Long billUid, ModelMap mmap)
    {
        IndictmentBillInfo indictmentBillInfo = indictmentBillInfoService.selectIndictmentBillInfoById(billUid);
        String responseBy = indictmentBillInfo.getResponseBy();
        String[] responseByList = responseBy.replace(" ", "").split(",");
        SysUser userInstance = new SysUser();
        List<SysUser> allUser = userService.selectUserList(userInstance);
        if(responseByList.length != 0 && !responseByList[0].isEmpty()){
            List<SysUser> responseByUserList = new ArrayList<>();
            for (String x : responseByList) responseByUserList.add(userService.selectUserById(Long.parseLong(x)));
            for (SysUser user : allUser)
            {
                for (SysUser responseUser : responseByUserList)
                {
                    if (user.getUserId().longValue() == responseUser.getUserId().longValue())
                    {
                        user.setFlag(true);
                        break;
                    }
                }
            }
        }
        mmap.put("posts", allUser);
        return prefix + "/edit";
    }

    /**
     * 修改保存指派信息
     */
    @RequiresPermissions("edoc:appoint:appoint")
    @Log(title = "起诉文书信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody JSONObject jsonParam)
    {
        String operName = (String) PermissionUtils.getPrincipalProperty("userName");
        try{
            IndictmentBillInfo indictmentBillInfo = indictmentBillInfoService.selectIndictmentBillInfoById(Long.parseLong(jsonParam.getString("billUid")));
            String responseBy = "";
            if (jsonParam.get("responseBy") != null) {
                String _responseBy = jsonParam.get("responseBy").toString();
                responseBy = _responseBy.substring(1, _responseBy.length() - 1);
            }
            indictmentBillInfo.setResponseBy(responseBy);
            indictmentBillInfoService.updateIndictmentBillInfo(indictmentBillInfo, operName);
            return AjaxResult.success();
        }catch (Exception e){
            return AjaxResult.error();
        }
    }


}
