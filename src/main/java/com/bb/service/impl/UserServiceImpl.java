package com.bb.service.impl;

import com.bb.entity.LoginLog;
import com.bb.entity.PageBean;
import com.bb.entity.User;
import com.bb.mapper.ILoginLogMapper;
import com.bb.mapper.IUserMapper;
import com.bb.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Resource
    private IUserMapper userMapper;
    @Resource
    private ILoginLogMapper loginLogMapper;


    public User selectUser(long userId){
        return this.userMapper.selectUser(userId);
    }

    @Override
    public int insertUser(User user) {
        return this.userMapper.insertUser(user);
    }

    /**
     * 查找用户，并返回用户
     * @param userName
     * @return User
     * */
    @Override
    public User findUserByName(String userName) {
        return this.userMapper.findUserByName(userName);
    }

    @Override
    public boolean hasMatchUser(String userName, String password) {
        int matchCount = userMapper.getMatchCount(userName,password);
        return matchCount > 0;
    }

    @Override
    public List<User> selectAllUser() {
        return this.userMapper.selectAllUser();
    }

    @Override
    public List<User> selectByPage() {
        return this.userMapper.selectByPage();
    }

    /**
     * 登陆登记与更新
     * @param user
     * */
    @Override
    @Transactional
    public void loginSuccess(User user) {
        System.out.println("===****===");
        System.out.println(user.getUserName());
        user.setCredits(5+user.getCredits());
        System.out.println("NC = "+user.getCredits());
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId((int)user.getUserId());
        loginLog.setIp(user.getLastIp());
        loginLog.setLoginDate(user.getLastVisit());
        userMapper.updateLoginInfo(user);
        System.out.println("XXXXXX");
        loginLogMapper.insertLoginLog(loginLog);
        System.out.println("ZZZZZZZ");
    }

    @Override
    public List<User> searchUserByName(Map<String, Object> params) {
        return this.userMapper.searchUserByName(params);
    }

    /**
     * 分页查询业务
     * @param pageNumber
     * @param  pageSize
     * @param  params
     * */
    @Override
    public PageBean<User> searchPage(int pageNumber,int pageSize,Map<String, Object> params) {
        int totalRecord = userMapper.getTotalRecord(params);
        PageBean<User> pageBean = new PageBean<>(pageNumber,pageSize,totalRecord);
        params.put("startIndex",pageBean.getStartIndex());
        params.put("pageSize",pageBean.getPageSize());
        List<User> data = userMapper.searchPage(params);
        pageBean.setData(data);
        return pageBean;
    }

    /**
     * 判断用户是否存在(Ajax用)
     * @param userName
     *
     * */
    @Override
    public boolean isExistUserName(String userName) {
        int matchCount = userMapper.isExistUserName(userName);
        System.out.println(matchCount);
        return matchCount>0?true:false;
    }

    @Override
    public Integer updateCredits(long id, long credits) {
        return this.userMapper.updateCredit(id,credits);
    }
}
