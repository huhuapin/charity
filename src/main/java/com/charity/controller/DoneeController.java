package com.charity.controller;

import com.charity.entity.Donee;
import com.charity.service.DoneeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Donee)表控制层
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
@RestController
@RequestMapping("donee")
public class DoneeController {
    /**
     * 服务对象
     */
    @Resource
    private DoneeService doneeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Donee selectOne(Integer id) {
        return this.doneeService.queryById(id);
    }

}