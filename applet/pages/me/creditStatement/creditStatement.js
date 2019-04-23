// pages/me/creditStatement/creditStatement.js
Page({
  data: {

  },
  
  onLoad: function (options) {

  },
  inputSignature:function(e){
    this.setData({
      inputSignatureVal:e.detail.value
    })
  },
  submitFormInfo:function(e){

  },
  bindSubmit:function(e){
    var that = this;
    var pages = getCurrentPage();
    var prePage = pages[pages.length-2];
  that.setData({
    
  })
    wx.navigateBack({
      
    })
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