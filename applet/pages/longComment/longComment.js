// pages/longComment/longComment.js
Page({

  data: {
    title:"平凡的世界，不平凡的人生",
    avatarUrl:"../../static/images/me/avatar.png",
    nickName:"Daisy",
    name:"平凡的世界",
    longcomment: "作者：申仙（来自豆瓣先入为主的思想真的很容易把人带偏，如果按照旁人推荐的顺序来读冯内古特，一定可以找到《时震》身上延续着《猫的摇篮》《冠军早餐》《五号屠场》们的荒诞不经、嬉笑怒骂。但我是从《囚鸟》开始的，便习惯性地将他想象成为以“我的一群朋友”开道的“伪自传体”，他在囚鸟中表现出的黑色幽默极有杀伤力地瞄准了整整的一代美国自由主义知识分子。那么在之后的阅读过程中，我就会时不时去贴合这种丑角的堕落历程——自命不凡的人往往深受痛苦，他们将要面临的死亡是另一大群人的狂欢，那么享受当下的快乐是自然且勇敢的表现，乐观的悲观主义者当是如此",
    time:"2019-05-25"
  },

  onLoad: function (options) {

  },
  tobookInfo:function(){
    wx.navigateTo({
      url: '../bookInfo/bookInfo',
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  },

  onReady: function () {

  },

  onShow: function () {

  },
  onHide: function () {

  },
  onUnload: function () {

  },
  onPullDownRefresh: function () {

  },


  onReachBottom: function () {

  },


  onShareAppMessage: function () {

  }
})