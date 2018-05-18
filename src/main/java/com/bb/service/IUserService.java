package com.bb.service;

import com.bb.entity.PageBean;
import com.bb.entity.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface IUserService {
    public User selectUser(long userId);
    int insertUser(User user);
    public User findUserByName(String userName);
    public boolean hasMatchUser(String userName,String password);
    public List<User> selectAllUser();
    public List<User> selectByPage();
    public void loginSuccess(User user);

    public List<User> searchUserByName(Map<String,Object> params);

//    PageBean<User> findPage(int pageNumber,int pageSize);

    PageBean<User> searchPage(int pageNumber,int pageSize,Map<String,Object> params);
    public boolean isExistUserName(String userName);
    Integer updateCredits(long id,long credits);

}
