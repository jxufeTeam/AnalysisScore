package cn.jxufe.dao;

import cn.jxufe.entities.SimulationEntity;

import java.util.List;

public class SimulationDaoImpl implements EntityDao<SimulationEntity>{
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
        return null;
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
