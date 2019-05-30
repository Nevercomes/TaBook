// pages/bookInfo/bookInfo.js
const { $Toast } = require('../../dist/base/index');
Page({

  /**
   * 页面的初始数据
   */
  data: {
      bookname:"《黄金时代》",
      authorname:"王小波",
      publishinghouse:"花城出版社",
      freebook:1,
      borrowedbook:1,
      score:9.2,
      userInfo: {},
      userComments: [
      {
          userAvatar: '../../static/images/me/avatar2.jpg',
          username: "MrIce",
          createTime: "2019-05-18",
          content: "黑色而幽默，特立而独行"
          
      },
      {
        userAvatar: '../../static/images/me/avatar.png',
        username: "Daisy",
        createTime: "2019-05-18",
        content: "就这么活着，每一天都是黄金时代"
      }
    ],
    borrowableList: [
      {
          userAvatar: '../../static/images/me/avatar.png',
          username: "Daisy",
          createTime: "2019-05-19",
          content: "希望你会喜欢这本书"
      },
      {
          userAvatar: '../../static/images/me/avatar3.png',
          username: "西瓜",
          createTime: "2019-05-21",
          content: "一把思考的匕首，扎进时代荒谬的肺中"
      }
    ]
  },

  //事件处理函数
  myFavorites:function(){
    $Toast({
      content: '成功加入我的收藏',
      icon: 'success'
    });
  },
  toWriteReview: function () {
    wx.navigateTo({
      url: '../writeReview/writeReview',
    })
  },
  toIHaveBook: function () {
    wx.navigateTo({
      url: '../iHaveBook/iHaveBook',
    })
  },
  more_click1:function(){
    wx.navigateTo({
      url: '../bookcomment/bookcomment',
    })
  },
  more_click2: function () {
    wx.navigateTo({
      url: '../borrowedlist/borrowedlist',
    })
  },

  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
 
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
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
  },
  getUserInfo: function (e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
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