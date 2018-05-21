package cn.jxufe.dao;

import cn.jxufe.entities.AdmininfoEntity;
import cn.jxufe.entities.CollegelistEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class CollegelistDaoImpl implements EntityDao<CollegelistEntity> {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    public List<CollegelistEntity> selectAll() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<CollegelistEntity> list = null;
        try{
            list = session.createQuery("from CollegelistEntity colegelist order by colegelist.id asc ").list();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return list;
        }
    }

    public CollegelistEntity selectOnce(CollegelistEntity entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        CollegelistEntity collegelist = null;
        try{
            Query query = session.createQuery("from CollegelistEntity collegelist where collegelist.name =? order by collegelist.id asc ");
            query.setParameter(0, entity.getName());
            collegelist = (CollegelistEntity) query.uniqueResult();
            transaction.commit();
        }catch (Exception ex){
            transaction.rollback();
        }finally {
            session.close();
            return collegelist;
        }
    }

    @Override
    public List<CollegelistEntity> selectPart(int start, int count) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<CollegelistEntity> list = null;
        try{
            Query query = session.createQuery("select collegelist.name,collegelist.badge,collegelist.type,collegelist.belong,collegelist.doctor,collegelist.master,collegelist.province,collegelist.collegesite from CollegelistEntity collegelist order by collegelist.id asc ");
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

    public boolean delete(CollegelistEntity entity) {
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

    public boolean create(CollegelistEntity entity) {
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

    public boolean update(CollegelistEntity entity) {
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
