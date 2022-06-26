package vn.furniture.DAO;

import java.util.List;

public interface IObjectDAO<T> {
    default List<T> getList() {
        return null;
    }

    default T getRow(String id) {
        return null;
    }

    default T getRow(int id) {
        return null;
    }

    default int add(T entity) {
        return 0;
    }

    default int update(T entity) {
        return 0;
    }

    default int delete(T entity) {
        return 0;
    }
}
