package cn.jxufe.spider.parse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollegemajorParse {
    public static List<Map> getData(String html) throws Exception {
        //获取的数据，存放在集合中
        List<Map> list = new ArrayList<>();
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        Elements elements = doc.select(".plan_con").select("dl");
        for(Element dl : elements){
            String clazz = dl.select("dt").html().trim();
            Elements span = dl.select("dd").select("span");
            String name = "";
            for(Element d_span : span){
                 name += d_span.select("a").html().trim() + "_";
            }
            System.out.println("clazz: " + clazz + ", name: " + name);
            Map<String, String> map = new HashMap<>();
            map.put("clazz", clazz);
            map.put("name", name);
            list.add(map);
        }
        return list;
    }
}
