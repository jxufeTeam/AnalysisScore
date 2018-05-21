package cn.jxufe.service;

import java.util.List;

public interface EntityService<T> {
    List<T> selectAll();

    T selectOnce(T entity);

    List<T> selectPart(int start, int count);

    boolean delete(T entity);

    boolean create(T entity);

    boolean update(T entity);
}
