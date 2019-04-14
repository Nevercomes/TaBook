// pages/me/myUpload/changeMsg/changeMsg.js
const app = getApp()
Page({
  data: {
    oldMsg:"瘦身、成家、出国、吃天下",
    newMsg:"",
    inputNameVal:""
  },
  onLoad: function (options) {

  },
  inputnewMsg:function(e){
    this.setData({
      newMsg:e.detail.value
    })
  },

  submitMsgChange:function(e){
    console.log("form发生了提交事件，携带值为："+e.detail.value)
    let oldMsg = e.detail.value;

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

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})