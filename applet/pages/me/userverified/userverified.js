// pages/me/userverified/userverified.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
};
const { $Toast } = require('../../../dist/base/index');
Page({
  data: {
    inputNameVal: "",
    inputIdVal: "",
    inputStudentNumVal: "",
    inputSchoolVal: "",
    inputPhoneVal: ""

  },
  inputTypingName: function (e) {
    this.setData({
      inputNameVal: e.detail.value
    })
  },
  inputTypingSchool: function (e) {
    console.log(e.detail.value)
    this.setData({
      
    })
  },
  inputTypingId: function (e) {
    this.setData({
      inputIdVal: e.detail.value
    })
  },
  inputTypingPhone: function (e) {
    this.setData({
      inputPhoneVal: e.detail.value
    })
  },
  inputTypingStuNum: function (e) {
    this.setData({
      inputStudentNumVal: e.detail.value
    })
  },
  bindSchoolSelect: function (e) {
    console.log(e.detail.value),
      wx.navigateTo({
      url: 'schoolSelect/schoolSelect',

      })
  },
  submitFormInfo: function (e) {
    console.log("form发生了提交事件，携带值为：", e.detail.value)

    let {
      inputNameVal,
      inputIdVal,
      inputSchoolVal,
      inputStudentNumVal,
      inputPhoneVal
    } = e.detail.value;
    if (e.detail.value.name.length == 0 || e.detail.value.idcard.length == 0 || e.detail.value.school.length == 0 || e.detail.value.studentNumber.length == 0 || e.detail.value.phone == 0) {
    //   $Toast({
    //     content: '数据不能为空',
    //     type: 'warning'
    //   });
    //   return;
    // }
      wx.showToast({
        title: "数据不能为空",
        icon: "warning",
        duration: 3000
      })
      setTimeout(function () {
        wx.hideToast()
      }, 2000)}
     else {
      wx.request({
        url: '',
        header: header,
        method: "POST",
        data: {
          //e.detail.value
          name: e.detail.value.name,
          school: e.detail.value.school,
          idcard: e.detail.value.idcard,
          studentNumber: e.detail.value.studentNumber,
          phone: e.detail.value.phone
        },
        
        success: function (res) {
          console.log(res.data)
          if (res.data.status == 0) {
            wx.showToast({
              title: "认证失败",
              icon: "loading",
              duration: 1500
            })
          } else {
            var pages = getCurrentPages();
            var prePage = pages[pages.length - 2];
            prePage.setData({
              hasVerified: true
            })    
            wx.showToast({
              title: "认证成功",
              icon: "success",
              duration: 1000
            })
          }
        }
      })
    }
  },
  resetFormInfo: function (e) {
    let {
      inputNameVal,
      inputIdVal,
      inputSchoolVal,
      inputStudentNumVal,
      inputPhoneVal
    } = ""
  },

  onLoad: function (options) {

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