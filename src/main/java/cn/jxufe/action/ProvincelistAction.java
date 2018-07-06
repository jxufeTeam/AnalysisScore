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

    private String provinceLine;

    private String province;

    @Autowired
    private ProvincelistServiceImpl provincelistService;

    public String getProvincelist() {
        return provincelist;
    }

    public void setProvincelist(String provincelist) {
        this.provincelist = provincelist;
    }

    public void setProvinceLine(String provinceLine) {
        this.provinceLine = provinceLine;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setProvincelistService(ProvincelistServiceImpl provincelistService) {
        this.provincelistService = provincelistService;
    }

    public String getAllProvince(){
        List<ProvincelistEntity> province = provincelistService.selectAll();
        JSONArray jsonArray = JSONArray.fromObject(province);
        provincelist = jsonArray.toString();
        return SUCCESS;
    }

    public String getOnceProvinceLine(){
        ProvincelistEntity provincelistEntity = new ProvincelistEntity();
        provincelistEntity.setName(province);
        provincelistEntity = provincelistService.selectOnce(provincelistEntity);
        JSONArray jsonArray = JSONArray.fromObject(provincelistEntity);
        provincelist = jsonArray.toString();
        return SUCCESS;
    }
}
