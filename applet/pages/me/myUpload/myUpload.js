// pages/me/myUpload/myUpload.js
Page({

  data: {
    totalUpLoad:0,
    books:['a','b','c','d'],
    select:false,
    operation:"上架借书"
    
  },
  onLoad: function (options) {
    var that = this;
    that.setData({
      totalUpLoad:that.data.books.length
    })

  },
  bindShowMsg:function(e){
    this.setData({
      select:!this.data.select
    })

  },
  mySelect:function(e){
    var that = this;
    that.setData({
      operation :e.currentTarget.dataset.operation,
      select:false
    })
  },
  bindChangeMsg:function(e){
    wx.navigateTo({
      url: "changeMsg/changeMsg",
      duration:0
    })
  },
  bindChangeBookImg:function(e){
    wx.navigateTo({
      url: 'changeBookImg/changeBookImg',
      duration:0
    })
  },
  uploadBook:function(){
    wx.navigateTo({
      url: 'uploadBook/uploadBook',
      duration:0
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