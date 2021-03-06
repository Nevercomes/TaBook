// pages/bookcomment/bookcomment.js
Page({
  data: {
    currentTab: 'tab1',
    commentNum:100,
    shortboxes:[
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
    tab1Hidden: false,
    tab2Hidden: true,
  },
  //事件处理函数
  handleChange: function ({ detail }) {
    // console.log(detail.key)
    this.setData({
      currentTab: detail.key
    })
  },
  //tab标签页事件
  tab1Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: false,
      tab2Hidden: true,
      tab3Hidden: true,
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