// pages/message/message.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    sysreadMark: false,
    privatereadMark: false,
    thump_upreadMark: false,
    commentreadMark: false,
    status1: 1,
    status2: 1,
    status3: 1,
    status4: 1
  },
  onLoad: function(options) {

  },

  bindSystemMsg: function() {
    var that = this;
    that.setData({
      status1: 0
    })
    that.readerList(that.data.status1)
    wx.navigateTo({
      url: 'systemMsg/systemMsg',
    })
  },
  bindPrivateMsg: function() {
    var that = this;
    that.setData({
      status2: 0
    })
    that.readerList(that.data.status2)
    wx.navigateTo({
      url: 'privateMsg/privateMsg',
    })

  },
  bindThump_upMsg: function() {
    var that = this;
    that.setData({
        status3: 0
      }),
      that.readerList(that.data.status3)
    wx.navigateTo({
      url: "thump_upMsg/thump_upMsg",
    })
  },
  bindCommentMsg: function() {
    var that = this;
    that.setData({
      status4: 0
    })
    that.readerList(that.data.status4)
    wx.navigateTo({
      url: "commentMsg/commentMsg",
    })
  },
  onReady: function() {

  },
  readerList: function(status) {
    wx.request({
      url: '',
      header: header,
      method: "POST",
      data: {
        page: status
      },
      success(res) {
        console.log(res.data)
      }
    })
  },
  onShow: function(e) {
    if (this.data.status1 == 0 && this.data.status2 == 0 && this.data.status3 == 0 && this.data.status4 == 0) {
      wx.hideTabBarRedDot({
        index: 1,
      })
    } else {
      wx.showTabBarRedDot({
        index: 1,
      })
    }
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