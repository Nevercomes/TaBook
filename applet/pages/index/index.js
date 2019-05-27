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
    price:999,
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
    list2:[
      {
        title: '傲慢与偏见',
        author:'简·奥斯汀',
        score:4,
        press:'青海人民出版社',
        freeNum:3,
        imgUrl:'../../static/images/home/book2.jpg',
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
        intro:'小说描写了小乡绅班纳特五个待字闺中的千金，主角是二女儿伊丽莎白。她在舞会上认识了达西，但是耳闻他为人傲慢，一直对他心生排斥，经历一番周折，伊丽莎白解除了对达西的偏见，达西也放下傲慢，有情人终成眷属。这部作品以日常生活为素材，以反当时社会上流行的感伤小说的内容和矫揉造作的写作方法，生动地反映了18世纪末到19世纪初处于保守和闭塞状态下的英国乡镇生活和世态人情。并多次被改编成电影和电视剧。',
      },
      {
        title: '月亮与六便士',
        author: '毛姆',
        score: 5,
        press: '上海译文出版社',
        freeNum: 6,
        imgUrl: '../../static/images/home/book4.jpg',
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
        intro: '贫穷的纠缠，病魔的折磨他毫不在意，只是后悔从来没有光顾过他的意识。作品表现了天才、个性与物质文明以及现代婚姻、家庭生活之间的矛盾，有着广阔的生命视角，用散发着消毒水味道的手术刀对皮囊包裹下的人性进行了犀利地解剖，混合着看客讪笑的幽默和残忍的目光。',
      },
      {
        title: '人类简史',
        author: '尤瓦尔·赫拉利',
        score: 5,
        press: '中信出版集团',
        freeNum: 1,
        imgUrl: '../../static/images/home/book3.jpg',
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
        intro: '十万年前，地球上至少有六个人种，但为何今天只剩下我们这一种（智人）？十万年前智人（homosapiens）只是非洲角落的一个毫不起眼的族群，对地球上的生态系影响力和萤火虫、猩猩或水母差不了多少。为何这个物种最终成为地球的主宰？智人究竟是如何导致其他人种和巨型哺乳类动物的灭绝？金钱和宗教从何而来，又为何会产生？人类创建的帝国为何一个个衰亡复又兴起，而且少数民族竟能统治远比自己庞大的族群？为什么地球上几乎每一个社会都有男尊女卑的观念？为何一神教成为最广为接受的宗教？科学和资本主义又是如何成为现代最重要的信条？我们真的了解自己吗？我们过得更加快乐吗？',
      },
      {
        title: '北平杂记',
        author: '齐如山',
        score: 4,
        press: '当代中国出版社',
        freeNum: 7,
        imgUrl: '../../static/images/home/book5.jpg',
        star1: '../../static/images/home/star.png',
        star2: '../../static/images/home/star.png',
        star3: '../../static/images/home/star.png',
        star4: '../../static/images/home/star.png',
        star5: '../../static/images/home/star.png',
        intro: '对故乡故土顾望不已，对故事故人思恋未了。暮年的齐如山细致地勾勒出一幅生动、温婉的古都风物长卷。他像是穿着长袍坐在四合院里，槐花香弥漫着，他一口京腔娓娓讲述着这个令他挚念如斯的城市的种种。古都的大气，民俗的朴厚，前清的逸闻……其言至浅，其情至深，不禁使人追忆着这座古都的前世今生，感慨系之，恍然如梦……',
      },
    ],
    list3:[
      {
        title: '数据库系统概念',
        author: 'S.Sudarshan',
        price:32,
        period:'1年',
        press: '机械工业出版社',
        imgUrl: '../../static/images/home/sell1.jpg',
        intro: '本书是数据库系统方面的经典教材之一，其内容由浅入深，既包含数据库系统基本概念，又反映数据库技术新进展。它被国际上许多著名大学所采用，包括斯坦福大学、耶鲁大学、得克萨斯大学、康奈尔大学、伊利诺伊大学等。我国也有多所大学采用本书作为本科生和研究生数据库课程的教材和主要教学参考书，收到了良好的效果。',
      },
      {
        title: '数据结构与算法分析',
        author: 'Mark Allen Weis',
        price: 30,
        period: '1年',
        press: '机械工业出版社',
        imgUrl: '../../static/images/home/sell3.jpg',
        intro: '本书是数据库系统方面的经典教材之一，其内容由浅入深，既包含数据库系统基本概念，又反映数据库技术新进展。它被国际上许多著名大学所采用，包括斯坦福大学、耶鲁大学、得克萨斯大学、康奈尔大学、伊利诺伊大学等。我国也有多所大学采用本书作为本科生和研究生数据库课程的教材和主要教学参考书，收到了良好的效果。',
      },
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
  clickRecommend: function () {
    wx.navigateTo({
      url: '../commentRecommend/commentRecommend',
    })
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
  
  toBookInfoTap: function (e) {
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
    // var that = this;
    // wx.request({
    //   url: 'http://localhost:8080/tabook/a/login',
    //   header: header,
    //   method:"POST",
    //   date:{
    //     //数据？？？？？？？？？？？
    //     books:[]
    //   },
    //   success(res){
    //     console.log(res.data)
    //   }  
    // })
    wx.request({
      url: 'http://localhost:8080/tabook/a/book/index/borrow/list',
      header: header,
      method: "GET",
      
      data: {
        // data: 'Hello world!'
      },
      success(res) {
        console.log(res.data)
      },
      fail(xhr) {
        // console.log(xhr.msg)
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
        star5: '../../static/images/home/star.png',
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


