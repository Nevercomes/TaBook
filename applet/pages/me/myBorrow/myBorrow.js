// pages/me/myBorrow/myBorrow.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({
  data: {
    books: [{
      name: "平凡的世界",
      author: "路遥",
      press: "zndx",
      bookOwner: "pj",
      borrowTime: "2018",
      givebackTime: "323",
      operation: "我要还书"
    }],
    books: ['a', 'b', 'c', 'd', 'e'],
    books2: ['a', 'b', 'c', 'd', 'e'],
    totalborrow: 0,
    borrowing: 0,
    currentTab: 0,
    disabled: false,

  },
  handleChange: function ({
    detail
  }) {
    var that = this;
    console.log(detail.key)
    that.setData({
      currentTab: detail.key
    })
  },
  clickTab: function (e) {
    var that = this;
    if (that.data.currentTab === e.target.dataset.current) {
      return false;
    } else {
      that.setData({
        currentTab: e.target.dataset.current
      })
    }
  },
  swiperTab: function (e) {
    var that = this;
    console.log(e.detail.value)
    that.setData({
      currentTab: e.detail.value
    })
  },
  onLoad: function (options) {
    var that = this
    that.setData({
      totalborrow: that.data.books.length,
      borrowing: that.data.books2.length
    })
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          clientHeight: res.windowHeight
        });
      }
    })
    that.loadBooks();

  },
  loadBooks: function (e) {
    var that = this;
    wx.request({
      url: '',
      method: "POST",
      header: header,
      success: function (res) {
        var subjects = res.data.subjects;
        console.log(subjects);
        var books = new Array();
        for (var i = 0; i < subjects.length; i++) {
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
          books: books
        })
      }
    })
  },
  giveBackOperation: function (e) {
    var that = this;
    var index = e.currentTarget.dataset.index;
    console.log(index);
    var array = this.data.books;
    var array2 = this.data.books2;
    var index2 = array2.length
    wx.showModal({
      title: '提示',
      content: '确定要还书吗？',
      success: function (res) {
        if (res.confirm) {
          var b = array[index];
          array2.push(b);
          that.data.books.splice(index, 1);
          that.setData({
            books: that.data.books,
            borrowing: that.data.books.length,
            books2: array2,
            totalborrow: that.data.books2.length
          })
        } else if (res.cancel) {
          that.setData({

          })

        }
      }
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