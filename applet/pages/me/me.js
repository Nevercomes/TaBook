// pages/me/me.js
const app = getApp()
Page({
  data: {
    motto: '快来描述一下你自己吧！',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    hasVerified: false,
    usergrades: "0"
  },
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  onLoad: function (options) {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserInfo: function (e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  bindUserVerified: function (e) {
    console.log(e.detail)
    wx.navigateTo({
      url: 'userverified/userverified',
      success: function (res) { }
    })
  },
  bindMyBorrow:function(){
    wx.navigateTo({
      url: 'myBorrow/myBorrow',
      duration:0
    })
  },
  bindMyBuy:function(){
    wx.navigateTo({
      url: 'myBuy/myBuy',
      duration:0
    })
  },
  bindMyUpLoad:function(){
    wx.navigateTo({
      url: 'myUpload/myUpload',
      duration:0
    })
  },
   bindMyFavorites:function(){
    wx.navigateTo({
      url: 'myFavorites/myFavorites',
      duration:0
    })

  },
  bindApplicationCentre:function(){
    wx.navigateTo({
      url: 'applicationCentre/applicationCentre',
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