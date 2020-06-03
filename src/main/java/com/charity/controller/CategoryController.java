package com.charity.controller;

import com.charity.entity.Category;
import com.charity.service.CategoryService;
import com.charity.util.JacksonUtil;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Category)表控制层
 *
 * @author hhp
 * @since 2020-05-30 15:15:55
 */
@Controller
@RequestMapping("category")
public class CategoryController {
    /**
     * 服务对象
     */
    @Resource
    private CategoryService categoryService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Category selectOne(Integer id,Model mode) {
        return this.categoryService.queryById(id);
    }

    @GetMapping("lists")
    public String lists(Model model) {

        Category category = new Category();
        List<Category> categories = categoryService.queryAll(category);
        model.addAttribute("data", JacksonUtil.toJson(categories));

        return "admin/root/manage_category";
    }

    @PostMapping("add")
    @ResponseBody
    public Map<String,Object> add(String category) {
        Category category1 = new Category();
        category1.setCategory(category);
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            categoryService.insert(category1);
            map.put("code",0);
            map.put("data",null);
        }catch (Exception e) {
            map.put("code",-1);
            map.put("data",null);
        }
        return map;
    }

    @PostMapping("edit")
    @ResponseBody
    public Map<String,Object> edit(Category category) {
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            categoryService.update(category);
            map.put("code",0);
            map.put("data",null);
        }catch (Exception e) {
            map.put("code",-1);
            map.put("data",null);
        }
        return map;
    }

}