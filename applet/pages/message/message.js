// pages/message/message.js
Page({
  data: {
    text:""

  },

  onLoad: function (options) {
    wx.setTabBarBadge({
      index: 1,
      text: text
    })
  },
  loadMsgItem:function(){
    var that = this;
    wx.request({
      url: '',
      method:"GET",
      data:{
        msgs:[]
      },
      success(res){
        
      },
    })
  },
  bindSystemMsg:function(){
 wx.navigateTo({
   url: 'systemMsg/systemMsg',
 })
  },
  bindPrivateMsg:function(){
wx.navigateTo({
  url: 'privateMsg/privateMsg',
})
  },
  bindThump_upMsg:function(){
    wx.navigateTo({
      url: "thump_upMsg/thump_upMsg",
    })
  },
  bindCommentMsg:function(){
wx.navigateTo({
  url: "commentMsg/commentMsg",
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