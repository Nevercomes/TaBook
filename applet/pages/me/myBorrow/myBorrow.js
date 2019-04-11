// pages/me/myBorrow/myBorrow.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    totalborrow:0,
    borrowing:0,
    currentTab: 0,
    books:[],
  },
  handleChange: function ({ detail }) {
    var that = this;
    console.log(detail.key)
    that.setData({
      currentTab: detail.key
    })
  },
  clickTab:function(e){
    var that = this;
    if(this.data.currentTab===e.target.dataset.current){
      return false;
    }else{
      that.setData({
        currentTab:e.target.dataset.current
      })
    }
  },
  swiperTab:function(e){
    var that = this;
    console.log(e.detail.value)
    that.setData({
      currentTab:e.detail.value
    })
  },
  onLoad: function (options) {
    var that = this;
    that.loadBooks();
  },
  loadBooks:function(e){
    var that = this;
    wx.request({
      url: '',
      method:"POST",
      header:header,
      success:function(res){
        var subjects = res.data.subjects;
        console.log(subjects);
        var books = new Array();
        for(var i = 0;i<subjects.length;i++){
          var subject = subjects[i];
          var book = new Object;
          book.name = subject.name;
          book.author = subject.author;
          book.owner = subject.owner;
          var subject = subjects[i];
          var book = new Object;
          book.id = subject.id;
          book.name = subject.name;
          book.author = subject.author;
          book.press = subject.press;
          book.owner = subject.owner;
          book.borrowTime = subject.time;
          books.push(book)
        }
        that.setData({
          books:books
        })
      }
    })
  },
  giveBackBook:function(e){
    this.setData({
      operation:""
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