package com.neuedu.mapper;

import com.neuedu.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    /**
     * 查询emp
     * @return emp集合
     */
    List<Emp> empList();

    /**
     * 查询共有多少行
     */
    int getCount();

    /**
     * 通过id获得emp
     * @return
     */
    Emp getEmpById(int id);

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
    int saveEmp(@Param("emp") Emp emp);

    /**
     * 通过emp中的id找到相应的值再修改
     * @param emp
     * @return
     */
    int updateEmpById(@Param("emp") Emp emp);
}
