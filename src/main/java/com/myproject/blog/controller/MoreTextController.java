package com.myproject.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myproject.blog.common.R;
import com.myproject.blog.entity.MoreText;
import com.myproject.blog.entity.Text;
import com.myproject.blog.service.MoreTextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/more")
@CrossOrigin
public class MoreTextController {

    @Autowired
    private MoreTextService moreTextService;

    /**
     * 获取分页的文章信息
     * @param pageNum 第几页
     * @param key 查询关键字
     * @return 分页数据
     */
    @GetMapping("/list")
    public R<PageInfo<MoreText>> list(Integer pageNum,String key){
        List<MoreText> list;
        //开启分页
        PageHelper.startPage(pageNum,6);
        LambdaQueryWrapper<MoreText> textLambdaQueryWrapper = new LambdaQueryWrapper<>();
        textLambdaQueryWrapper.orderByDesc(MoreText::getUpdateTime);
        if(!StringUtils.isEmpty(key)) {
            textLambdaQueryWrapper.like(MoreText::getName, key);
        }
        list = moreTextService.list(textLambdaQueryWrapper);
        PageInfo<MoreText> pageInfo = new PageInfo<>(list,5);
        return R.success(pageInfo);
    }
}
