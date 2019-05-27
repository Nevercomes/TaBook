// pages/borrowedlist/borrowedlist.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    owners: 3,
    available:1,
    borrowableList: [
      {
          userAvatar: "../../static/images/me/avatar.png",
          username: "Daicy",
          comment: "就这么活着，每一天都是黄金时代",
          status: "空闲",
          returnTime: "等待借阅...",
          statusImg: "../../static/images/borrowList/borrow.png"

      },
      {
          userAvatar: "../../static/images/me/avatar3.png",
          username: "西瓜",
          comment: "一把思考的匕首，扎进时代荒谬的肺中",
          status: "外借",
          returnTime: "归还时间: 2019-06-21",
          statusImg: "../../static/images/borrowList/unborrow.png"
      },
      {
          userAvatar: "../../static/images/me/avatar1.jpg",
          username: "利威尔一米九",
          comment: "首先，它很有趣",
          status: "外借",
          returnTime: "归还时间: 2019-06-19",
          statusImg: "../../static/images/borrowList/unborrow.png"
      }
    ]
  },

  //事件处理函数
  iconClick:function(){
    wx.navigateTo({
      url: '../borrow/borrow',
    })
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