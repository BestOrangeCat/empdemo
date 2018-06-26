package com.neuedu.mapper;

import com.neuedu.entity.User;

public interface UserMapper {
    /**
     * 通过用户名获得user
     * @return
     */
    User getUserByUsername(String username);
}
