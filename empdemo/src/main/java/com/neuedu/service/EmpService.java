package com.neuedu.service;

import com.neuedu.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpService {
    /**
     * 查询emp
     * @return emp集合
     */
    List<Emp> empList();

    /**
     * 删除emp
     * @param id
     * @return
     */
    int deleteEmpById(int[] id);

    /**
     * 插入emp
     * @return
     */
    int saveEmp(Emp emp);

    /**
     * 通过id获得emp
     * @return
     */
    Emp getEmpById(int id);

    /**
     * 通过emp中的id找到相应的值再修改
     * @param emp
     * @return
     */
    int updateEmpById(Emp emp);
}
