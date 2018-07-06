package cn.jxufe.spider.parse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CeEinfoProvinceParse {
    public static List<Map<String, String>> getData(String html, int index) throws Exception{
        Document doc = Jsoup.parse(html);
        Elements ul = doc.select(".menu_dh").eq(index).select("li");
        List<Map<String, String>> list = new ArrayList<>();
        for(Element li : ul){
            if(!li.html().trim().equals("地区导航")){
                String link = li.select("a").attr("href");
                String province = li.select("a").attr("title");
                Map<String, String> map = new HashMap<>();
                map.put("province", province);
                map.put("link", link);
                list.add(map);
            }
        }
        return list;
    }
}
