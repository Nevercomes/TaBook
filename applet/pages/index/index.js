//index.js
//获取应用实例
const WXAPI = require('../../wxapi/main.js')
const app = getApp()
const Cookie = wx.getStorageSync('Cookie');
let header = {
  "Cookie": Cookie,
  "content-type": "application/x-www-form-urlencoded"
}


Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    inputShowed:false,//是否显示搜索框
    inputVal:"",//搜索框内容

    autoplay:true,
    interval:3000,
    duration: 1000,
    indicatorDots:false,
    circular:true,
    imgUrls:[
      '../../static/images/home/book1.jpg',
      '../../static/images/home/book2.jpg',
      '../../static/images/home/book4.jpg',
    ],
    swiperCurrent: 0,
    currentTab:'tab1',
    goods:[
      'a',
      'b',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
      'c',
    ],
    tab1Hidden:false,
    tab2Hidden:true,
    tab3Hidden:true,
    star1: '../../static/images/home/star.png',
    star2: '../../static/images/home/star.png',
    star3: '../../static/images/home/star.png',
    star4: '../../static/images/home/star.png',
    star5: '../../static/images/home/star.png',
    score:4,
    price:999,
    available:3,
    total:100,
    list:[],//接受搜索的内容
    wxSearchData:'',
    noticeList: [
      "新功能模块：消息 已经开放，大家赶快去体验吧！",
      "有借有还可以提升信誉度哦~~",
      "一大波图书等你来看，你还在等什么？",
      "每个用户可借阅图书数目有限哦~~",
    ],
    list1: [
      {
      title: '长尾年代',
      username: '阿北',
      content: '《长尾理论》生动、易读、及时，面面俱到，这些决定了这会是一本对很多行业影响深远的书。期望更深入理解和指引的读者可能会觉得不过瘾。不过长尾是此时此刻正在发生的事情，有机会参与其中，比起任何单纯的脑力享受来，我认为是更加幸运的。”'
      }, 
      {
        title: '笔记：影响力原理',
        username: '小K',
        content: '影响力的本质是对人类思维的捷径习惯的利用，人类依靠精密的大脑创造了一个越发复杂的世界，以至于我们不得不依赖于类似动物的原始反应来快速地应对它。'
      }, 
      {
        title: '《乌合之众》札记',
        username: 'William',
        content: '勒庞的《乌合之众》，“是一部以阅读法国大革命时间为基础的群体行为的社会心理学著作”。罗伯特•墨顿的序“勒庞《乌合之众》的得与失”写得很好，他提到一点，“《乌合之众》的当代意义，在于它发现问题的功能而非解决问题的功能。”'
      },
      {
        title: '美国人的21世纪生存战略',
        username: '大大怪',
        content: '再好的东西，如果跟你无关。那么，这个东西，都只是生活的八卦，而非必需品。 这也是人们需要忽略一些东西的理由。 人生是复杂和短暂的，我们活得都忙不过来了，除了爱看热闹的天性外，我们的眼界没有超越我们生活的圈子。 我在读《世界是平的》（第二版）的时候，也是这样抱着看热闹的心态，托马斯弗里德曼先生告诉我们，世界是平的。然后，听周围的人讨论：到底世界是平的，还是不平的。'
      },
      {
        title: '牛奶可乐经济学：无招胜有招，何必屠龙刀？',
        username: '浪渔笛',
        content: '《牛奶可乐经济学》就是一本这样的故事合集。问题千奇百怪，分析工具却相当简单——成本效益原则。当一个行动带来的收益大于成本时，人们就会采取行动。这是绝大多数举动的根源。'
      },
      {
        title: '魔鬼，卧底，怪诞行为：我所知道的经济学',
        username: '紫嫣',
        content: '  为什么银行的大楼都豪华气派？不是他们喜欢奢侈，他们是为了打消人们担心携款逃跑的顾虑。为什么火车硬座那么简陋？不是他们不舍得花几个小钱，他们觉得搞太舒适了就没有人愿意坐卧铺了。为什么超市物品有豪华包装？不是他们不懂得节约的美德，是引诱好乱花钱的顾客自己跳出来。为什么手机资费套餐如此复杂？不是他们不晓得简化的好处，他们是想把你的脑子搞乱。为什么电影门票为老人小孩打折？不是他们心肠特别好，他们是为了把更多的人拉进电影院。为什么制造商把家用电器的功能搞得越来越齐全？不是他们心疼你为你省事，他们是要把价格卖得更高……'
      },
      {
        title: '神秘的"阿里中供系"的前世今生',
        username: '佐罗',
        content: '这是阿里的早期创业历史，很多人提起这段历史都会说“这是阿里从0到1的阶段”，在“激情燃烧”的岁月里，阿里奠定其自己的价值观，其基因也通过一些出走者得到广泛的传播。这个阶段，我们看见那些草根用最传统的方式去销售“互联网产品（有些中供人可能并不认为当时的阿里是互联网企业）”，他们用一砖一瓦奠定了阿里帝国，在淘宝、支付宝还刚刚起步时，中供被奉为哥哥，应该照顾一下刚出生的弟弟妹妹们。'
      },
      {
        title: '除了情怀和八卦，我们还能从褚时健身上学什么？',
        username: '左手',
        content: '分享这本传记之前，我一直担心遇到情怀党和八卦党。所谓情怀党，就是看书只能看到各种让人泪流满面的东西；所谓八卦党，就是总是喜欢钻历史边角，找点在餐桌上的谈资。褚时健这个人的人生经历呢，又似乎特别符合这两种需求，所以我还挺担心。但我想说，如果按上面两种方式读这本《褚时健传》，绝对是一种浪费。'
      }
    ],

  },

  //事件处理函数
  //搜索(未完成！！！1)
  wxSearchInput:function(value){
    var that = this;
    // console.log(value.detail.value.length);
    if (value.detail.value.length>0){
      wx.request({
        url: 'http://localhost:8080/tabook/a/login',
        header: header,
        method: "POST",
        data:{
          value:value.detail.value
        },
        dataType:JSON,
        success:function(res){
          if(res.code){
            console.log(res);
            var data = data.value.list;
            for (let i = 0; i < res.data.length; i++) {
              data.push(res.data[i]);
            }
            that.setData({
              wxSearchData:value.detail.value,
              lists:data
            })
          }
        }
      })
    }
  },
  clickImg: function () {
    wx.navigateTo({
      url: '../bookInfo/bookInfo',
    })
  },
  iconClick:function(){
    wx.navigateTo({
      url: '../borrowedlist/borrowedlist',
    })
  },
  toDetailsTap:function(){
    wx.navigateTo({
      url:'../bookInfo/bookInfo'
    })
  },
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  //搜索框事件
  showInput: function () {
    this.setData({
      inputShowed: true
    });
  },
  hideInput: function () {
    this.setData({
      inputVal: "",
      inputShowed: false
    });
  },
  clearInput: function () {
    this.setData({
      inputVal: ""
    });
  },
  inputTyping: function (e) {
    this.setData({
      inputVal: e.detail.value
    });
  },
  //轮播图事件
  swiperchange: function (e) {
    //console.log(e.detail.current)
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  
  toBookInfoTap: function () {
    wx.navigateTo({
      url: '../bookInfo/bookInfo',
      duration: 0
    })
  },
  handleChange:function({detail}){
    // console.log(detail.key)
    this.setData({
      currentTab: detail.key
    })
  },
  //tab标签页事件
  tab1Click:function(e){
    // console.log(e.detail)
    this.setData({
      tab1Hidden:false,
      tab2Hidden:true,
      tab3Hidden:true,
    })
  },
  tab2Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: true,
      tab2Hidden: false,
      tab3Hidden: true,
    })
  },
  tab3Click: function (e) {
    // console.log(e.detail)
    this.setData({
      tab1Hidden: true,
      tab2Hidden: true,
      tab3Hidden: false,
    })
  },
  loadBookInfo:function(e){
    var that = this;
    wx.request({
      url: 'http://localhost:8080/tabook/a/login',
      header: header,
      method:"POST",
      date:{
        //数据？？？？？？？？？？？
        books:[]
      },
      success(res){
        console.log(res.data)
      }  
    })
  },

  onLoad: function () {
    // loadBookInfo();
    // console.log(this.data.score);
    if(this.data.score < 1) {
      this.setData({
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star。png',
      })
    }
    else if (this.data.score < 2) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 3) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 4) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star-a.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score < 5) {
      this.setData({
        star1: '../../static/images/home/star-a.png',
        star2: '../../static/images/home/star-a.png',
        star3: '../../static/images/home/star-a.png',
        star4: '../../static/images/home/star-a.png',
        star5: '../../static/images/home/star.png',
      })
    }
    else if (this.data.score == 5) {
      this.setData({
      star1: '../../static/images/home/star-a.png',
      star2: '../../static/images/home/star-a.png',
      star3: '../../static/images/home/star-a.png',
      star4: '../../static/images/home/star-a.png',
      star5: '../../static/images/home/star-a.png',
      })
      
    }
  },
  onReady: function () {
  },
  
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  testSession: function() {
    // 权限测试
    wx.request({
      url: 'http://localhost:8080/tabook/a/index',
      header: header,
      data: {
        data: 'Hello world!'
      },
      success(res) {
        console.log(res.data)
      },
      fail(xhr) {
        // console.log(xhr.msg)
      }
    })
  }
})


