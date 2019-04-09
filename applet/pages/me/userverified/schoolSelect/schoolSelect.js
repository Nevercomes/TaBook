// pages/me/userverified/schoolSelect/schoolSelect.js
const app = getApp()
Page({

  data: {
    schoolSelectVal:"",
    inputShowed:false
  },
  inputTyping:function(e){
    console.log(e.detail.value)
  },
  schoolSelect:function(e){
    console.log(e.target.dataset);
    var school = e.target.dataset;
    var text = school.text;
    this.setData({
      schoolSelectVal:text
    })

  },
  onLoad: function (options) {

  },
  onReady: function () {

  },
  onShow: function () {

  },


  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})