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
}];
var comments = [{
  "bookUrl": "../../../static/images/home/book2.jpg",
  "title": "平凡的世界，不平凡的人生",
  "nickName": "Daisy",
  "time": "2019-04-21",
  "name": "金粉世家",
  "longcomment": "Aliquam vitae felis a massa ultrices tincidunt. Aliquam aliquam iaculis risus sed maximus.",
  "likeCounts": 100
}, {
  "bookUrl": "../../../static/images/home/book2.jpg",
  "title": "平凡的世界，不平凡的人生",
  "nickName": "Daisy",
  "time": "2019-04-21",
  "name": "金粉世家",
  "longcomment": "Aliquam vitae felis a massa ultrices tincidunt. Aliquam aliquam iaculis risus sed maximus.",
  "likeCounts": 100
}, {
  "bookUrl": "../../../static/images/home/book2.jpg",
  "title": "平凡的世界，不平凡的人生",
  "nickName": "Daisy",
  "time": "2019-04-21",
  "name": "金粉世家",
  "longcomment": "Aliquam vitae felis a massa ultrices tincidunt. Aliquam aliquam iaculis risus sed maximus.",
  "likeCounts": 100
}, {
  "nickname": "Daisy",
  "time": "2019-04-21",
  "name": "金粉世家",
  "commentIntro": "Aliquam vitae felis a massa ultrices tincidunt. Aliquam aliquam iaculis risus sed maximus.",
  "likeCounts": 100
}]
Page({

  data: {
    currentTab: 0,
    books: books,
    comments: comments
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
    loadComments();
  },
  loadBooks: function(e) {
    var that = this;
    wx.request({
      url: '',
      header: header,
      data: {
        books: []
      },
      success: res => {
        console.log(res.detail.value)
        var books = res.data.books;
        for (var i = 0; i < books.length; i++) {
          var subject = books[i];
          var book = new Object;
          book.name = subject.name;
          book.imgUrl = subject.imgUrl;
          book.bookIntro = subject.bookIntro;
          books.push(book);
        }
        that.setData({
          books: books
        })
      },
    })
  },
  loadComments: function(e) {
    var that = this;
    wx.request({
      url: '',
      method: "POST",
      header: header,
      data: {
        comments: []
      },
      success(res) {
        var subjects = res.data.comments;
        for (var i = 0; i < subject.length; i++) {
          var subject = subjects[i];
          var comment = new Object;
          comment.time = subject.time;
          comment.name = subject.name;
          comment.commentIntro = subject.commentIntro;
          comment.likeCount = subject.likeCount;
          comments.push(comment);
        }
        that.setData({
          comments: comments
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
  toBookDetail: function() {
    wx.navigateTo({
      url: '../../bookInfo/bookInfo',
      duration: 0
    })

  },
  commentDetail: function() {
    wx.navigateTo({
      url: '',
      duration: 0
    })
  },
  tolongCommentDetail:function(){
wx.navigateTo({
  url: '../../longComment/longComment',
  success: function(res) {},
  fail: function(res) {},
  complete: function(res) {},
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