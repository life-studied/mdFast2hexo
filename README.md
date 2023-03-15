# README

### 简介

> 一个快速将过往markdown笔记移植到hexoBlog下的框架

### 效果

* 自动为无hexo格式开头的markdown生成符合hexo的读取方式
* 不符合YAML格式文档会被保存到错误日志以便于更改
* 添加`<!--more-->`以提升Home阅读体验

Demo：[云隐的个人博客](life-studied.github.io)

### 依赖

* [Node.js (nodejs.org)](https://nodejs.org/zh-cn/download/)
* [Git](https://git-scm.com/downloads)
* hexo-enhancer插件（本框架已配置）

### 使用

#### 1.本地笔记直接使用

* 将你的笔记根目录的绝对路径复制
* 在`source/_posts/add.sh`中，将源地址改为你的笔记地址
* 在`gitbash`环境下运行`add.sh`脚本
* 错误信息日志地址：`source/log.txt`，正确的文件会被渲染

#### 2.远程仓库格式化使用

* 将远程仓库clone到本地
* 将shell目录下的rewrite.sh脚本复制到你的本地笔记仓库目录下
* 在gitbash环境下执行该脚本
* 剩下步骤与本地笔记使用一致

### 测试

> 在框架目录的gitbash下执行下面的命令：该命令会根据markdown笔记生成网页，并将其部署在本地4000端口，生成后你应当能在浏览器的`localhost:4000`下访问到该网页。

```shell
hexo g
hexo s
```

### 远程部署

* 推荐使用Github Page，详见hexo官网（注意：千万不要在访问你的*.github.io网站时使用加速器！）

### 注意

* 确保你的笔记文件树较为严格地划分了你的不同类别的笔记：本框架使用hexo-enhancer插件生成categories和tags。
* 主题默认采用icalm，客制化主题请访问hexo官网的theme页面
* 不要混用该框架与你自己原有的hexo博客，或是将脚本处理后的markdown文件复制到你的目录下，因为两者生成date的方式并不一致

### 其它配置

见hexo官网



