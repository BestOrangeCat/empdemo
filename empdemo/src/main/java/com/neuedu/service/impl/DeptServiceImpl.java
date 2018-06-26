package com.neuedu.service.impl;

import com.neuedu.entity.Dept;
import com.neuedu.mapper.DeptMapper;
import com.neuedu.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class DeptServiceImpl implements DeptService{
    @Resource
    private DeptMapper deptMapper;
    @Override
    public List<Dept> deptList() {
        return deptMapper.deptList();
    }
}
