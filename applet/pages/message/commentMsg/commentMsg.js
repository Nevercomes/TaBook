// pages/message/commentMsg/commentMsg.js
var comments=[{
  avatarUrl:"../../../static/images/me/avatar.png",
  nickName:"Daisy",
  time:"2019-05-24",
  detail:"《金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？"
},
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-05-24",
    detail: "《金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？"
  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-05-24",
    detail: "《金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？金粉世家》这部堪比红楼梦的著作，其中金燕西对于冷清秋的离去真的没有没有一丝的留恋吗？"
  }]
Page({
  data: {
    //comments: ['d', 'd', 'd', 'd', 'd'],
    comments:comments

  },
toCommentMsgDetail:function(){
wx.navigateTo({
  url: 'commentMsgDetail/commentMsgDetail',
  success: function(res) {},
  fail: function(res) {},
  complete: function(res) {},
})
},
  onLoad: function (options) {

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