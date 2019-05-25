// pages/message/privateMsg/privateMsgDetail/privateMsgDetail.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var userMsgs = [{
  avatarUrl: "../../../../static/images/me/avatar.png",
  time: "16:10",
  detail: "你好呀，我想要我想要向你借与《平凡的世界》可以吗?"
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