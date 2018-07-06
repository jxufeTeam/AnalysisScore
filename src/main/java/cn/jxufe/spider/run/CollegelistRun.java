package cn.jxufe.spider.run;

import cn.jxufe.dao.EntityDao;
import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.service.EntityService;
import cn.jxufe.spider.utils.CollegeinfoURLFecter;
import cn.jxufe.spider.utils.CollegelineURLFecter;
import cn.jxufe.spider.utils.CollegelistURLFecter;
import cn.jxufe.spider.utils.CollegemajorURLFecter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CollegelistRun {
//    static final Log logger = LogFactory.getLog(CollegelistRun.class);
    public static void main(String[] args) throws Exception {
        int university = 561;
        int province = 1;
        int classical = 1;

        while(university <= 570){
            CollegelistEntity collegelist;
            List<Map> list = new ArrayList<>();
            List<Map> majorlist = new ArrayList<>();
            String url = "http://college.gaokao.com/school/tinfo/" + university;
            String info = "http://college.gaokao.com/school/" + university;
            String brochure = url + "/jianzhang/1";
            String guide = url + "/major/1";
            String major = url + "/schspe";
            collegelist = CollegelistURLFecter.URLParser(info);
            collegelist.setCollegebrochure(CollegeinfoURLFecter.URLParser(brochure));
            collegelist.setCollegeguide(CollegeinfoURLFecter.URLParser(guide));
            majorlist.addAll(CollegemajorURLFecter.URLParser(major));
            while(province <= 39){
                while(classical <= 2){
                    //我们要爬取的一个地址
                    String line = url + "/result/" + province + "/" + (classical++) + "/";
                    //抓取的数据
                    List<Map> temp = CollegelineURLFecter.URLParser(line);
                    if(temp != null){
                        list.addAll(temp);
                    }
                }
                province++;
                classical = 1;
            }
            university++;
            province = 1;
            classical = 1;

            JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
            JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
            JSONArray jsonArray1 = JSONArray.fromObject(majorlist, jsonConfig);
            collegelist.setCollegeline(jsonArray.toString());
            collegelist.setMajorlist(jsonArray1.toString());

            ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
            EntityService<CollegelistEntity> collegelistService = (EntityService<CollegelistEntity>) ac.getBean("collegelistService");
            collegelistService.create(collegelist);
            System.out.println("部分数据爬取完成！");
        }
    }
}
