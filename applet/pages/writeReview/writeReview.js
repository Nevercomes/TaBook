// pages/writeReview/writeReview.js
const { $Toast } = require('../../dist/base/index');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    currentTab: 'tab1',
    tab1Hidden: false,
    tab2Hidden: true,
    noticeList: [
      "温馨提示：短评不可回复，长评可回复",
      "温馨提示：短评不可回复，长评可回复",
      "温馨提示：短评不可回复，长评可回复",
      "温馨提示：短评不可回复，长评可回复",
    ],
    currentNum:0,
  },

  //事件处理函数
  tab1Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: false,
      tab2Hidden: true,
    })
  },
  tab2Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: true,
      tab2Hidden: false,
    })
  },
  handleChange: function ({ detail }) {
    // console.log(detail.key)
    this.setData({
      currentTab: detail.key
    })
  },
  inputs1:function(e){
    // 获取输入框的内容
    var value = e.detail.value;
    console.log(value);
    // 获取输入框内容的长度
    var len = parseInt(value.length);
    console.log(len);
    if(len<=50){
      this.setData({
        currentNum: len
      })
    }
    else{
      $Toast({
        content: '最多50字哦~',
        type: 'warning'
      });
      return;
    }
  },
  inputs2: function (e) {
    // 获取输入框的内容
    var value = e.detail.value;
    console.log(value);
    // 获取输入框内容的长度
    var len = parseInt(value.length);
    console.log(len);
    if (len <= 200) {
      this.setData({
        currentNum: len
      })
    }
    else {
      $Toast({
        content: '最多200字哦~',
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