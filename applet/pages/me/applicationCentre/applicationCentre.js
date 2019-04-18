// pages/me/applicationCentre/applicationCentre.js
const app = getApp()
Page({
  data: {
    processing:0,
    pending:0,
    currentTab:0,
    handlings:['a','b'],
    nickname:"Daisy",
    school:"中南大学",
    name:"平凡的世界",
    operation:"待处理"
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