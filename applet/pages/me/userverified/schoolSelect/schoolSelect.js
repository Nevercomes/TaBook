// pages/me/userverified/schoolSelect/schoolSelect.js
const app = getApp()
Page({

  data: {
    schoolSelectVal:"",
    inputShowed:false,
    searchSchoolVal:'',
    scrollAZ: null,
    scrollNow: 0,
    schoolType: 'begin',
    schoolResults: null,
    schoolAZ: [{ schoolName: '热门' }, { schoolName: "A" }, { schoolName: "B" }, { schoolName: "C" }, { schoolName: "D" }, { schoolName: "E" }, { schoolName: "E" }, { schoolName: "F" }, { schoolName: "G" }, { schoolName: "H" }, { schoolName: "I" }, { schoolName: "J" }, { schoolName: "K" }, { schoolName: "L" }, { schoolName: "M" }, { schoolName: "N" }, { schoolName: "O" }, { schoolName: "P" }, { schoolName: "Q" }, { schoolName: "X" }],
    schools: [{ schoolName: '热门', schoolPinYin: '', schoolPY: '' }, { schoolName: '北京大学', schoolPinYin: '##', schoolPY: '##' }, { schoolName: '清华大学', schoolPinYin: '##', schoolPY: '##' }, { schoolName: '中南大学', schoolPinYin: '##', schoolPY: '##' }, { schoolName: '复旦大学', schoolPinYin: '##', schoolPY: '##' }, { schoolName: 'A', schoolPinYin: 'a', schoolPY: 'a' }, { schoolName: '安徽大学', schoolPinYin: 'anhuidaxue', schoolPY: 'ah' }, { schoolName: '安徽理工大学', schoolPinYin: 'anhuiligongdaxue', schoolPY: 'ahlg' }, { schoolName: 'B', schoolPinYin: 'b', schoolPY: 'b' }, { schoolName: '北京大学', schoolPinYin: 'beijingdaxue', schoolPY: 'bj' }, { schoolName: 'F', schoolPinYin: 'f', schoolPY: 'f' }, { schoolName: '复旦大学', schoolPinYin: 'fudandaxue', schoolPY: 'fd' }, { schoolName: '福建大学', schoolPinYin: 'fujiandaxue', schoolPY: 'fj' }, { schoolName: 'Z', schoolPinYin: 'z', schoolPY: 'z' }, { schoolName: '中南大学', schoolPinYin: 'zhongnandaxue', schoolPY: 'zndx' }, { schoolName: 'F', schoolPinYin: 'f', schoolPY: 'f' }, { schoolName: '复旦大学', schoolPinYin: 'fudandaxue', schoolPY: 'fd' }, { schoolName: '福建大学', schoolPinYin: 'fujiandaxue', schoolPY: 'fj' }, { schoolName: 'Z', schoolPinYin: 'z', schoolPY: 'z' }, { schoolName: '中南大学', schoolPinYin: 'zhongnandaxue', schoolPY: 'zndx' }, { schoolName: 'F', schoolPinYin: 'f', schoolPY: 'f' }, { schoolName: '复旦大学', schoolPinYin: 'fudandaxue', schoolPY: 'fd' }, { schoolName: '福建大学', schoolPinYin: 'fujiandaxue', schoolPY: 'fj' }, { schoolName: 'Z', schoolPinYin: 'z', schoolPY: 'z' }, { schoolName: '中南大学', schoolPinYin: 'zhongnandaxue', schoolPY: 'zndx' }, { schoolName: 'F', schoolPinYin: 'f', schoolPY: 'f' }, { schoolName: '复旦大学', schoolPinYin: 'fudandaxue', schoolPY: 'fd' }, { schoolName: '福建大学', schoolPinYin: 'fujiandaxue', schoolPY: 'fj' }, { schoolName: 'Z', schoolPinYin: 'z', schoolPY: 'z' }, { schoolName: '中南大学', schoolPinYin: 'zhongnandaxue', schoolPY: 'zndx' },]

  },
  onLoad: function (options) {
    if (this.data.schoolResults == null) {
      this.setData({
        schoolType: options.schoolType,
        schoolResults: this.data.schoos
      })
    }

  },
  schoolSelected: function (e) {
    var schoolNameTemp = e.target.dataset.schoolname

    var pages = getCurrentPages(); // 获取页面栈
    var prevPage = pages[pages.length - 2];
    this.setData({
      searchSchoolVal: schoolNameTemp
    })
    prevPage.setData({
      inputSchoolVal: e.currentTarget.dataset.schoolname,   
    })
    wx.navigateBack({
      
    })
   
  },
  inputTyping:function(e){
    this.setData({
      searchSchoolVal:e.detail.value
    })
    wx.pageScrollTo({
      scrollTop: 0,
      duration:0
    })
    var searchSchoolVal = e.detail.value;
    var schoolResultTemp = new Array();
    var schools = this.data.schools;
    if(searchSchoolVal==null||searchSchoolVal.trim==""){
      this.setData({
        schoolResults:schools
      })
      return;
    }
    for(let i = 0;i<schools.length;i++){
      if(schools[i].schoolName.indexOf(searchSchoolVal)==0||schools[i].schoolPY.indexOf(searchSchoolVal.toLowerCase())==0){
        if(schools[i].schoolPY.indexOf("#")!=-1){
          continue;
        }
        var ifHas = false;
        for(let j = 0;j<schoolResultTemp.length;j++){
          if(schoolResultTemp[j]==schools[i]){
            ifHas = true;
            break;
          }
        }
        if(!ifHas){
          schoolResultTemp.push(schools[i]);
        }

      }
    }
    this.setData({
      schoolResults:schoolResultTemp
    })
  },
  showInput:function(e){
   this.setData({
     inputShowed: true
   })
  },
  clearInput:function(e){
    this.setData({
      searchSchoolVal: "",
      inputShowed: false
    })
  },
  schoolSelect:function(e){
    var that= this;
    console.log(e.target.dataset);
    var school = e.target.dataset;
    var text = school.text;
    that.setData({
      schoolSelectVal:text
    })
  },
  bindAZ:function(e){
    var currentSchoolName= e.currentTarget.dataset.id;
    var that = this;
    if(that.data.scrollAZ==null){
      wx.createSelectorQuery().selectAll('.school-item-A-Z').fields({
        dataset:true,
        size:true,
        rect:true
      },function(res){
        res.forEach(function(res){
          if (currentSchoolName == res.dataset.schoolName) {
            wx.pageScrollTo({
              scrollTop: res.top + that.data.scrollNow - 55.5,
              duration: 0
            })
          }
        })
      }).exec();
    }else{
      this.data.scrollAZ.forEach(function(res){
        if(currentSchoolName==res.dataset.schoolName){
          wx.pageScrollTo({
            scrollTop: re.top+that.data.scrollNow-55.5,
            duration:0
          })
        }
      })
    }
  },
  onPageScroll:function(e){
    this.setData({
      scrollNow:e.scrollTop
    })
  },



  searchConfirm: function (e) {
console.log(e.detail.value)
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