// pages/me/applicationCentre/applicationCentre.js
var handlings = [ {
  "avatarUrl":"../../../static/images/me/avatar.png",
   "nickName": "Daisy",
    "school": "中南大学",
    "name": "平凡的世界",
    "operationOther": "待处理",
}, {
    "avatarUrl": "../../../static/images/me/avatar.png",
    "nickName": "Daisy",
    "school": "中南大学",
    "name": "平凡的世界",
    "operationOther": "待处理",
  }]
const app = getApp()
Page({
  data: {
    handlings:handlings,
    processing:0,
    pending:0,
    myTotalApplication:0,
    currentTab:0,
    myhandlings:['a','b','c','d','e','d','d','d'],
    school:"中南大学",
    name:"平凡的世界",
    operationOther:"待处理",
    operationMy:"未处理",
    disabled:false,
    userInfo:{}
  },
  onLoad: function (options) {
    var that = this;
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          clientHeight: res.windowHeight
        });
      }
    })
    if(app.globalData.userInfo){
      that.setData({
        userInfo:app.globalData.userInfo
      })
    }
    wx.request({
      url: '',
      header:header,
      data:{
        handlings:[],
        myhandlings:[]
      },
      success:res=>{
        that.setData({
          handlethis:res.data.handlethis,
          myhandlings:res.data.myhandlings
        })
      }
    })
  },

  clickTab:function(e){
    var that = this;
    if (that.data.currentTab == e.target.dataset.current) {
      return false;
    } else {
      that.setData({
        currentTab: e.target.dataset.current
      })
    }
  },
  swiperTab: function (e) {
    var that = this;
    console.log(e.detail.value)
    that.setData({
      currentTab: e.detail.value
    })
  },
  handlethis:function(){
wx.navigateTo({
  url: 'handleApplication/handleApplication',
  success: function(res) {},
  fail: function(res) {},
  complete: function(res) {},
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