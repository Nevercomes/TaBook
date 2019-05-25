// pages/me/editSelfInfo/editSelfInfo.js
const app = getApp()
const Cookie = wx.getStorageSync("Cookie")
let header= {
  "Cookie":Cookie,
  "content-type":"application/x-www-form-urlencoded"
}
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
  uploadAvatar: function(e) {
    var that = this;
    var avatarUrl = that.data.avatarUrl;
    wx.chooseImage({
      count:1,
      sizeType:['original','compressed'],
      sourceType:['album','camera'],
      success: function(res) {
        console.log(res.tempFilePaths)
        that.setData({
          avatarUrl:res.tempFilePaths
        })
      },
    })
  },
  submitForm:function(e){
    var that = this;
    var avatarUrl = that.data.avatarUrl.toString();
    console.log(avatarUrl)
    console.log("form发生了提交事件，携带值为",e.detail.value)
    wx.request({
      url: '',
      header:header,
      method:"POST",
      data:{
        nickname:that.data.inputNickNameVal,
        motto:that.data.inputMottoVal,
        phone:that.data.inputPhoneVal,
        avatarUrl:that.data.avatarUrl
      },
      success(res){
        console.log(res.data)
      }
    }),
    wx.uploadFile({
      url: '',
      header:header,
      method:"POST",
      filePath: avatarUrl,
      name: 'file',
      success(res){
        var data = JSON.parse(res.data)
        if(data.code==200){
          console.log("上传成功")
        }else{
          console.log("上传失败")
        }
      }
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