package com.szl.dao;

import com.szl.domain.Discase;

import java.util.List;

/**
 * Created by zsc on 2017/1/15.
 */
public interface DiscaseDao {

    public void insertDiscase(Discase discase);

    public void insertAllDiscase(List<Discase> userList);

    public Discase selectDiscaseById(int discaseId);

    public List<Discase> selectAllDiscases();

    public void updateDiscase(Discase discase);

    public void deleteDiscase(int Id);
}
