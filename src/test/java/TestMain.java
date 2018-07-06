import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.spider.utils.CollegelineURLFecter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TestMain {
    public static void main(String[] args) throws Exception {
        int university = 1;
        int province = 1;
        int classical = 1;
        CollegelistEntity collegelistEntity = new CollegelistEntity();
        List<Map> list = new ArrayList<>();

        while(university <= 1){
            while(province <= 2){
                while(classical <= 1){
                    //我们要爬取的一个地址
                    String url = "http://college.gaokao.com/school/tinfo/" + university + "/result/" + province + "/" + (classical++) + "/";
                    //抓取的数据
                    List<Map> temp = CollegelineURLFecter.URLParser(url);
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
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        System.out.println(jsonArray.toString());
//
//        ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
//        AdmininfoEntity admin = new AdmininfoEntity();
//        admin.setAccount(153947);
//        admin.setPassword("123456");
//        admin.setPower(1);
//        EntityDao<AdmininfoEntity> admininfoDao = (EntityDao<AdmininfoEntity>) ac.getBean("admininfoDao");
//
//        System.out.println("add entity...");
//        admininfoDao.create(admin);
//        System.out.println("success!" + admininfoDao.select().size());

    }
}
