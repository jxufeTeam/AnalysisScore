package cn.jxufe.spider.run;

import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.entities.ProvincelistEntity;
import cn.jxufe.service.EntityService;
import cn.jxufe.spider.utils.ProvincelineURLFecter;
import cn.jxufe.spider.utils.ProvincenameURLFecter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProvincelistRun {
    public static void main(String[] args){
        int province = 6;
        int page = 1;
        while (province <= 39){
            String url = "http://college.gaokao.com/areapoint/a" + province;
            List<Map> list = new ArrayList<>();
            String name = ProvincenameURLFecter.URLParser(url);

            if(!name.equals("全部")){
                ProvincelistEntity provincelist = new ProvincelistEntity();
                provincelist.setName(name);
                while (true){
                    String info = url + "/p" + page;
                    List<Map> temp = ProvincelineURLFecter.URLParser(info);
                    if(temp.size() == 0){
                        break;
                    }else{
                        list.addAll(temp);
                        page++;
                    }
                }
                JsonConfig jsonConfig = new JsonConfig();
                jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
                JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
                System.out.println(jsonArray.toString());
                provincelist.setProvinceline(jsonArray.toString());

                ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
                EntityService<ProvincelistEntity> provincelistService = (EntityService<ProvincelistEntity>) ac.getBean("provincelistService");
                provincelistService.create(provincelist);
                System.out.println("部分数据爬取完成！");
            }
            province++;
            page = 1;
        }
    }
}
