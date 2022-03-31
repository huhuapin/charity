package com.charity.controller;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RequestMapping("upload")
@Controller
public class UploadController {

    @PostMapping("img")
    @ResponseBody
    public Map<String, Object> uploadImg(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //设置文件临时上传路径

        String savePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resource/uploads/");
        File file = new File(savePath);
        if (!file.exists()) {
            //文件夹不存在，新建文件夹
            file.mkdir();
        }

        //设置文件缓存的路径
        factory.setRepository(file);
        //创建ServletFileUpload对象
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        fileUpload.setHeaderEncoding("utf-8");

        try {

            //获取请求参数
            List<FileItem> fileItems = fileUpload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                String filename = fileItem.getName();
                //处理上传文件
                if (filename != null && !filename.equals("")) {
                    //文件不为空

                    //新建唯一名称
                    String filename1 = filename;
                    filename = UUID.randomUUID().toString() + "_" + filename;
                    File file1 = new File(savePath+filename);
                    file1.getParentFile().mkdirs();
                    file1.createNewFile();
                    //获取输入流
                    InputStream in = fileItem.getInputStream();
                    FileOutputStream out = new FileOutputStream(file1);
                    //设置缓冲大小 1024,一次读入1024个字节
                    byte[] buffer = new byte[1024];
                    int len;
                    //写入文件
                    while((len = in.read(buffer)) >0) {
                        out.write(buffer,0,len);
                    }
                    in.close();
                    out.close();
                    //删除临时文件
                    fileItem.delete();
                    //返回json  文件地址
                    Map<String,Object> map = new HashMap<>();
                    map.put("code","0");
                    map.put("status","OK");
                    map.put("message","上传成功");
                    Map<String,String> data = new HashMap<>();
                    data.put("src","/uploads/"+filename);
                    data.put("name",filename1);
                    map.put("data", data);
                    return map;
                }
            }
        } catch (FileUploadException | IOException e) {
            e.printStackTrace();
            Map<String,Object> map = new HashMap<>();
            map.put("code","-1");
            map.put("status","ERROR");
            map.put("message","上传失败");
            map.put("data", null);
            return map;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("code","-1");
        map.put("status","ERROR");
        map.put("message","上传失败");
        map.put("data", null);
        return map;
    }
}
