package cn.jxufe.service;

import cn.jxufe.dao.CeEinfoDaoImpl;
import cn.jxufe.entities.CeEinfoEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CeEinfoServiceImpl implements EntityService<CeEinfoEntity> {
    @Autowired
    private CeEinfoDaoImpl ceEinfoDao;

    public void setCollegelistDao(CeEinfoDaoImpl ceEinfoDao) {
        this.ceEinfoDao = ceEinfoDao;
    }
    @Override
    public List<CeEinfoEntity> selectAll() {
        return null;
    }

    @Override
    public CeEinfoEntity selectOnce(CeEinfoEntity entity) {
        return ceEinfoDao.selectOnce(entity);
    }

    @Override
    public List<CeEinfoEntity> selectPart(int start, int count) {
        return ceEinfoDao.selectPart(start, count);
    }

    public List<CeEinfoEntity> selectPart(int start, int count, String category) {
        return ceEinfoDao.selectPart(start, count, category);
    }

    public List<CeEinfoEntity> selectPart(int start, int count, String category, String province) {
        return ceEinfoDao.selectPart(start, count, category, province);
    }

    @Override
    public boolean delete(CeEinfoEntity entity) {
        return false;
    }

    @Override
    public boolean create(CeEinfoEntity entity) {
        return false;
    }

    @Override
    public boolean update(CeEinfoEntity entity) {
        return false;
    }
}
