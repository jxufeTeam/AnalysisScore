package cn.jxufe.dao;

import cn.jxufe.entities.AdmininfoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class AdmininfoDaoImpl implements EntityDao<cn.jxufe.entities.AdmininfoEntity> {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<AdmininfoEntity> selectAll() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<AdmininfoEntity> list = null;
        try{
            list = session.createQuery("from AdmininfoEntity admin order by admin.id asc ").list();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return list;
        }
    }

    @Override
    public AdmininfoEntity selectOnce(AdmininfoEntity entity) {
        return null;
    }

    @Override
    public List<AdmininfoEntity> selectPart(int start, int count) {
        return null;
    }

    @Override
    public boolean delete(AdmininfoEntity entity) {
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
    public boolean create(AdmininfoEntity entity) {
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
    public boolean update(AdmininfoEntity entity) {
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
