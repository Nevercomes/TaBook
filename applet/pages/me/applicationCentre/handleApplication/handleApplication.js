// pages/me/applicationCentre/handleApplication/handleApplication.js
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}
var list = [{
    "title": "申请者",
    "text": "Daisy"
  },
  {
    "title": "学校",
    "text": "中南大学"
  },
  {
    "title": "信誉分",
    "text": "600"
  },{
    "title": "累计借书",
    "text": "3"
  },
  {
    "title": "累计买书",
    "text": "3"
  }, {
    "title": "累计上传",
    "text": "3"
  },
  {
    "title": "联系方式",
    "text": "2332323"
  }, {
    "title": "留言",
    "text": "喜欢这本书"
  }
]
Page({
  data: {
    listData: list,
    items:[
      {name:"agree",value:"同意",checked:"true"},
      {name:"reject",value:"拒绝"}
    ],
    inputReasonVal:""
  },

  onLoad: function(options) {

  },
 radioChange:function(e){
   console.log(e.detail.value)

 },
 inputReason:function(e){
   this.setData({
     inputReasonVal:e.detail.value
   })
 },
  bindSubmit:function(e){
    var pages = getCurrentPages();
    var prePage = pages[pages.length - 2];
    // var index = prePage.currentTarget.dataset.index;
    // var operationOther = prePage.data.handlings[index].operationOther;
    prePage.setData({
       operationOther: "已处理",
       disabled:true
    })
    wx.navigateBack({
      
    })

  },
  formSubmit:function(e){
    console.log(e.detail.value);
    var reason = e.detail.value.inputReasonVal;
    var radioChoose = e.detail.value.radioChoose;
    var that = this;
    wx.request({
      url: '',
      method: "POST",
      header: header,
      data: {
        'reason': reason,
        'radioChoose': radioChoose
      },
      success: function (res) {
        console.log(res.detail.value)
        var pages = getCurrentPages();
        var prePage = pages[pages.length - 2];
        prePage.setData({
          operationOther:"已处理"
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