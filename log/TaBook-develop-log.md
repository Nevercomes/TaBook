﻿### March

#### 3.19

1. 撰写概要的设计说明

#### 3.20

1. 继续完成设计说明概要
2. 设计他书基本数据表

### April
现阶段开发先不管网页的后台管理
#### 4.4
1. 更新了JedisCacheDao
2. 集成JWT实现微信小程序的登录、认证(授权与权限缓存后续进行)
3. 定义了返回的Result类型
4. 放弃使用JWT...写都写完了...JWT也是存在请求头里的...和sessionId保存在请求头里是一个样子的，那我为什么还要用它...它管理权限缓存那么麻烦

#### 4.5
1. 被Shiro折磨的好惨...
2. 关于数据过滤
    1. 书评（用户可以选择学校过滤，只看自己学校）与二级书籍信息不进行数据过滤
    2. 书籍实例，即能够发起的借、买的申请目标（就是我能看到的所有者）过滤本校
2. 关于权限有三种
    1. 登录：状态码：403 msg：need login 这是微信登录...不进行微信登录授权无法进入系统
    2. 实名认证：一些操作需要实名认证如：如发表评论、发起申请、查看他人信息等 状态码403 msg:need identify
    3. 对一些不属于自己学校的同学发起申请（通常这种情况不会出现，因为借书申请的信息在后台已经通过学校过滤）状态码403 msg:school forbidden

3. 处理Conflict 2019-4-6 00：30
#### 4.20
只是写了收藏书籍
#### 4.21
收藏长评

#### 4.25 - 4.26
1. 增加了标签和分类 删除了root当中的sort_seq字段
2. 添加root与分类的映射关系和instance与标签的映射关系
3. 添加了书籍信息单独查找的逻辑与用户添加书籍信息的逻辑

#### 4.29-4.30
1. fix some bug
2. 添加了studentId schoolId campusId为父级属性
3. 在一些studentId业务逻辑的地方不再使用createBy
4. add book favorite

#### 5.1
1. 完善了bookInfoAdd的逻辑 所有需要用到BookInfo的暂时放一放 （所有的都从数据库去查询肯定是不可能的...这样子速度太慢了，需要很多级的缓存）
2. 完善了borrowRecord的逻辑
3. 完善了buyRecord的逻辑

#### 5.4
**重要更新：**
1. 添加了对bookInfo的Redis二级缓存

2. 后续将添加对反射方法，在entity级别判断是否需要setBookInfo

#### 5.5
1. 在CrudService层对BookInfo进行注入
2. 对bookInfoAddService进行单例测试

#### 5.6
1. 完善了认证之后的逻辑操作
2. 去掉了campusId
3. 更改了权限模块