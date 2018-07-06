package cn.jxufe.spider.parse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class CeEinfoLinkParse {
    public static List<String> getData(String html) throws Exception{
        Document doc = Jsoup.parse(html);
        Elements ul = doc.select(".text_list1").select("li");
        List<String> list = new ArrayList<>();
        for(Element li : ul){
//            String link = li.select(".title a").attr("href");
            String link = li.select(".h2_tit").select("a").attr("href");
            list.add(link);
        }
        return list;
    }
}
