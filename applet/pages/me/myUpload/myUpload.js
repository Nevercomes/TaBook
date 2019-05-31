// pages/me/myUpload/myUpload.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
Page({

  data: {
    totalUpLoad:2,
    // books:['a','b','c','d'],
    // books:['a','b'],
    books: [
      {
        name: "经济学通识",
        author: "薛兆丰",
        press: "北京大学出版社",
        price: 0,
        upLoadTime: "2019-05-24 17:21:33",
        borrowedCount: 0,
        status: "空闲"
      },
      {
        name: "时间的女儿",
        author: "八月长安",
        press: "长江文艺出版社",
        price: 0,
        upLoadTime: "2019-05-24 17:23:17",
        borrowedCount: 0,
        status: "空闲"
      }
    ],
    select:false,
    operation:"上架借书"
  },
  onLoad: function (options) {
    // var that = this;
    // wx.request({
    //   url: '',
    //   header:header,
    //   data:{
    //     books: []
    //   },
    //   success:function(res){
    //     var books = res.data.books;
    //     for(var i = 0;i<books.length;i++){
    //       var subject = books[i];
    //       var book = new Object;
    //       book.name = subject.name;
    //       book.author = subject.author;
    //       book.press = subject.press;
    //       book.price = subject.price;
    //       book.upLoadTime= subject.time;
    //       book.borrowedCount = subject.borrowedCount;
    //       book.status = subject.status;
    //       book.operation = subject.operation;
    //       books.push(book);
    //     }
    //     that.setData({
    //       books:books
    //     })
    //   }
      
    // })
    // that.setData({
      // totalUpLoad:that.data.books.length
    // })

  },
  bindShowMsg:function(e){
    this.setData({
      select:!this.data.select
    })

  },
  mySelect:function(e){
    var that = this;
    that.setData({
      operation :e.currentTarget.dataset.operation,
      select:false
    })
    wx.request({
      url: '',
      header:header,
      method:"POST",
      data:{
        operation:e.currentTarget.dataset.operation
      },
      success:function(){
        console.log("成功修改操作")
      },
      fail:function(){
        console.log("未修改操作")
      }

    })
  },
  bindChangeMsg:function(e){
    wx.navigateTo({
      url: "changeMsg/changeMsg",
      duration:0
    })
  },
  bindChangeBookImg:function(e){
    wx.navigateTo({
      url: 'changeBookImg/changeBookImg',
      duration:0
    })
  },
  uploadBook:function(){
    wx.navigateTo({
      url: 'uploadBook/uploadBook',
      duration:0
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