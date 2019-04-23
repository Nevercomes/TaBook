// pages/me/userMotto/userMotto.js
Page({
  data: {
    inputMottoVal:""
  },

  onLoad: function (options) {

  },
  inputMotto: function (e) {
    this.setData({
      inputMottoVal: e.detail.value
    })
  },
  submtitFormInfo: function (e) {
    console.log(e.detail.value)
    var that = this;
    wx.request({
      url: '',
    })

  },
  bindSubmit: function (e) {

    var that = this;
    console.log(that.data.inputMottoVal)
    var pages = getCurrentPages();
    var prePage = pages[pages.length - 2];
    if(that.data.inputMottoVal.length>0){
    prePage.setData({
      motto: that.data.inputMottoVal
      })
      wx.navigateBack({

      })
    }else{
      wx.showModal({
        title: '请输入个性签名',
        content: 'error',
      })
    }
    
  },

  onReady: function () {

  },


  onShow: function () {

  },


  onHide: function () {

  },


  onUnload: function () {

  },

  onPullDownRefresh: function () {

  },

  onReachBottom: function () {

  },

  onShareAppMessage: function () {

  }
})