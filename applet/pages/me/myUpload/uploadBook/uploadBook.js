// pages/me/myUpload/uploadBook/uploadBook.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var scoreimgUrls = [{
  'imgUrl': '../../../../static/images/me/star.png'
}, {
  'imgUrl': '../../../../static/images/me/star.png'
}, {
  'imgUrl': '../../../../static/images/me/star.png'
}, {
  'imgUrl': '../../../../static/images/me/star.png'
}, {
  'imgUrl': '../../../../static/images/me/star.png'
}]
Page({
  data: {
    searchBookVal: "",
    inputShowed: false,
    inputNameVal: "",
    inputAuthorVal: "",
    inputPressVal: "",
    inputScoreVal: "",
    inputPriceVal: "",
    inputPressYearVal:"",
    hidePrice: true,
    score: "",
    operation: "",
    bottom:40,
    addBookImg:"添加图片",
    imgUrlsarr: [],
    operations: [{
      name: '卖书',
      value: "卖书"
    }, {
      name: '借书',
      value: '借书',
      checked: 'true'
    }],
    scoreimgUrls: scoreimgUrls
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
      inputBookName: "",
      inputAuthorVal: "",
      inputPressVal: "",
      inputMsgVal: "",
      score: "",
      getScoreVal: ""
    })
  },
  inputTyping: function(e) {
    this.setData({
      searchBookVal: e.detail.value
    })
  },
  toSearchBook: function() {
    wx.navigateTo({
      url: 'searchBook/searchBook',
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
  inputBookName: function(e) {
    this.setData({
      inputNameVal: e.detail.value
    })
  },
  inputAuthor: function(e) {
    this.setData({
      inputAuthorVal: e.detail.value
    })
  },
  inputPress: function(e) {
    this.setData({
      inputPressVal: e.detail.value
    })
  },
  inputPressYear:function(e){
    this.setData({
      inputPressYearVal:e.detail.value
    })
  },
  inputMsg: function(e) {
    this.setData({
      inputMsgVal: e.detail.value
    })
  },
  inputPrice: function(e) {
    this.setData({
      inputPriceVal: e.detail.value
    })
  },
  bindgiveScore: function(e) {
    var that = this;
    var stars = new Array();
    var star = "";
    var index = e.currentTarget.dataset.index;
    var starlength = that.data.scoreimgUrls.length;
    console.log(index);
    console.log(that.data.scoreimgUrls)
    var star1 = '../../../../static/images/me/star.png';
    var star2 = '../../../../static/images/me/star-a.png';
    for (var i = 0; i < starlength; i++) {
      var star = new Object;
      if (index >= i) {
        star.imgUrl = star2;
        stars.push(star);
      } else {
        star.imgUrl = star1;
        stars.push(star);
      }
      console.log(star)
    }
    that.setData({
      scoreimgUrls: stars,
      getScoreVal: 2 * (index + 1)
    })
  },
  submitBookInfo: function(e) {
    var that = this;
    console.log(e.detail.value);
    console.log(that.data.score)
    console.log(that.data.operation)
    console.log(that.data.imgUrlsarr)
    wx.request({
      url: '',
      header: header,
      method: "POST",
      data: {
        name: e.detail.value.inputNameVal,
        author: e.detail.value.inputAuthorVal,
        press: e.detail.value.inputPressVal,
        msg: e.detail.value.inputMsgVal,
        score: that.data.score,
        operation: that.data.operation,
        price: e.detail.value.inputPriceVal,
        pressYear:e.detail.value.inputPressYearVal
      },
      success(res) {
        wx.showToast({
          title: '上传成功',
        })
        console.log(res.data)
      },
      fail(res){
        wx.showToast({
          title: '上传成功',
        })
        console.log(res.data)
      }
    })
  },
  radioChange: function(e) {
    var that = this;
    that.setData({
      operation: e.detail.value,
      getOperationVal: e.detail.value
    })
    if(e.detail.value=="卖书"){
      that.setData({
        hidePrice:false,
        bottom:0
      })
    }else{
      that.setData({
        hidePrice:true,
        bottom:40
      })
    }
    console.log(e.detail.value)
   
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