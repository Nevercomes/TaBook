// pages/me/userverified/userverified.js
Page({
  data: {
    inputNameVal:"",
    inputIdVal:"",
    inputStudentNumVal:"",
    inputSchoolVal:"",
    inputPhoneVal:""

  },
  inputTypingName:function(e){
    this.setData({
      inputNameVal:e.detail.value
    })
  },
  inputTypingSchool:function(e){
    this.setData({
      inputSchoolVal:e.detail.value
    })
  },
  inputTypingId:function(e){
    this.setData({
      inputIdVal: e.detail.value
    })    
  },
  inputTypingPhone:function(e){
      this.setData({
        inputPhoneVal: e.detail.value
      })
  },
  inputTypingStuNum:function(e){
    this.setData({
      inputStudentNumVal:e.detail.value
    })
  },
  submitInfo:function(e){
    console.log("form发生了提交事件，携带值为：",e.detail.value);
    let {inputNameVal,inputIdVal,inputSchoolVal,inputStudentNumVal,inputPhoneVal} = e.detail.value;

  },
  resetInfo:function(e){
    let { inputNameVal, inputIdVal, inputSchoolVal, inputStudentNumVal, inputPhoneVal } = ""
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