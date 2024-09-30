# 健康管理系统说明文档
本项目从[AIJavaGroup/project](https://gitee.com/AIJavaGroup/project)转载，归属于[AIJavaGroup](https://gitee.com/AIJavaGroup)。用于练习使用docker。使用方法见[docker学习笔记](https://strangersinsist.github.io/2024/09/25/docker%E5%AD%A6%E4%B9%A0/#more)
## 概述

健康管理系统旨在为用户提供一个全面的健康监测和管理平台，通过一系列功能模块帮助用户维护和提升自己的健康水平。

## 核心功能模块

1. **登录**：支持用户通过验证数据库中的信息进行登录。系统中也设有管理员账户，用于进行高级管理操作。
2. **注册**：允许新用户通过填写必要信息，将用户数据新增至数据库中。
3. **主页**：主页面集成了走马灯、热量查询表和健康咨询对话框。用户可以在对话框中提出健康相关问题。
4. **运动知识**：此模块展示了一系列的运动知识信息卡片。
5. **健康购物**：包含一个专门的运动商品商城，用户可以点击链接跳转以购买健康商品。
6. **评估与建议**：系统根据用户上传的个人健康信息进行综合分析，并提供个性化的健康建议。
7. **健康信息上传**：用户可以上传自己的健康信息，如身高、体重、血压等，以便系统进行分析和建议。
8. **用户管理**：管理员使用该模块对用户信息进行维护，包括编辑、新增或删除用户数据。
9. **设置**：允许用户个性化配置自己的个人信息。
10. **健康问答**：用户可以在此模块提出健康问题，系统会提供答案和建议。



## 技术栈

为实现健康管理系统，我们采取了一种现代化的前后端分离架构，确保了高效的开发流程和流畅的用户体验。以下是我们选用的关键技术和工具：

### 前端技术

- **Vue.js**：作为一个渐进式JavaScript框架，Vue.js被用于创建高效、灵活的用户界面。它的组件化架构让我们能够重用代码并加快开发速度。
- **Element-Plus**：基于Vue 3的桌面端组件库，提供了一套丰富的UI组件，帮助我们在保持界面美观的同时，减少了开发和设计的工作量。

### 后端技术

- **Spring Boot**：简化了基于Spring的应用开发过程，使得我们能够快速搭建和部署微服务。Spring Boot自动配置的特性大幅度减轻了配置工作，让我们能够专注于业务逻辑的实现。
- **MyBatisPlus**：它是一个支持定制SQL、存储过程以及高级映射的持久层框架。MyBatis消除了几乎所有的JDBC代码，并手动设置参数以及获取结果集。通过简单的XML或注解，我们能够将接口映射成数据库中的记录。MybatisPlus在此基础上进行了升级，使用它时不用配置xml文件，更加高效简洁。
- **Lombok**：一个Java库，通过使用注解，能够自动化生成模板代码，如getters、setters、constructors等。Lombok极大地简化了我们的Java代码，使得它更加简洁易读。

### 数据库管理

- **MySQL**：我们选择MySQL作为后端数据库，借助其强大和广泛支持的特性来存储应用数据。
- **Navicat**：作为一款强大的数据库管理工具，Navicat让数据库的管理变得轻松便捷。它不仅支持MySQL，还支持大量其它数据库，提供直观的GUI方便进行数据管理、开发和维护。


## 参考资料

为了更好地理解和学习如何构建一个基于Spring Boot和Vue的前后端分离健康管理系统，以下我们使用的是一些推荐的参考资料和教程：


- **带你从0搭建一个Springboot+vue前后端分离项目**：[访问](https://www.bilibili.com/video/BV14y4y1M7Nc/)这个哔哩哔哩上的视频教程提供了一个循序渐进的过程，展示如何从零开始搭建一个基于Spring Boot和Vue的前后端分离项目。它是学习这一技术栈的有价值资源。

- **一个 Vue 3 UI 框架 | Element Plus**：[访问](https://element-plus.org/)可以了解更多关于Element Plus的信息，这是一个为Vue 3设计的UI框架，提供了丰富的组件，帮助开发者快速构建高效美观的用户界面。

-  **SpringBoot+Vue个人健康管理系统 Java毕业设计**：[访问](https://www.bilibili.com/video/BV1Xx421Q7df/)这个哔哩哔哩上的教程展示了如何构建一个个人健康管理系统，包括系统需要实现的功能和相关技术的详细介绍。相关的源代码已经上传至Gitee仓库[访问](https://gitee.com/JavaGroup/health_management)。这为有意开发类似项目的开发者提供了直观的示例和参考，有助于理解如何将教程中所述技术应用到实际的项目中。

## 启动项目

1. `git clone https://gitee.com/AIJavaGroup/project.git`，在idea中打开项目，加载必要的依赖（如maven）

2. 打开数据库，以navicat为例，新建连接，新建查询，将sql粘贴上去运行，得到两个表格。

3. 根据你数据库的信息更改`application.properties`中配置：
```
spring.datasource.url = jdbc:mysql://localhost:3306/health?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC
spring.datasource.username = root
spring.datasource.password = 123456
```

4. 按照如图进行运行配置
![](https://gitee.com/AIJavaGroup/project/raw/master/health_manage_vue/src/assets/springboot.png)
![](https://gitee.com/AIJavaGroup/project/raw/master/health_manage_vue/src/assets/vue.png)

分别点击两个运行，待启动完成后点击serve终端的` http://localhost:8080/ 
`即可