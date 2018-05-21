package cn.jxufe.service;

import cn.jxufe.dao.CollegelistDaoImpl;
import cn.jxufe.entities.CollegelistEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CollegelistServiceImpl implements EntityService<CollegelistEntity> {
    @Autowired
    private CollegelistDaoImpl collegelistDao;

    public void setCollegelistDao(CollegelistDaoImpl collegelistDao) {
        this.collegelistDao = collegelistDao;
    }

    @Override
    public List<CollegelistEntity> selectAll() {
        return collegelistDao.selectAll();
    }

    @Override
    public CollegelistEntity selectOnce(CollegelistEntity entity) {
        return collegelistDao.selectOnce(entity);
    }

    @Override
    public List<CollegelistEntity> selectPart(int start, int count) {
        return collegelistDao.selectPart(start, count);
    }

    @Override
    public boolean delete(CollegelistEntity entity) {
        return collegelistDao.delete(entity);
    }

    @Override
    public boolean create(CollegelistEntity entity) {
        return collegelistDao.create(entity);
    }

    @Override
    public boolean update(CollegelistEntity entity) {
        return collegelistDao.update(entity);
    }
}
