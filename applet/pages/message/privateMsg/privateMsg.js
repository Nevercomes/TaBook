// pages/message/privateMsg/privateMsg.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var privateMsgs = [{
  avatarUrl:"../../../static/images/me/avatar.png",
  nickName:"Daisy",
  time:"2019-04-24",
  content:"你好呀，我想要我想要向你借与《平凡的世界》可以吗？"
},
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？"
  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？"
  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？"
  },]
Page({
  data: {
    privateMsgs:privateMsgs,
   // privateMsgs:['a','s','s','s','s']
    showReadMark:false

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
  toPrivateMsgDetai:function(e){
    wx.navigateTo({
      url: 'privateMsgDetail/privateMsgDetail',
      duration:0
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