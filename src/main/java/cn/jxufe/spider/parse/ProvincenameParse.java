package cn.jxufe.spider.parse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class ProvincenameParse {
    public static String getData(String html) throws Exception{
        Document doc = Jsoup.parse(html);
        String name = doc.select(".menufix").select(".on").eq(0).html().trim();
        System.out.println(name);
        return name;
    }
}
