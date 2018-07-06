package cn.jxufe.dao;

import cn.jxufe.entities.SimulationEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;
import java.util.List;

public class SimulationDaoImpl implements EntityDao<SimulationEntity>{
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
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
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<SimulationEntity> list = null;
        try{
            Query query = session.createQuery("select simulation from SimulationEntity simulation order by simulation.id asc ");
            query.setFirstResult((start - 1) * count);
            query.setMaxResults(count);
            list = query.list();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return list;
        }
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
