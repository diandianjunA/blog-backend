package com.myproject.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myproject.blog.entity.Category;
import com.myproject.blog.service.CategoryService;
import com.myproject.blog.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author 17305
* @description 针对表【category】的数据库操作Service实现
* @createDate 2022-11-19 15:18:38
*/
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
    implements CategoryService{

}




