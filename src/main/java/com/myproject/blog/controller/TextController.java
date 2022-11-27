package com.myproject.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myproject.blog.common.R;
import com.myproject.blog.entity.Text;
import com.myproject.blog.service.TextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/text")
public class TextController {

    @Autowired
    private TextService textService;

    @GetMapping("/getText")
    public R<PageInfo<Text>> getText(Integer pageNum, String key){
        List<Text> list;
        PageHelper.startPage(pageNum,6);
        LambdaQueryWrapper<Text> textLambdaQueryWrapper = new LambdaQueryWrapper<>();
        textLambdaQueryWrapper.orderByDesc(Text::getUpdateTime);
        if(!StringUtils.isEmpty(key)) {
            textLambdaQueryWrapper.like(Text::getName, key);
        }
        list = textService.list(textLambdaQueryWrapper);
        PageInfo<Text> pageInfo = new PageInfo<>(list,5);
        return R.success(pageInfo);
    }

    @GetMapping("/categoryText")
    public R<PageInfo<Text>> getTextByCategory(Integer pageNum,Integer categoryId, String key){
        PageHelper.startPage(pageNum,6);
        LambdaQueryWrapper<Text> textLambdaQueryWrapper = new LambdaQueryWrapper<>();
        textLambdaQueryWrapper.eq(Text::getCategoryId,categoryId);
        textLambdaQueryWrapper.orderByDesc(Text::getUpdateTime);
        if(!StringUtils.isEmpty(key)) {
            textLambdaQueryWrapper.like(Text::getName, key);
        }
        List<Text> list = textService.list(textLambdaQueryWrapper);
        PageInfo<Text> textPageInfo = new PageInfo<>(list, 5);
        return R.success(textPageInfo);
    }

}
