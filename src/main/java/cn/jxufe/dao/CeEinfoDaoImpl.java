package cn.jxufe.dao;

import cn.jxufe.entities.CeEinfoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class CeEinfoDaoImpl implements EntityDao<CeEinfoEntity> {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<CeEinfoEntity> selectAll() {
        return null;
    }

    @Override
    public CeEinfoEntity selectOnce(CeEinfoEntity entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        CeEinfoEntity ceEinfo = null;
        try{
            Query query = session.createQuery("from CeEinfoEntity ceEinfo where ceEinfo.id =?");
            query.setParameter(0, entity.getId());
            ceEinfo = (CeEinfoEntity) query.uniqueResult();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return ceEinfo;
        }
    }

    @Override
    public List<CeEinfoEntity> selectPart(int start, int count) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<CeEinfoEntity> list = null;
        try{
            Query query = session.createQuery("select ceEinfoEntity.title,ceEinfoEntity.category,ceEinfoEntity.province,ceEinfoEntity.createtime from CeEinfoEntity ceEinfoEntity order by ceEinfoEntity.id asc ");
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


    public List<CeEinfoEntity> selectPart(int start, int count, String category) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<CeEinfoEntity> list = null;
        try{
            Query query = session.createQuery("select ceEinfoEntity.id, ceEinfoEntity.title,ceEinfoEntity.createtime from CeEinfoEntity ceEinfoEntity where ceEinfoEntity.category=? order by ceEinfoEntity.id asc ");
            query.setParameter(0,category);
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

    public List<CeEinfoEntity> selectPart(int start, int count, String category, String province) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<CeEinfoEntity> list = null;
        try{
            Query query = session.createQuery("select ceEinfoEntity.id, ceEinfoEntity.title,ceEinfoEntity.createtime from CeEinfoEntity ceEinfoEntity where ceEinfoEntity.category=? and ceEinfoEntity.province=? order by ceEinfoEntity.id asc ");
            query.setParameter(0,category);
            query.setParameter(1,province);
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
    public boolean delete(CeEinfoEntity entity) {
        return false;
    }

    @Override
    public boolean create(CeEinfoEntity entity) {
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
    public boolean update(CeEinfoEntity entity) {
        return false;
    }
}
