// pages/iHaveBook/iHaveBook.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    bookname: "《高等数学》",
    authorname: "Alice",
    publishinghouse: "xx报社",
    freebook: 1,
    borrowedbook: 9,
    score: 9.0,

  },

  /**
   * 生命周期函数--监听页面加载
   */
  //事件处理函数
  btnClick:function(){
    wx.showModal({
      title: '提示',
      content: '确定上传该书？',
      success:function(res){
        if(res.confirm){
          console.log("确定")
          wx.showToast({
            title: '成功',
            icon:'success',
            duration:2000
          })
        }
        else if(res.cancel){
          console.log("取消")
        }
      }
    })

  },
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})