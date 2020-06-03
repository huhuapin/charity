package com.charity.controller;

import com.charity.entity.Donate;
import com.charity.service.DonateService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Donate)表控制层
 *
 * @author hhp
 * @since 2020-05-11 18:47:14
 */
@RestController
@RequestMapping("donate")
public class DonateController {
    /**
     * 服务对象
     */
    @Resource
    private DonateService donateService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Donate selectOne(Integer id) {
        return this.donateService.queryById(id);
    }

}