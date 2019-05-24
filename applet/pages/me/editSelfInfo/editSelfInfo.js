// pages/me/editSelfInfo/editSelfInfo.js
Page({
  data: {
    avatarUrl: "../../../static/images/me/avatar.png",
    inputNickNameVal: "",
    inputMottoVal: "",
    inputPhoneVal: ""
  },

  onLoad: function(options) {

  },
  inputNickName: function(e) {
    this.setData({
      inputNickNameVal: e.detail.value
    })
  },
  inputMotto: function(e) {
    this.setData({
      inputMottoVal: e.detail.value
    })
  },
  inputPhone: function(e) {
    this.setData({
      inputPhoneVal: e.detail.value
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

  onShareAppMessage: function() {

  }
})