package com.charity.controller;

import com.charity.entity.Donor;
import com.charity.service.DonorService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Donor)表控制层
 *
 * @author hhp
 * @since 2020-05-11 18:33:47
 */
@RestController
@RequestMapping("donor")
public class DonorController {
    /**
     * 服务对象
     */
    @Resource
    private DonorService donorService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Donor selectOne(Integer id) {
        return this.donorService.queryById(id);
    }

}