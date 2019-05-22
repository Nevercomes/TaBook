//app.js
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
        if(res.code) {
          wx.request({
            url: 'http://localhost:8080/tabook/a/login',
            method: 'post',
            // 说明：小程序的默认数据的请求格式为application/json 
            // 在post方法下 无论是request.getParameter() 还是以setter的方式bean注入都无法获得参数
            // 因为post方式不做url拼接，java后台无法处理不是key value格式的json字符串
            // 所以对于post方式请在请求头header内加上
            // 'content-type': 'application/x-www-form-urlencoded'
            header: { 'content-type': 'application/x-www-form-urlencoded' },
            data: {
              code: res.code
            },
            success(res) {
              // 获取sessionId 存入全局变量中 在后续所有的请求中带入sessionId
              console.log(res.data)
              if (res && res.data && res.data.data) {
                //保存Cookie到Storage
                let session = "tabook-shiro-session=" + res.data.data + "; Path=/; HttpOnly"
                wx.setStorageSync('Cookie', session);
              }
            }
          })
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo
              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
    userInfo: null,
    // 默认的请求头
    Cookie: "tabook-shiro-session="
  }
})
