package com.bb.mapper;

import com.bb.entity.PageBean;
import com.bb.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IUserMapper {
    User selectUser(long id);

    int insertUser(User user);

    User findUserByName(String userName);

    Integer getMatchCount(@Param("userName") String userName, @Param("password") String password);

    Integer isExistUserName(String userName);

    List<User> selectAllUser();

    List<User> selectByPage();

    Integer updateLoginInfo(User user);

    List<User> searchUserByName(Map<String,Object> params);

   // List<User> selectPage(@Param("startIndex") Integer startIndex,@Param("pageSize") Integer pageSize);
    List<User> searchPage(Map<String,Object> params);
    int getTotalRecord(Map<String,Object> params);
    Integer updateCredit(@Param("userId") long userId,@Param("credits") long credits);
}
