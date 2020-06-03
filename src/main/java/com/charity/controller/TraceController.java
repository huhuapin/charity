package com.charity.controller;

import com.charity.entity.Trace;
import com.charity.service.TraceService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Trace)表控制层
 *
 * @author hhp
 * @since 2020-05-10 21:32:54
 */
@RestController
@RequestMapping("trace")
public class TraceController {
    /**
     * 服务对象
     */
    @Resource
    private TraceService traceService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Trace selectOne(Integer id) {
        return this.traceService.queryById(id);
    }

}