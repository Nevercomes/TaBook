// pages/me/myUpload/uploadBook/uploadBook.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    searchBookVal: "",
    inputShowed: false,
    imgUrlsarr: []
  },
  onLoad: function(options) {

  },
  showInput: function() {
    this.setData({
      inputShowed: true
    })
  },
  clearInput: function() {
    this.setData({
      searchBookVal: "",
      inputShowed: false,
      inputBookName:"",
      inputAuthorVal:"",
      inputPressVal:"",
      inputScoreVal:"",
    })
  },
  inputTyping: function(e) {
    this.setData({
      searchBookVal: e.detail.value
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
  inputBookName:function(e){
    this.setData({
      inputBookName:e.detail.value
    })
  },
  inputAuthor:function(e){
    this.setData({
      inputAuthorVal:e.detail.value
    })
  },
  inputPress:function(e){
    this.setData({
      inputPressVal:e.detail.value
    })
  },
  inputScore:function(e){
    this.setData({
      inputScoreVal:e.detail.value
    })
  },
  submitBookInfo: function() {

  },
  sumbitBtn: function() {

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