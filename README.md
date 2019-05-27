#### Introduction


#### Technical Selection

技术栈选型

1 小程序端

2 后台环境

- Java SDK 8
- Servlet 3.0
- Apache Maven 3.x

3 后台主框架 

- 核心框架 Spring Framework 4.1
- 安全框架 Apache Shiro 1.2
- 视图层框架 Spring MVC 4.1
- 缓存框架 Redis 2.5

4 后台持久层

- Apache MyBatis 3.2.8
- Hibernate Validation 5.2
- Alibaba Druid 1.0
- MySQL 5.7

5 工具类

- 日志 SLF4J 1.7、Log4j
- 其它 略

5 后台视图层

- 略

6 安全考虑

- 分层设计：（数据库层，数据访问层，业务逻辑层，展示层）层次清楚，低耦合，各层必须通过接口才能接入并进行参数校验（如：在展示层不可直接操作数据库），保证数据操作的安全。
- 双重验证：用户表单提交双验证：包括服务器端验证及客户端验证，防止用户通过浏览器恶意修改（如不可写文本域、隐藏变量篡改、上传非法文件等），跳过客户端验证操作数据库。
- 安全编码：用户表单提交所有数据，在服务器端都进行安全编码，防止用户提交非法脚本及SQL注入获取敏感数据等，确保数据安全。
- 强制访问：系统对所有管理端链接都进行用户身份权限验证，防止用户

7 服务器部署

- 部署容器 Docker 1.1
- Docker-Image nginx:latest
- Docker-Image tomcat:8.5-jre8
- Docker-Image MySQL:5.7
- Docker-Image Redis 

*8 预备的分布式架设选型

- 消息队列 ActiveMQ 5

