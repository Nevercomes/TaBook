// pages/me/myUpload/changeMsg/changeMsg.js
const app = getApp()
Page({
  data: {
    oldMsg: "瘦身、成家、出国、吃天下",
    newMsg: "",
  },
  onLoad: function(options) {

  },
  inputnewMsg: function(e) {
    this.setData({
      newMsg: e.detail.value
    })
  },

  submitMsgChange: function(e) {
    var that = this;
    var pages = getCurrentPages();
    var prePage = pages[pages.length - 2];
    console.log("form发生了提交事件，携带值为：", e.detail.value)
    wx.request({
      url: '',
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: "POST",
      data: {
        message: e.detail.value.newMsg
      },
      success: function(res) {
        console.log("message已提交")
        that.setData({})
      }
    })

  },
  bindSure: function() {
    wx.navigateBack({

    })
  },
  onReady: function() {

  },
  onShow: function() {

  },
  onHide: function() {

  },
  onUnload: function() {

  },
  onPullDownRefresh: function() {

  },

  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})