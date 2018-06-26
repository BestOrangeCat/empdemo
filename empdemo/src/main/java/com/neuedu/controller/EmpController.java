package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.entity.Emp;
import com.neuedu.service.DeptService;
import com.neuedu.service.EmpService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = {"/emp"})
public class EmpController {
    @Resource
    private DeptService deptService;
    @Resource
    private EmpService empService;
    @RequestMapping(value = {"/emplist"})
    public String empList(ModelMap model, @RequestParam(name = "pageNum",defaultValue = "1")int pageNum, HttpSession httpSession){
        PageHelper.startPage(pageNum,10);
        List<Emp> emps = empService.empList();
        PageInfo<Emp> pageInfo = new PageInfo<>(emps,10);
        model.put("pageInfo",pageInfo);
        httpSession.setAttribute("pageNum",pageInfo.getPageNum());
        return "emplist";
    }
    /*？？？？？？？？？难道这个不加前缀后缀？*/
    @RequestMapping(value = {"/deleteEmpById"})
    public String deleteEmpById(int[] id,HttpSession httpSession){
        empService.deleteEmpById(id);
        Integer pageNum = (Integer) httpSession.getAttribute("pageNum");
        return "redirect:/emp/emplist?pageNum="+pageNum;
    }
    @RequestMapping(value = {"/addEmpView"})
    public String addEmpView(ModelMap modelMap){
        modelMap.put("deptList",deptService.deptList());
        return "addEmp";
    }
    @RequestMapping(value = {"/addEmp"})
    public String addEmp(Emp emp){
        int pageNum = empService.saveEmp(emp);
        return "redirect:/emp/emplist?pageNum="+pageNum;
    }
    @RequestMapping(value = {"/updateEmpById"})
    public String updateEmpById(ModelMap map,int id){
        map.put("emp_id",empService.getEmpById(id));
        map.put("deptList",deptService.deptList());
        return "updateEmp";
    }
    @RequestMapping(value = {"/updateEmpView"})
    public String updateEmpView(Emp emp,HttpSession httpSession){
        empService.updateEmpById(emp);
        Integer pageNum = (Integer) httpSession.getAttribute("pageNum");
        return "redirect:/emp/emplist?pageNum="+pageNum;
    }
}
