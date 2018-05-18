package com.bb.mapper;

import com.bb.entity.LoginLog;
import org.apache.ibatis.annotations.Param;

public interface ILoginLogMapper {
    Integer insertLoginLog(LoginLog loginLog);
}
