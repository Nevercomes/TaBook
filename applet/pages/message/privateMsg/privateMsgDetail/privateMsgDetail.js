// pages/message/privateMsg/privateMsgDetail/privateMsgDetail.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var userMsgs = [{
  avatarUrl: "../../../../static/images/me/avatar.png",
  time: "7:02",
  detail: "你好呀，这周周六（5.25)下午两点半在世纪楼前门，我把《黄金时代》交给你可以吗？"
}]
Page({
  data: {
    userMsgs: userMsgs
  },
  onLoad: function(options) {

  },
  onReady: function() {

  },
  onShow: function() {

  },

  onHide: function() {

  },

  onUnload: function() {

  },

  onPullDownRefresh: function() {

  },

  onReachBottom: function() {

  },

  onShareAppMessage: function() {

  }
})