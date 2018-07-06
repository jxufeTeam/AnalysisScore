package cn.jxufe.action;

import cn.jxufe.entities.SimulationEntity;
import cn.jxufe.service.SimulationServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SimulationAction extends ActionSupport {
    private String simulationList;
    @Autowired
    private SimulationServiceImpl simulationService;

    public String getSimulationList() {
        return simulationList;
    }

    public void setSimulationList(String simulationList) {
        this.simulationList = simulationList;
    }

    public void setSimulationService(SimulationServiceImpl simulationService) {
        this.simulationService = simulationService;
    }

    public String getMainList(){
        List<SimulationEntity> simulations = this.simulationService.selectPart(1, 10);
        List<Map<String, String>> list = new ArrayList<>();
        for(SimulationEntity simulation : simulations){
            Map<String, String> map = new HashMap<>();
            map.put("id", simulation.getId()+"");
            map.put("name", simulation.getName());
            map.put("link", simulation.getLink());
            list.add(map);
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
        simulationList = jsonArray.toString();
        return SUCCESS;
    }
}
