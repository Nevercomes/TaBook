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
      '../../static/images/home/book4.jpg',
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
    star1: '../../static/images/home/star.png',
    star2: '../../static/images/home/star.png',
    star3: '../../static/images/home/star.png',
    star4: '../../static/images/home/star.png',
    star5: '../../static/images/home/star.png',
    score:4,
    price:999,
    available:3,
    total:100,
  },

  //事件处理函数
  iconClick:function(){
    wx.navigateTo({
      url: '../borrowedlist/borrowedlist',
    })
  },
  toDetailsTap:function(){
    wx.navigateTo({
      url:'../bookInfo/bookInfo'
    })
  },
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
  //tab标签页事件
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
    // console.log(this.data.score);
    if(this.data.score < 1) {
      this.setData({
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star。png',
      })
    }
    else if (this.data.score < 2) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 3) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 4) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star-a.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 5) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star-a.png',
        star4: '../../static/images/home/star-a.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score == 5) {
      this.setData({
      star1: '../../static/images/home/star-a.png',
      star2: '../../static/images/home/star-a.png',
      star3: '../../static/images/home/star-a.png',
      star4: '../../static/images/home/star-a.png',
      star5: '../../static/images/home/star-a.png',
      })
      
    }
  },
  onReady: function () {
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


