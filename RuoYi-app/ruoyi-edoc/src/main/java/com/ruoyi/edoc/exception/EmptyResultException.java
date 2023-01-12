package com.ruoyi.edoc.exception;

public class EmptyResultException extends Exception{

    public EmptyResultException(){
        super();
    }

    public EmptyResultException(String msg){
        super(msg);
    }

    public EmptyResultException(String msg, Throwable cause){
        super(msg, cause);
    }

}
