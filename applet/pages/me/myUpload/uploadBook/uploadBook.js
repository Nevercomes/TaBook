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

    imgUrlsarr: [],
    operations: [{
      name: 'sellBook',
      value: "卖书"
    }, {
      name: 'borrowBook',
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
      inputMsgVal:"",
      score:""
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
      inputBookName: e.detail.value
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
  inputMsg:function(e){
    this.setData({
      inputMsgVal:e.detail.value
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
      score:2*(index+1)
    })
  },
  submitBookInfo: function(e) {
    var that = this;
    console.log(e.detail.value);
  },
  sumbitBtn: function(e) {
    
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