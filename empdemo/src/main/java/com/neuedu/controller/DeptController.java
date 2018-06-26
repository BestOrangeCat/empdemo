package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.entity.Dept;
import com.neuedu.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = {"dept"})
public class DeptController {
    @Resource
    private DeptService deptService;
    @RequestMapping(value = {"/deptlist"})
    public String deptlist(ModelMap modelMap, @RequestParam(name = "pageNum",defaultValue = "1") int pageNum, HttpSession httpSession){
        PageHelper.startPage(pageNum,10);
        List<Dept> depts = deptService.deptList();
        PageInfo<Dept> pageInfo = new PageInfo<>(depts,5);
        modelMap.put("pageInfo",pageInfo);
        httpSession.setAttribute("deptPageNum",pageInfo.getPageNum());
        return "deptlist";
    }
    @RequestMapping(value = {"/deleteDeptById"})
    public String deleteDeptById(){

        return "";
    }
}
