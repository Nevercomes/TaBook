// pages/me/myUpload/uploadBook/searchBook/searchBook.js
Page({
  data: {
    searchBookVal: "",
    showHotBooks: false,
    hotBooks: ['a', 'd'],
    bookResult: null,
    books: [{
      "name": "平凡的世界",
      "namePY": "pingfandeshijie"
    }, {
      "name": "大秦帝国",
      "namePY": "daqindiguo"
    }, {
      "name": "金粉世家",
      "namePY": "jinfenshijia"
    }, {
      "name": "巴菲特传",
      "namePY": "bafeitezhuan"
    }]
  },
  inputTyping: function(e) {
    console.log(e.detail.value)
    var that = this;
    that.setData({
      searchBookVal: e.detail.value
    });
    wx.pageScrollTo({
      scrollTop: 0,
      duration: 0
    })
    var searchBookVal = e.detail.value;
    var books = that.data.books;
    var searchBookTemp = new Array();
    for (let i = 0; i < books.length; i++) {
      if (books[i].name.indexOf(searchBookVal) == 0 || books[i].namePY.indexOf(searchBookVal.toLowerCase()) == 0) {
        var ifHas = false;
        for (let j = 0; j < searchBookTemp.length; j++) {
          if (searchBookTemp[j] == books[i]) {
            ifHas = true;
            break;
          }
          if (!ifHas) {
            searchBookTemp.push(books[i]);
          }
        }
      }
    }
    console.log(searchBookTemp)
    that.setData({
      bookResult: searchBookTemp
    })
  },
  searchClear: function() {
    var that = this;
    that.setData({
      searchBookVal: ""
    })
  },
  bookSelect: function(e) {
    console.log(e.detail.value)
  },

  startSearch: function() {
    this.setData({
      bookResult: ['a', 'd','d','d','d','d']
    })
  },
  toBookInfo:function(){
wx.navigateTo({
  url: '../../../../bookInfo/bookInfo',
  success: function(res) {},
  fail: function(res) {},
  complete: function(res) {},
})
  },
  onLoad: function(options) {

  },
  onReady: function() {

  },

  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})