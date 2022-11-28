# 工程简介


用于发布本人平时的学习笔记，同时也是我做了第一个web端的前后端分离项目。由于本人主学的是后端，前端代码写的很烂，而由于前端花费了我太多时间，所以后端的实现也相对简单。

项目已部署在腾讯云轻量级服务器上，访问url为：http://www.diandianjun.com.cn:8082/index.html

(移动端未做适配)

## 效果图

![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture1.png)

![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture2.png)

![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture3.png)

![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture4.png)

## 技术要点

本项目为springboot+vue的前后端分离项目，最终打包发布的方式是将前端的资源拷到后端的static文件夹下统一发布的（用了一些elementUI，但是后来我发现我还是不太会用就没有广泛使用，大部分还是我自己写的样式）

### 服务器上的静态资源开放

直接将静态资源放在服务器上，由前端通过请求来获取，这样可以方便地修改静态资源

- 第一步，开放Tomcat服务器的资源端口

  找到Tomcat的配置文件server.xml，在\<Host>\</Host>标签内加上

  ```xml
  <Context docBase="自己定义的静态资源文件夹" path="自己定义的资源接口请求" debug="0" reloadable="true" />
  ```

  例如我的：

  ```xml
  <Context docBase="/usr/local/img" path="/resource" debug="0" reloadable="true" />
  ```

  这时通过http://服务器ip:8080/接口名/文件夹下的资源名称即可访问到对应的静态资源，如：

  ![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture5.png)

- 第二步，开放Tomcat的跨域

  仅仅是开放了资源接口还不够，因为不管是前端项目在本地调试，还是部署到服务器上，肯定和Tomcat不是一个端口，所以要给Tomcat配置请求跨域

  找到Tomcat下的web.xml文件，在大概以下这个位置，加上这段代码

  ![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture6.png)

  ```xml
  <filter>
            <filter-name>CorsFilter</filter-name>
            <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>
            <init-param>
                  <param-name>cors.allowed.origins</param-name>
                  <param-value>*</param-value>
            </init-param>
      </filter>
      <filter-mapping>
            <filter-name>CorsFilter</filter-name>
            <url-pattern>/*</url-pattern>
      </filter-mapping>
  ```

  然后重启Tomcat，接下来就可以在前端，通过axios或src等请求方式获取到服务器上的静态资源，如图片，文章等

### 父子路由之间传值

本项目主要用到了两种传值方式，一种是类似于父组件向子组件传值一样，父路由通过给子路由设置属性，子路由用props接收

```html
<router-view :routerData="routerData" :key="timer"></router-view>
```

```javascript
props:["routerData"],
```

另一种是通过eventBus

子组件中设置一个方法出发传值事件

```javascript
import emitter from "@/store/eventBus";
show(){
  emitter.emit("event",this.content)
}
```

创建一个eventBus.js

```javascript
import mitt from 'mitt'
const emitter =mitt()
export default emitter
```

父组件的mounted方法中用变量接收

```javascript
mounted() {
  emitter.on("event",e=>{
    this.routerData=e
  })
},
```

这方法主要是孙子组件给祖父组件传值，由文章列表页面转换到文章内容页面，同时也告诉祖父组件要显示哪篇文章

### 路由刷新与缓存

给子路由加一个key属性，每次刷新给子组件的数据的时候，key也刷新，可以使得子组件重新渲染数据

```html
<router-view :routerData="routerData" :key="timer"></router-view>
```

```javascript
watch:{
  textList(newVal){
    this.routerData=newVal
    this.timer=new Date().getTime()
  }
},
```

在监听器中观察页面数据一改变，timer就发生改变，从而可以使组件重新渲染，渲染上去新的数据

```html
<keep-alive>
   <router-view></router-view>
</keep-alive>
```

在路由标签外包上一个新的标签，在回退时路由缓存会生效，显示原先的数据

### 分页插件

分页按钮样式自己写

![](http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/picture7.png)

上面的数字由向后端请求数据时一起发过来

```html
<div class="paging">
  <button class="pageButton" @click="prePage">
    <el-icon size="20" style="vertical-align: middle">
      <ArrowLeftBold />
    </el-icon>
  </button>
  <button class="pageButton" v-for="(item,index) in pageInfo.navigatepageNums" :key="index" @click="assignPage(item)">
    <el-icon size="20" style="vertical-align: middle">
      {{item}}
    </el-icon>
  </button>
  <button class="pageButton" @click="nextPage">
    <el-icon size="20" style="vertical-align: middle">
      <ArrowRightBold />
    </el-icon>
  </button>
</div>
```

后端引入pageHelper

```xml
<dependency>
  <groupId>com.github.pagehelper</groupId>
  <artifactId>pagehelper-spring-boot-starter</artifactId>
  <version>1.4.5</version>
</dependency>
```

配置分页插件
```yaml
# 配置分页插件
pagehelper:
  helper-dialect: mysql
  reasonable: true
  support-methods-arguments: true
```

在查询方法前

```java
PageHelper.startPage(这是第几页,每页多少条数据);
```

查询完后

```java
PageInfo<Text> pageInfo = new PageInfo<>(查询的结果list,导航栏总共显示多少页);
```

得到的PageInfo对象可直接返回给前端

PageInfo的属性

```java
//当前页
private int pageNum;
//每页的数量
private int pageSize;
//当前页的数量
private int size;
//总页数
private int pages;
//第一页
private int firstPage;
//上一页
private int prePage;
//下一页
private int nextPage;
//总记录数
private long total;

//由于startRow和endRow不常用，这里说个具体的用法
//可以在页面中"显示startRow到endRow 共size条数据"
//当前页面第一个元素在数据库中的行号
private int startRow;
//当前页面最后一个元素在数据库中的行号
private int endRow;

//结果集
private List<T> list;
 
//是否为第一页
private boolean isFirstPage = false;
//是否为最后一页
private boolean isLastPage = false;
//是否有前一页
private boolean hasPreviousPage = false;
//是否有下一页
private boolean hasNextPage = false;
//导航页码数
private int navigatePages;
//所有导航页号
private int[] navigatepageNums;
//导航条上的第一页
private int navigateFirstPage;
//导航条上的最后一页
private int navigateLastPage;
```

查询结果，分页数据全在里面

### v-md-editor

要想博客文章在网页上显示出markdown文件的效果，需要借助v-md-editor

可以直接到v-md-editor的官网上搜索文档查看

https://code-farmer-i.github.io/vue-markdown-editor/zh/examples/base-editor.html

- 在 vue3 中引入

```javascript
import { createApp } from 'vue';
import VMdEditor from '@kangc/v-md-editor';
import '@kangc/v-md-editor/lib/style/base-editor.css';
import githubTheme from '@kangc/v-md-editor/lib/theme/github.js';
import '@kangc/v-md-editor/lib/theme/style/github.css';

// highlightjs
import hljs from 'highlight.js';

VMdEditor.use(githubTheme, {
  Hljs: hljs,
});

const app = createApp(/*...*/);

app.use(VMdEditor);
```
- 使用

```html
<template>
  <v-md-editor v-model="text" height="400px"></v-md-editor>
</template>

<script>
export default {
  data() {
    return {
      text: '',
    };
  },
};
</script>
```
### 项目部署

将前端项目用命令打包得到dist文件夹

```linux
npm run build
```

将dist文件夹下的所有目录拷贝到后端项目的resource/static/文件夹下

后端在webMvc配置类下配置静态资源映射，使得URL能够访问带静态资源目录

```java
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {
    /**
     * 设置静态资源映射
     * @param registry
     */
    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
    }
}
```

如果有拦截器过滤器之类的，记得给静态资源放行

然后后端项目用maven打包，得到jar包，传到服务器上

后续与springboot项目部署相同

- 暂时部署

```linux
java -jar xxx.jar
```

- 永久部署

```linux
nohup java -jar xxx.jar &> xxx.log &
```

- 停止

1. 查看运行项目及端口号

   ```linux
   ps -ef | grep xxx.jar
   ```

2. 关闭端口对应的服务

   ```linux
   kill -9 端口号
   ```

3. 删除项目jar包

   ```linux
   rm -f path/xxx.jar
   ```


