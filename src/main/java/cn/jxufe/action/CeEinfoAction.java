package cn.jxufe.action;

import cn.jxufe.entities.CeEinfoEntity;
import cn.jxufe.service.CeEinfoServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CeEinfoAction extends ActionSupport {
    @Autowired
    private CeEinfoServiceImpl ceEinfoService;

    private String ceeinfoList;

    private String ceeinfoMap;

    private int start;

    private int count;

    private String category;

    private String province;

    private int id;

    public void setCeEinfoService(CeEinfoServiceImpl ceEinfoService) {
        this.ceEinfoService = ceEinfoService;
    }

    public String getCeeinfoList() {
        return ceeinfoList;
    }

    public void setCeeinfoList(String ceeinfoList) {
        this.ceeinfoList = ceeinfoList;
    }

    public String getCeeinfoMap() {
        return ceeinfoMap;
    }

    public void setCeeinfoMap(String ceeinfoMap) {
        this.ceeinfoMap = ceeinfoMap;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMainList(){
        List<CeEinfoEntity> ceeinfoList = ceEinfoService.selectPart(start,count,category);
        List<Map<String, String>> list = new ArrayList<>();
        for(Object ceeinfo : ceeinfoList){
            Map<String, String> map = new HashMap<>();
            Object[] temp = (Object[]) ceeinfo;
            map.put("id", temp[0]+"");
            map.put("title", temp[1]+"");
            map.put("time", temp[2]+"");
            map.put("category", category);
            list.add(map);
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        this.ceeinfoList = jsonArray.toString();
        return SUCCESS;
    }

    public String getOnce(){
        CeEinfoEntity search = new CeEinfoEntity();
        search.setId(id);
        CeEinfoEntity ceEinfo = ceEinfoService.selectOnce(search);
        Map<String, String> map = new HashMap<>();
        map.put("title", ceEinfo.getTitle());
        map.put("author", ceEinfo.getAuthor());
        map.put("content", ceEinfo.getContent());
        map.put("category", ceEinfo.getCategory());
        map.put("province", ceEinfo.getProvince());
        map.put("time", ceEinfo.getCreatetime()+"");
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(map, jsonConfig);
        this.ceeinfoMap = jsonArray.toString();
        return SUCCESS;
    }

    public String getListByProvince(){
        List<CeEinfoEntity> ceeinfoList = ceEinfoService.selectPart(start,count,category, province);
        List<Map<String, String>> list = new ArrayList<>();
        for(Object ceeinfo : ceeinfoList){
            Map<String, String> map = new HashMap<>();
            Object[] temp = (Object[]) ceeinfo;
            map.put("id", temp[0]+"");
            map.put("title", temp[1]+"");
            map.put("time", temp[2]+"");
            map.put("category", category);
            list.add(map);
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        this.ceeinfoList = jsonArray.toString();
        return SUCCESS;
    }
}
