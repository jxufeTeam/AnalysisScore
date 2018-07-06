package cn.jxufe.service;

import cn.jxufe.dao.SimulationDaoImpl;
import cn.jxufe.entities.SimulationEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SimulationServiceImpl implements EntityService<SimulationEntity> {
    @Autowired
    private SimulationDaoImpl simulationDao;

    public void setSimulationDao(SimulationDaoImpl simulationDao) {
        this.simulationDao = simulationDao;
    }

    @Override
    public List<SimulationEntity> selectAll() {
        return null;
    }

    @Override
    public SimulationEntity selectOnce(SimulationEntity entity) {
        return null;
    }

    @Override
    public List<SimulationEntity> selectPart(int start, int count) {
        return this.simulationDao.selectPart(start, count);
    }

    @Override
    public boolean delete(SimulationEntity entity) {
        return false;
    }

    @Override
    public boolean create(SimulationEntity entity) {
        return false;
    }

    @Override
    public boolean update(SimulationEntity entity) {
        return false;
    }
}
