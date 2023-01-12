package com.ruoyi.edoc.utils.http;

import com.ruoyi.common.json.JSONObject;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * API调用HTTP处理方法
 *
 * @author BillXuce
 */
public class HTTPRequest {

    public static String SendRequest(String RequestAddress, JSONObject json) throws Exception {
        // 创建Httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();

        CloseableHttpResponse response = null;

        String resultString = "";

        // 创建Http Post请求
        HttpPost httpPost = new HttpPost(RequestAddress);
        // 创建请求内容
        StringEntity entity = new StringEntity(json.toString(), ContentType.APPLICATION_JSON);

        httpPost.setEntity(entity);
        // 执行http请求
        response = httpClient.execute(httpPost);

        resultString = EntityUtils.toString(response.getEntity(), "utf-8");


        return resultString;
    }


    public static String SendRequest(String RequestAddress, JSONObject.JSONArray json) throws Exception {
        // 创建Httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();

        CloseableHttpResponse response = null;

        String resultString = "";

        // 创建Http Post请求
        HttpPost httpPost = new HttpPost(RequestAddress);
        // 创建请求内容
        StringEntity entity = new StringEntity(json.toString(), ContentType.APPLICATION_JSON);

        httpPost.setEntity(entity);
        // 执行http请求
        response = httpClient.execute(httpPost);

        resultString = EntityUtils.toString(response.getEntity(), "utf-8");


        return resultString;
    }
}