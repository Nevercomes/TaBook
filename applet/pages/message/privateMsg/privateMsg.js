// pages/message/privateMsg/privateMsg.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var privateMsgs = [{
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？",
    status: "1"
  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？", 
    status: "1"

  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？",
    status: "1"
  },
  {
    avatarUrl: "../../../static/images/me/avatar.png",
    nickName: "Daisy",
    time: "2019-04-24",
    content: "你好呀，我想要我想要向你借与《平凡的世界》可以吗？",
    status: "1"
  },
]
Page({
  data: {
    privateMsgs: privateMsgs,
  },
  onLoad: function(options) {
    var that = this;
    wx.request({
      url: '',
      header: header,
      data: {
        privateMsgs: []
      },
      success(res) {
        that.setData({
          privateMsgs: privateMsgs
        })
      }
    })
  },
  toPrivateMsgDetai: function(e) {
    var that = this;
    var index = e.currentTarget.dataset.index
    var status = "privateMsgs["+index+"].status"
    console.log(status)
    that.setData({
     [status]:0,
    })
    console.log(that.data.privateMsgs)
    wx.request({
      url: '',
      header: header,
      method: "POST",
      data: {
        status: status
      },
      success(res){
        console.log(res.data)
      }
    })
    wx.navigateTo({
      url: 'privateMsgDetail/privateMsgDetail',
      duration: 0
    })
  },

  onReady: function() {

  },
  onShow: function() {

  },
  deleteMsg: function(e) {
    var that = this;

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