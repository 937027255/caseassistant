package com.ruoyi.edoc.controller;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.PermissionUtils;
import com.ruoyi.edoc.service.IIndictmentBillInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.mgt.DelegatingSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edoc.domain.CommentInfo;
import com.ruoyi.edoc.service.ICommentInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 批注Controller
 * 
 * @author xuce
 * @date 2020-09-09
 */
@Controller
@RequestMapping("/edoc/CommentInfo")
public class CommentInfoController extends BaseController
{
    private String prefix = "/edoc/CommentInfo";

    @Autowired
    private ICommentInfoService commentInfoService;

    @Autowired
    private IIndictmentBillInfoService indictmentBillInfoService;


    @RequiresPermissions("edoc:CommentInfo:view")
    @GetMapping()
    public String commentinfo()
    {
        return prefix + "/CommentInfo";
    }

    /**
     * 查询批注列表
     */
    @RequiresPermissions("edoc:CommentInfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CommentInfo commentInfo)
    {
        startPage();
        List<CommentInfo> list = commentInfoService.selectCommentInfoList(commentInfo);
        return getDataTable(list);
    }

    /**
     * 导出批注列表
     */
    @RequiresPermissions("edoc:CommentInfo:export")
    @Log(title = "批注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CommentInfo commentInfo)
    {
        List<CommentInfo> list = commentInfoService.selectCommentInfoList(commentInfo);
        ExcelUtil<CommentInfo> util = new ExcelUtil<CommentInfo>(CommentInfo.class);
        return util.exportExcel(list, "commentinfo");
    }

    /**
     * 新增批注
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存批注
     */
    @RequiresPermissions("edoc:CommentInfo:add")
    @Log(title = "批注", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CommentInfo commentInfo)
    {
        return toAjax(commentInfoService.insertCommentInfo(commentInfo));
    }

    /**
     * 修改批注
     */
    @GetMapping("/edit/{commentNum}")
    public String edit(@PathVariable("commentNum") Long commentNum, ModelMap mmap)
    {
        CommentInfo commentInfo = commentInfoService.selectCommentInfoById(commentNum);
        mmap.put("commentInfo", commentInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存批注
     */
    @RequiresPermissions("edoc:CommentInfo:edit")
    @Log(title = "批注", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CommentInfo commentInfo)
    {
        return toAjax(commentInfoService.updateCommentInfo(commentInfo));
    }

    /**
     * 删除批注
     */
    @RequiresPermissions("edoc:CommentInfo:remove")
    @Log(title = "批注", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(commentInfoService.deleteCommentInfoByIds(ids));
    }

    /**
     * 显示批注内容
     */
    @RequiresPermissions("edoc:CommentInfo:query")
    @GetMapping(value = "/query/{billUid}")
    @ResponseBody
    public String selectCommentText(@PathVariable("billUid") Long billUid) {
        try {
            CommentInfo commenttext = commentInfoService.selectCommentInfoByBillUuid(billUid);
            return commenttext.getCommentText();
        } catch (NullPointerException e){
            return "";
        }
    }

    /**
     * 修改或添加批注内容
     */
    @RequiresPermissions("edoc:CommentInfo:update")
    @PostMapping(value = "/update")
    @ResponseBody
    public AjaxResult editCommentText(@RequestBody(required = true) Map<String, Object> map) {
        Long billUid = Long.valueOf( map.get("billUid").toString());
        String commentText = map.get("comment").toString();
        try {
            String commentInfo =  commentInfoService.selectCommentInfoByBillUuid(billUid).getCommentText();
            String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
            return toAjax(commentInfoService.updateCommentInfoByBillUuid(billUid, commentText, operName));
        } catch (NullPointerException e){
            CommentInfo commentInfo = new CommentInfo();
            commentInfo.setBillNum(indictmentBillInfoService.selectIndictmentBillInfoById(billUid).getBillNum());
            commentInfo.setCommentText(commentText);
            commentInfo.setBillNumUuid(billUid);
            commentInfo.setRecordStatus(1);
            commentInfo.setUpdateDatetime(DateUtils.getNowDate());
            commentInfo.setUpdateBy((String) PermissionUtils.getPrincipalProperty("loginName"));
            commentInfo.setCreateDatetime(DateUtils.getNowDate());
            commentInfo.setCreateBy((String) PermissionUtils.getPrincipalProperty("loginName"));
            return toAjax(commentInfoService.insertCommentInfoByBillUuid(commentInfo));
        }
    }
}
