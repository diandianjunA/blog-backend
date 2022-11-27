package com.myproject.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myproject.blog.entity.MoreText;
import com.myproject.blog.service.MoreTextService;
import com.myproject.blog.mapper.MoreTextMapper;
import org.springframework.stereotype.Service;

/**
* @author 17305
* @description 针对表【more_text】的数据库操作Service实现
* @createDate 2022-11-23 10:26:29
*/
@Service
public class MoreTextServiceImpl extends ServiceImpl<MoreTextMapper, MoreText>
    implements MoreTextService{

}




