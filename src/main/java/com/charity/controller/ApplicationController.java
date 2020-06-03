package com.charity.controller;

import com.charity.entity.Application;
import com.charity.service.ApplicationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Application)表控制层
 *
 * @author hhp
 * @since 2020-05-11 18:46:37
 */
@RestController
@RequestMapping("application")
public class ApplicationController {
    /**
     * 服务对象
     */
    @Resource
    private ApplicationService applicationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Application selectOne(Integer id) {
        return this.applicationService.queryById(id);
    }

}