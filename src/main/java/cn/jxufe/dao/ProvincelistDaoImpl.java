package cn.jxufe.dao;

import cn.jxufe.entities.CollegelistEntity;
import cn.jxufe.entities.ProvincelistEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class ProvincelistDaoImpl implements EntityDao<ProvincelistEntity> {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<ProvincelistEntity> selectAll() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<ProvincelistEntity> list = null;
        try{
            list = session.createQuery("select provincelist.name from ProvincelistEntity provincelist order by provincelist.id asc ").list();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return list;
        }
    }

    @Override
    public ProvincelistEntity selectOnce(ProvincelistEntity entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ProvincelistEntity provincelist = null;
        try{
            Query query = session.createQuery("from ProvincelistEntity provincelist where provincelist.name =? order by provincelist.id asc ");
            query.setParameter(0, entity.getName());
            provincelist = (ProvincelistEntity) query.uniqueResult();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return provincelist;
        }
    }

    @Override
    public List<ProvincelistEntity> selectPart(int start, int count) {
        return null;
    }

    public ProvincelistEntity selectOnce(int id){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ProvincelistEntity provincelist = null;
        try{
            Query query = session.createQuery("from ProvincelistEntity provincelist where provincelist.id =? order by provincelist.id asc ");
            query.setParameter(0, id);
            provincelist = (ProvincelistEntity) query.uniqueResult();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return provincelist;
        }
    }

    @Override
    public boolean delete(ProvincelistEntity entity) {
        boolean status = false;
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.delete(entity);
            transaction.commit();
            status = true;
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return status;
        }
    }

    @Override
    public boolean create(ProvincelistEntity entity) {
        boolean status = false;
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.save(entity);
            transaction.commit();
            status = true;
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return status;
        }
    }

    @Override
    public boolean update(ProvincelistEntity entity) {
        boolean status = false;
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.update(entity);
            transaction.commit();
            status = true;
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return status;
        }
    }
}
