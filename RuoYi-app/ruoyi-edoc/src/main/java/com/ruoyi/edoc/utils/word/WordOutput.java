package com.ruoyi.edoc.utils.word;


import java.io.*;
import java.util.Enumeration;
import java.util.Map;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class WordOutput {

    // 创建配置实例
    private static Configuration configuration = new Configuration();


    public static String encodingFilename(String filename)
    {
        filename = UUID.randomUUID().toString() + "_" + filename + ".docx";
        return filename;
    }


    /**
     * @param templatePath docx模板文件所在的目录
     * @param templateWordFile docx模板名称，例如：teample.docx
     * @param filePath 文件生成的目标路径，例如：D:/
     * @param wordFileName 生成的文件名称
     * @param wordMap  word中需要展示的动态数据，用map集合来保存
     *
     * @return 生成word文档的文件名
     */
    @SuppressWarnings("resource")
    public String createDocx(String templatePath, String templateWordFile, String filePath, String wordFileName, Map wordMap) throws Exception {

        // ftl模板文件
        configuration.setDirectoryForTemplateLoading(new File(templatePath));

        String exportWordFile = encodingFilename(wordFileName);

        //获取 document.xml 输入流
        ByteArrayInputStream documentInput = this.getFreemarkerContentInputStream(wordMap, "document.xml");

        File docxFile = new File(templatePath + templateWordFile);
        if (!docxFile.exists()) {
            docxFile.createNewFile();
        }

        ZipFile zipFile = new ZipFile(docxFile);
        Enumeration<? extends ZipEntry> zipEntrys = zipFile.entries();
        ZipOutputStream zipout = new ZipOutputStream(new FileOutputStream(filePath + exportWordFile));

        //------------------覆盖文档------------------
        int len = -1;
        byte[] buffer = new byte[1024];
        while (zipEntrys.hasMoreElements()) {
            ZipEntry next = zipEntrys.nextElement();
            InputStream is = zipFile.getInputStream(next);
            if (next.toString().indexOf("media") < 0) {
                // 把输入流的文件传到输出流中 如果是word/document.xml由我们输入
                zipout.putNextEntry(new ZipEntry(next.getName()));
                if ("word/document.xml".equals(next.getName())) {
                    //写入填充数据后的主数据信息
                    this.writeOutputStream(documentInput, zipout, buffer, len);
                }  else {
                    while ((len = is.read(buffer)) != -1) {
                        zipout.write(buffer, 0, len);
                    }
                    is.close();
                }
            }
        }


        zipout.close();

        return exportWordFile;
    }

    public ByteArrayInputStream getFreemarkerContentInputStream(Object dataMap, String templateName) throws Exception {
        //获取模板
        Template template = configuration.getTemplate(templateName);
        StringWriter swriter = new StringWriter();
        //生成文件
        template.process(dataMap, swriter);
        ByteArrayInputStream in = new ByteArrayInputStream(swriter.toString().getBytes());
        return in;
    }

    private void writeOutputStream(ByteArrayInputStream input, ZipOutputStream zipout , byte[] buffer, int len) throws Exception {
        if (input != null) {
            while ((len = input.read(buffer)) != -1) {
                zipout.write(buffer, 0, len);
            }
            input.close();
        }
    }

}

