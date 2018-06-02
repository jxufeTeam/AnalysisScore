package cn.jxufe.action;

import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.service.CollegelistServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollegelistAction extends ActionSupport {

    private int start;

    private int end;

    private String condition;

    private String province;

    private String collegelist;

    private String count;

    @Autowired
    private CollegelistServiceImpl collegelistService;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCollegelist() {
        return collegelist;
    }

    public void setCollegelist(String collegelist) {
        this.collegelist = collegelist;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public void setCollegelistService(CollegelistServiceImpl collegelistService) {
        this.collegelistService = collegelistService;
    }

    public String getCollege(){
        List<CollegelistEntity> colleges;
//        System.out.println("start: " + start + ",end: " + end + ",province: " + province);
        if(condition != ""){
            colleges = collegelistService.selectPart(start, end, condition, province);
        }else{
            if(province.equals("全部")){
                colleges = collegelistService.selectPart(start, end);
            }else{
                colleges = collegelistService.selectPart(start, end, province);
            }
        }

        List<Map<String, String>> list = new ArrayList<>();
        for(Object college : colleges){
            Map<String, String> map = new HashMap<>();
            Object[] temp = (Object[]) college;
            map.put("name", temp[0]+"");
            map.put("badge", temp[1]+"");
            map.put("type", temp[2]+"");
            map.put("belong", temp[3]+"");
            map.put("master", temp[4]+"");
            map.put("doctor", temp[5]+"");
            map.put("province", temp[6]+"");
            map.put("collegesite", temp[7]+"");
            list.add(map);
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        collegelist = jsonArray.toString();
        return SUCCESS;
    }

    public String getNum(){
        System.out.println("start: " + start + ",end: " + end + ",province: " + province);
        if(condition != ""){
            count = collegelistService.selectCount(condition, province);
        }else{
            if(province.equals("全部")){
                count = collegelistService.selectCount();
            }else{
                count = collegelistService.selectCount(province);
            }
        }
        return SUCCESS;
    }
}
