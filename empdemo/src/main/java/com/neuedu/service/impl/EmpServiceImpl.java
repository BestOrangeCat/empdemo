package com.neuedu.service.impl;

import com.neuedu.entity.Emp;
import com.neuedu.mapper.EmpMapper;
import com.neuedu.service.EmpService;
import lombok.Data;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
@Service
public class EmpServiceImpl implements EmpService {
    @Resource
    private EmpMapper empMapper;
    @Override
    public List<Emp> empList() {
        return empMapper.empList();
    }

    @Override
    public int deleteEmpById(int[] id) {
        return empMapper.deleteEmpById(id);
    }

    @Override
    public int saveEmp(Emp emp) {
        empMapper.saveEmp(emp);
        int i =  empMapper.getCount();
        System.out.println(i);
        return i%10==0?i/10:i/10+1;
    }

    @Override
    public Emp getEmpById(int id) {
        return empMapper.getEmpById(id);
    }

    @Override
    public int updateEmpById(Emp emp) {
        return empMapper.updateEmpById(emp);
    }

}
