package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.entity.Body;
import com.example.demo.mapper.BodyMapper;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;

@RestController
@RequestMapping("/body")
public class BodyController {
    @Resource
    BodyMapper bodyMapper;
    @PostMapping
    public Result<?> save(@RequestBody Body body) {
        bodyMapper.insert(body);
        return Result.success(body);
    }
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        bodyMapper.deleteById(id);
        return Result.success(bodyMapper.selectById(id));
    }

    @PutMapping
    public Result<?> update(@RequestBody Body body) {
        bodyMapper.updateById(body);
        return Result.success(body);
    }

    //条件查询（使用用户名、分页）
    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "''") String search) {
        LambdaQueryWrapper<Body> wrapper = Wrappers.<Body>lambdaQuery();
        if(StrUtil.isNotBlank(search)){
            wrapper.like(Body::getName, search);
        }
        Page<Body> bodyPage = bodyMapper.selectPage(new Page<>(pageNum,pageSize),wrapper);
        return Result.success(bodyPage);
    }
}
