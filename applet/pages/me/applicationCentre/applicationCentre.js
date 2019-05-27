// pages/me/applicationCentre/applicationCentre.js
var handlings = [
//   {
//   "avatarUrl": "../../../static/images/me/avatar.png",
//   "nickName": "Daisy",
//   "school": "中南大学",
//   "name": "平凡的世界",
//   "operationOther": "待处理",
//   "time": "2019-05-24"
// }, 
// {
//   "avatarUrl": "../../../static/images/me/avatar.png",
//   "nickName": "Daisy",
//   "school": "中南大学",
//   "name": "平凡的世界",
//   "operationOther": "待处理",
//   "time": "2019-05-22",
// }
];

var myhandlings = [{
  "school": "中南大学",
  "name": "黄金时代",
  "operationMy": "未处理",
  "time": "2019-05-24",
  "type": "撤销"
}, 
// {
//   "school": "中南大学",
//   "name": "平凡的世界",
//   "operationMy": "未处理",
//   "time": "2019-05-24",
//   "type": "撤销"
// }, 
]
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
};
Page({
  data: {
    handlings: handlings,
    processing: 0,
    pending: 0,
    myTotalApplication: 1,
    currentTab: 0,
    myhandlings: [{
      "school": "中南大学",
      "name": "《黄金时代》",
      "operationMy": "未处理",
      "time": "2019-05-22",
      "type": "撤销"
    }, 
    // {
    //   "school": "中南大学",
    //   "name": "平凡的世界",
    //   "operationMy": "未处理",
    //   "time": "2019-05-24",
    //   "type": "撤销"
    // }
    ],
    operationOther: "待处理",
    operationMy: "未处理",
    disabled: false,
    userInfo: {}
  },
  onLoad: function(options) {
    var that = this;
    wx.getSystemInfo({
      success: function(res) {
        that.setData({
          clientHeight: res.windowHeight
        });
      }
    })
    if (app.globalData.userInfo) {
      that.setData({
        userInfo: app.globalData.userInfo
      })
    }
    wx.request({
      url: '',
      header: header,
      data: {
        handlings: [],
        myhandlings: []
      },
      success: res => {
        var handlings = res.data.handlings;
        var myhandlings = res.data.myhandlings;
        for (var i = 0; i < handlings.length; i++) {
          var subject = handlings[i];
          var handing = new Object;
          handing.avatarUrl = subject.avatarUrl;
          handing.nickName = subject.nickName;
          handing.name = subject.name;
          handing.school = subject.school;
          handing.operationOther = subject.operationOther
          handlings.push(handing);
        }
        for (var i = 0; i < myhandlings.length; i++) {
          var subject = myhandlings[i];
          var myhanding = new Object;
          myhanding.avatarUrl = subject.avatarUrl;
          myhanding.nickName = subject.nickName;
          myhanding.name = subject.name;
          myhanding.school = subject.school;
          myhanding.operationMy = subject.operationMy;
          myhanding.push(handing);
        }
        that.setData({
          handlings: handlings,
          myhandlings: myhandlings
        })
      }
    })
  },

  clickTab: function(e) {
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
  handlethis: function() {
    wx.navigateTo({
      url: 'handleApplication/handleApplication',
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  },
  revokeOp:function(e){
    var that = this;
    wx.showModal({
      title: '提示',
      content: '确定要撤销申请吗？',
      success(res) {
        if (res.confirm) {
          var index = e.currentTarget.dataset.index
          console.log(index)
          var myhandings = that.data.myhandings;
          console.log(myhandings);
          myhandings.splice(index, 1);
          that.setData({
            myhandings:myhandings
          })
          console.log('撤销成功')
        } else if (res.cancel) {
          console.log('用户点击取消')
        }
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