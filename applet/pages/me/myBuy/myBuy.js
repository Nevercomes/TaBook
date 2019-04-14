// pages/me/myBuy/myBuy.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    books: ['a', 'b', 'c', 'd', 'e'],
    totalBuy: 0
  },
  onLoad: function(options) {
    var that = this;
    //loadBooks();
    that.setData({
      totalBuy: that.data.books.length
    })
  },
  loadBooks: function(e) {
    var that = this;
    wx.request({
      method: "POST",
      header: header,
      success: function(res) {
        var subjects = res.data.subjects;
        var books = new Array();
        for (var i = 0; i < subjects.length; i++) {
          var subject = subjects[i];
          var book = new Object;
          book.id = subject.id;
          book.name = subject.name;
          book.author = subject.author;
          book.press = subject.press;
          book.owner = subject.owner;
          book.buyTime = subject.buyTime;
          book.price = subject.price;
          books.push(book)
        }
        that.setData({
          books: books
        })
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