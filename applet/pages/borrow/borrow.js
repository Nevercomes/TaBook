// pages/borrow/borrow.js
const { $Toast } = require('../../dist/base/index');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    bookname: "《高等数学》",
    authorname: "Alice",
    publishinghouse: "xx报社",
    freebook: 1,
    borrowedbook: 9,
    score: 9.0,
    currentNum: 0,

  },

  //事件处理函数
  inputs1: function (e) {
    // 获取输入框的内容
    var value = e.detail.value;
    console.log(value);
    // 获取输入框内容的长度
    var len = parseInt(value.length);
    console.log(len);
    if (len <= 50) {
      this.setData({
        currentNum: len
      })
    }
    else {
      $Toast({
        content: '最多50字哦~',
        type: 'warning'
      });
      return;
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
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