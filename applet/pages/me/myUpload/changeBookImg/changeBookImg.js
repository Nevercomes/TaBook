// pages/me/myUpload/changeBookImg/changeBookImg.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    imgUrlsarr: []

  },

  onLoad: function(options) {

  },
  chooseImage: function(e) {
    var that = this;
    var imgurls = that.data.imgUrlsarr;
    wx.chooseImage({
      count: 3,
      sizeType: ['original', 'compressed'],
      sourceType: ['album', 'camera'],
      success: function(res) {
        console.log(res.tempFilePaths);
        that.setData({
          imgUrlsarr: that.data.imgUrlsarr.concat(res.tempFilePaths)
        })
      },
    })

  },
  deleteImg: function(e) {
    var that = this;
    var index = e.currentTarget.dataset.index;
    var image = that.data.imgUrlsarr;
    image.splice(index, 1);
    that.setData({
      imgUrlsarr: image
    })

  },
  submitBtn: function(e) {
    wx.navigateBack({

    })
  },
  submitBookImg: function(e) {
    console.log("form发生了提交事件，携带值为", e.detail.value)
    var that = this;
    for (var i = 0; i < that.data.imgUrlsarr; i++) {
      var imgUrl = that.imgurls.tempFilePaths[i];
      wx.uploadFile({
        url: '',
        filePath: imgUrl,
        name: 'file',
        header: header,
        method: 'POST',
        success(res) {
          var data = JSON.parse(res.data)
          if (data.code == 200) {
            console.log(data.detail.value)
          } else {
            console.log("上传失败")
            wx.showToast({
              title: '上传失败',
              icon: 'fail'
            })
          }
        }
      })
    }
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