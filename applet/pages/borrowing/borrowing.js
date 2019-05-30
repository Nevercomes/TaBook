// pages/borrowing/borrowing.js
const { $Toast } = require('../../dist/base/index');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    head: '../../static/images/me/avatar.png',
    username:'Daicy',
    credit:480,
    sign:'首先，它很有趣',
    bookName:'《黄金时代》',
    bookAuthor:'王小波',
    bookPublish:'长江文艺出版社',
    period:'1年',
    message:'《黄金时代》是他的宠儿',
    currentNum: 0,

  },

  /**
   * 生命周期函数--监听页面加载
   */
  inputs: function (e) {
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
  btnClick: function () {
    wx.showModal({
      title: '提示',
      content: '确定借阅该书？',
      success: function (res) {
        if (res.confirm) {
          console.log("确定")
          $Toast({
            content: '成功发出申请',
            icon: 'success'
          });
        }
        else if (res.cancel) {
          console.log("取消")
        }
      }
    })

  },
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