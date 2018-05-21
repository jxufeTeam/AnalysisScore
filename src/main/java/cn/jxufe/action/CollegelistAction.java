package cn.jxufe.action;

import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.service.CollegelistServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollegelistAction extends ActionSupport {

    private int start;

    private int end;

    private String collegelist;

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

    public String getCollegelist() {
        return collegelist;
    }

    public void setCollegelist(String collegelist) {
        this.collegelist = collegelist;
    }

    public void setCollegelistService(CollegelistServiceImpl collegelistService) {
        this.collegelistService = collegelistService;
    }

    public String getCollegeline(){
        List<CollegelistEntity> colleges = collegelistService.selectPart(start, end);
        List<Map<String, String>> list = new ArrayList<>();
        for(CollegelistEntity college : colleges){
            Map<String, String> map = new HashMap<>();
            map.put("name", college.getName());
            map.put("badge", college.getBadge());
            map.put("type", college.getType());
            map.put("belong", college.getBelong());
            map.put("province", college.getProvince());
            map.put("doctor", college.getDoctor() + "");
            map.put("master", college.getMaster() + "");
            map.put("collegesite", college.getCollegesite());
            list.add(map);
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        collegelist = jsonArray.toString();
        return SUCCESS;
    }
}
