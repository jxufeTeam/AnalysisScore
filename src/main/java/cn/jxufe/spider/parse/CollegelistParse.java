package cn.jxufe.spider.parse;

import cn.jxufe.entities.CollegelistEntity;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CollegelistParse {
    public static CollegelistEntity getData(String html) throws Exception{
        CollegelistEntity collegelist = new CollegelistEntity();
        Document doc = Jsoup.parse(html);
        Elements wrap = doc.select(".bg_sez");
        Elements info = wrap.select(".college_msg");
        Elements basic_infor = info.select(".basic_infor").select("li");
        Elements content = info.select(".contact").select("p");

        String name = wrap.select("h2").html().split("<")[0].trim();
        String badge = info.select("img").attr("src").trim();
        String type = "";
        for(Element temp : basic_infor.eq(0).select("span")){
            type += temp.html().trim() + ",";
        }
        String belong = basic_infor.eq(1).html().trim().substring(6);
        String province = basic_infor.eq(2).html().trim().substring(6);
        String[] list1 = basic_infor.eq(3).html().trim().split(" ");
        int academician = 0;
        int doctor = 0;
        int master = 0;
        for(int i = 0; i < list1.length; i++){
            String regEx="[^0-9]";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(list1[i].split("：")[1]);
            int num = Integer.parseInt(m.replaceAll("").trim().equals("") ? "0" : m.replaceAll("").trim());
            switch (i){
                case 0:
                    academician = num;
                    break;
                case 1:
                    doctor = num;
                    break;
                case 2:
                    master = num;
                    break;
                default:
                    break;
            }
        }
        String[] list2 = content.html().trim().split("：");
        String collegesite = list2[list2.length - 1];

        collegelist.setName(name);
        collegelist.setBadge(badge);
        collegelist.setType(type);
        collegelist.setBelong(belong);
        collegelist.setProvince(province);
        collegelist.setAcademician(academician);
        collegelist.setDoctor(doctor);
        collegelist.setMaster(master);
        collegelist.setCollegesite(collegesite);
        return collegelist;
    }
}
