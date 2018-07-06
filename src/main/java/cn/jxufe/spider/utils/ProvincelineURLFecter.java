package cn.jxufe.spider.utils;

import cn.jxufe.spider.parse.CollegelineParse;
import cn.jxufe.spider.parse.ProvincelineParse;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.zip.GZIPInputStream;

public class ProvincelineURLFecter {

    public static List<Map> URLParser(String str) {
        //用来接收解析的数据
        List<Map> list = new ArrayList<>();
        //如果状态响应码为200，则获取html实体内容或者json文件
        try{
            URL url = new URL(str);
            HttpURLConnection connection = (HttpURLConnection)url.openConnection();
            if(connection.getResponseCode() == 200){
                InputStream inputStream = connection.getInputStream();
                Scanner scanner = null;
                try{
                    GZIPInputStream in = new GZIPInputStream(inputStream);
                    scanner = new Scanner(in, "gb2312");
                }catch (Exception ex) {
                    scanner = new Scanner(inputStream, "gb2312");
                }finally {
                    StringBuffer entity = new StringBuffer();
                    while (scanner.hasNextLine()){
                        entity.append(scanner.nextLine() + "\r\n");
                    }
                    scanner.close();
                    inputStream.close();
                    list = ProvincelineParse.getData(entity.toString());
                }

            }else{
                list = null;
            }
        }finally {
            return list;
        }
    }
}
