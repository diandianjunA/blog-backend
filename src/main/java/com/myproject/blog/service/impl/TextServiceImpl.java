package com.myproject.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myproject.blog.entity.Text;
import com.myproject.blog.service.TextService;
import com.myproject.blog.mapper.TextMapper;
import org.springframework.stereotype.Service;

/**
* @author 17305
* @description 针对表【text】的数据库操作Service实现
* @createDate 2022-11-19 15:06:50
*/
@Service
public class TextServiceImpl extends ServiceImpl<TextMapper, Text>
    implements TextService{

}




