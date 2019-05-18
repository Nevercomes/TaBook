// pages/me/me.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
};
var util = require("../../utils/util.js")
Page({
  data: {
    avatarUrl:"../../static/images/me/avatar.png",
    nickName:" ",
    motto: '快来描述一下你自己吧！',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    hasVerified: false,
    userCreditPoints: 0,
    showEditMotto:false,
    showselfSignature:true
  },
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  onLoad: function (options) {
    var that = this; 
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true,
        nickName:userInfo.nickName,
        avatarUrl:userInfo.avatarUrl
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
            hasUserInfo: true,   
            nickName:res.userInfo.nickName       
          })
          var name ,photo,time;
          console.log(util.formatDate(new Date()))
          wx.request({
            url: '',
            header:header,
            method:"POST",
            data:{
              name:res.data.nickName,
              photo:res.data.avatarUrl,
              time:util.formatDate(new Date())
            },
            success:function(){
              console.log("suceess")
            },
            fail:function(){
              console.log("fail")
            }
          })
        },
      })
    }

  },
  getUserInfo: function (e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true,
      nickName: e.detail.userInfo.nickName,
      avatarUrl:e.detail.userInfo.avatarUrl
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
      // url: 'myUpload/myUpload',
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
  bindAuthenticaitonStatement:function(){
    wx.navigateTo({
      url: 'creditStatement/creditStatement',
      duration: 0
    })
  },
  bindCreditStatement:function(){
  wx.navigateTo({
    url: 'authenticaitonStatement/authenticaitonStatement',
    duration:0
  })
  },
  bindselfSignature:function(){
    wx.navigateTo({
      url: 'userMotto/userMotto',
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