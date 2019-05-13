// pages/message/privateMsg/privateMsg.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    privateMsgs:['a','s','s','s','s']

  },

  onLoad: function (options) {
    var that = this;
    wx.request({
      url: '',
      header:header,
      data:{
        privateMsgs:[]
      },
      success(res){
        that.setData({
          privateMsgs:privateMsgs
        })
      }
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