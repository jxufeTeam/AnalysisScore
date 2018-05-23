package cn.jxufe.service;

import cn.jxufe.dao.ProvincelistDaoImpl;
import cn.jxufe.entities.ProvincelistEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProvincelistServiceImpl implements EntityService<ProvincelistEntity> {
    @Autowired
    private ProvincelistDaoImpl provincelistDao;

    public void setProvincelistDao(ProvincelistDaoImpl provincelistDao) {
        this.provincelistDao = provincelistDao;
    }

    @Override
    public List<ProvincelistEntity> selectAll() {
        return provincelistDao.selectAll();
    }

    @Override
    public ProvincelistEntity selectOnce(ProvincelistEntity entity) {
        return provincelistDao.selectOnce(entity);
    }

    @Override
    public List<ProvincelistEntity> selectPart(int start, int count) {
        return provincelistDao.selectPart(start, count);
    }

    @Override
    public boolean delete(ProvincelistEntity entity) {
        return provincelistDao.delete(entity);
    }

    @Override
    public boolean create(ProvincelistEntity entity) {
        return provincelistDao.create(entity);
    }

    @Override
    public boolean update(ProvincelistEntity entity) {
        return provincelistDao.update(entity);
    }
}
