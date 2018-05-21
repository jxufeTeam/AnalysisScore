package cn.jxufe.spider.parse;

import cn.jxufe.entities.CollegelistEntity;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollegelineParse {
    public static List<Map> getData(String html) throws Exception {
        //获取的数据，存放在集合中
        List<Map> list = new ArrayList<>();
        //采用Jsoup解析
        Document doc = Jsoup.parse(html);
        //获取html标签中的内容
        Elements elements = doc.select("#pointbyarea").select("table").select("tr");
        Elements info = doc.select(".cont_l").select(".btnFsxBox").select("font");
        for (Element ele:elements) {
            if(ele.select("td") != null){
                String province = info.eq(1).text();
                String classical = info.eq(2).text();
                String year = ele.select("td").eq(0).text();
                String lowScore=ele.select("td").eq(1).text().equals("------") ? "0" : ele.select("td").eq(1).text();
                String higtScore=ele.select("td").eq(2).text().equals("------") ? "0" : ele.select("td").eq(2).text();
                String averageScore=ele.select("td").eq(3).text().equals("------") ? "0" : ele.select("td").eq(3).text();
                String admissions = ele.select("td").eq(4).text().equals("------") ? "0" : ele.select("td").eq(3).text();
                String batch = ele.select("td").eq(5).text();


                Map<String, String> map = new HashMap<>();
                map.put("province", province);
                map.put("classical", classical);
                map.put("year", year);
                map.put("lowScore", lowScore);
                map.put("higtScore", higtScore);
                map.put("averageScore", averageScore);
                map.put("admissions", admissions);
                map.put("batch", batch);

                if(map.get("year").length() == 4){
                    System.out.println("batch: " + batch);
                    list.add(map);
                }
            }
        }
        //返回数据
        return list;
    }
}
