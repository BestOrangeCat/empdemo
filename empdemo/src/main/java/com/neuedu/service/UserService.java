package com.neuedu.service;

import com.neuedu.entity.User;

public interface UserService {
    /**
     * 通过用户名获得user
     * @return
     */
    User getUserByUsername(String username);
}
