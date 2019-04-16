//index.js
//获取应用实例
const WXAPI = require('../../wxapi/main.js')
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}


Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    inputShowed:false,//是否显示搜索框
    inputVal:"",//搜索框内容

    autoplay:true,
    interval:3000,
    duration: 1000,
    indicatorDots:false,
    circular:true,
    imgUrls:[
      '../../static/images/home/book1.jpg',
      '../../static/images/home/book2.jpg',
      '../../static/images/home/book3.jpg',
    ],
    swiperCurrent: 0,
    currentTab:'tab1',
    goods:[
      'a',
      'b',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
    ],
    tab1Hidden:false,
    tab2Hidden:true,
    tab3Hidden:true,

  },

  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  //搜索框事件
  showInput: function () {
    this.setData({
      inputShowed: true
    });
  },
  hideInput: function () {
    this.setData({
      inputVal: "",
      inputShowed: false
    });
  },
  clearInput: function () {
    this.setData({
      inputVal: ""
    });
  },
  inputTyping: function (e) {
    this.setData({
      inputVal: e.detail.value
    });
  },
  //轮播图事件
  swiperchange: function (e) {
    //console.log(e.detail.current)
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  //tab标签页事件
  toBookInfoTap: function () {
    wx.navigateTo({
      url: '../bookInfo/bookInfo',
      duration: 0
    })
  },
  handleChange:function({detail}){
    // console.log(detail.key)
    this.setData({
      currentTab: detail.key
    })
  },
  tab1Click:function(e){
    // console.log(e.detail)
    this.setData({
      tab1Hidden:false,
      tab2Hidden:true,
      tab3Hidden:true,
    })
  },
  tab2Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: true,
      tab2Hidden: false,
      tab3Hidden: true,
    })
  },
  tab3Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: true,
      tab2Hidden: true,
      tab3Hidden: false,
    })
  },
  onLoad: function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
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
    this.testSession();
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  testSession: function() {
    // 权限测试
    wx.request({
      url: 'http://localhost:8080/tabook/a/index',
      header: header,
      data: {
        data: 'Hello world!'
      },
      success(res) {
        console.log(res.data)
      },
      fail(xhr) {
        // console.log(xhr.msg)
      }
    })
  }
})
