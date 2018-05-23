package cn.jxufe.spider.parse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProvincelineParse {
    public static List<Map> getData(String html) throws Exception {
        //获取的数据，存放在集合中
        List<Map> list = new ArrayList<>();
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        Elements elements = doc.select(".zycx").select("table").select("tr");
        for (Element ele:elements) {
            if(ele.select("td") != null){
                String year = ele.select("td").eq(0).text();
                String province=ele.select("td").eq(1).text();
                String category=ele.select("td").eq(2).text();
                String batch = ele.select("td").eq(3).text();
                String score=ele.select("td").eq(4).text();


                Map<String, String> map = new HashMap<>();
                map.put("year", year);
                map.put("province", province);
                map.put("category", category);
                map.put("batch", batch);
                map.put("score", score);

                if(map.get("year").length() == 4){
                    list.add(map);
                }
            }
        }
        //返回数据
        return list;
    }
}
