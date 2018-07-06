package cn.jxufe.spider.parse;

import cn.jxufe.entities.CollegelistEntity;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import javax.lang.model.util.Elements;

public class CollegeinfoParse {
    public static String getData(String html) throws Exception{
        Document doc = Jsoup.parse(html);
        String text = doc.select(".jj").html().trim();

        return text;
    }
}
