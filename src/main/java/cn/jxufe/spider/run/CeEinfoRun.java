package cn.jxufe.spider.run;

import cn.jxufe.dao.EntityDao;
import cn.jxufe.entities.CeEinfoEntity;
import cn.jxufe.spider.utils.CeEinfoLinkURLFecter;
import cn.jxufe.spider.utils.CeEinfoProvinceURLFecter;
import cn.jxufe.spider.utils.CeEinfoURLFecter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.List;
import java.util.Map;

public class CeEinfoRun {
    public static void main(String[] args) throws Exception {
        String url = "http://www.gaokao.com/gdgkkx/";
        List<Map<String, String>> provinceList = CeEinfoProvinceURLFecter.URLParser(url, 1);
        ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
        EntityDao<CeEinfoEntity> ceEinfoDao = (EntityDao<CeEinfoEntity>) ac.getBean("ceeinfoDao");
        for(Map<String, String> map : provinceList){
            String province = map.get("province");
            String provinceLink = map.get("link");
            List<String> list = CeEinfoLinkURLFecter.URLParser(provinceLink);
            for(String link : list){
                System.out.println(link + "," + province);
                CeEinfoEntity ceEinfo = CeEinfoURLFecter.URLParser(link, "院校动态", province);
                ceEinfoDao.create(ceEinfo);
//                break;
            }
//            break;
        }
    }
}
