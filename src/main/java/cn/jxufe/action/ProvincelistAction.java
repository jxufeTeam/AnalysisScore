package cn.jxufe.action;

import cn.jxufe.entities.ProvincelistEntity;
import cn.jxufe.service.ProvincelistServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProvincelistAction extends ActionSupport {

    private String provincelist;

    @Autowired
    private ProvincelistServiceImpl provincelistService;

    public String getProvincelist() {
        return provincelist;
    }

    public void setProvincelist(String provincelist) {
        this.provincelist = provincelist;
    }

    public void setProvincelistService(ProvincelistServiceImpl provincelistService) {
        this.provincelistService = provincelistService;
    }

    public String getProvince(){
        List<ProvincelistEntity> province = provincelistService.selectAll();
        JSONArray jsonArray = JSONArray.fromObject(province);
        provincelist = jsonArray.toString();
        return SUCCESS;
    }
}
