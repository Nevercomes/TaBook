// pages/message/thump_upMsg/thump_upMsg.js

const app = getApp();
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
   favorites:['a','d','d','d','d']
  },
  onLoad: function (options) {
    wx.request({
      url: '',
      header:header,
      method:"POST",
      data:{
        favorites:[]
      },
      success(res){
        
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

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },


  onReachBottom: function () {

  },

  onShareAppMessage: function () {

  }
})