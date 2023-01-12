package com.ruoyi.edoc.domain;

import com.ruoyi.common.core.domain.AjaxResult;

public class BoostrapFileinputError extends AjaxResult {

    public BoostrapFileinputError(String error){
        super.put("error", error);
    }

}
