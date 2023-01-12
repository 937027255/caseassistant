package com.ruoyi.edoc.exception;

import org.springframework.dao.DuplicateKeyException;

public class DuplicateCaseException extends DuplicateKeyException {


    public DuplicateCaseException(String msg, Throwable cause){
        super(msg, cause);
    }

    public DuplicateCaseException(String msg){
        super(msg);
    }

}
