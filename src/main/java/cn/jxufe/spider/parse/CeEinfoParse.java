package cn.jxufe.spider.parse;

import cn.jxufe.entities.CeEinfoEntity;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.sql.Date;


public class CeEinfoParse {
    public static CeEinfoEntity getData(String html, String category, String province) throws Exception{
        Document doc = Jsoup.parse(html);
        String title = doc.select(".bm10").eq(0).select("a").html().trim();
        String time = doc.select(".tip_b").select(".rm30").eq(0).html().trim();
        Date date = Date.valueOf(time);;
        String author = doc.select(".tip_b").select(".rm30").eq(1).html().trim();
        String content = doc.select(".main").html();
        int state = 2;
        CeEinfoEntity ceEinfoEntity = new CeEinfoEntity();
        ceEinfoEntity.setTitle(title);
        ceEinfoEntity.setAuthor(author);
        ceEinfoEntity.setContent(content);
        ceEinfoEntity.setCategory(category);
        ceEinfoEntity.setProvince(province);
        ceEinfoEntity.setState(state);
        ceEinfoEntity.setCreatetime(date);
        ceEinfoEntity.setUpdatetime(date);
        return ceEinfoEntity;
    }
}
