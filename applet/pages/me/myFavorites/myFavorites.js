// pages/me/myFavorites/myFavorites.js
const app = getApp();
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var books = [{
  "name": "平凡的世界",
  "time": "2019-04-20",
  "bookIntro": "这是一个平凡的世界,一群平凡的人却成就了不平凡的人生",
}, {
    "name": "平凡的世界",
    "time": "2019-04-20",
    "bookIntro": "这是一个平凡的世界,一群平凡的人却成就了不平凡的人生",
  }, {
    "name": "平凡的世界",
    "time": "2019-04-20",
    "bookIntro": "这是一个平凡的世界,一群平凡的人却成就了不平凡的人生,",
  }, {
    "name": "平凡的世界",
    "time": "2019-04-20",
    "bookIntro": "这是一个平凡的世界,一群平凡的人却成就了不平凡的人生,",
  }]
Page({

  data: {
    currentTab: 0,
    books: books
  },
  onLoad: function(options) {
    var that = this
    wx.getSystemInfo({
      success: function(res) {
        that.setData({
          clientHeight: res.windowHeight
        });
      }
    })
  loadBooks();
  },
  loadBooks:function(e){
    var that = this;
    wx.request({
      url: '',
      header:header,
      method:"POST",
      data:{
        books:[]
      },
      success(res){
        console.log(res.detail.value)
        var books = res.data.books;
        for(var i = 0;i<books.length;i++){
          var subject = books[i];
          var book = new Object;
          book.name = subject.name;
          book.imgUrl = subject.imgUrl;
          book.bookIntro = subject.bookIntro;
          books.push(book);
        }
        that.setData({
          books:books
        })
      },           
    })
  },
  clickTab: function(e) {
    console.log(e.detail.value)
    var that = this;
    if (that.data.currentTab == e.target.dataset.current) {
      return false;
    } else {
      that.setData({
        currentTab: e.target.dataset.current
      })
    }
  },
  swiperTab: function(e) {
    var that = this;
    console.log(e.detail.value)
    that.setData({
      currentTab: e.detail.value
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