@Entry
@Component
struct Login {
  build() {
    Column(){
      Text("欢迎登录")
        .fontSize(23)
        .fontWeight(FontWeight.Bold)
        .margin({top:50})

      Text("智慧社区")
        .margin({top:10})
        .fontColor("#ff3c3c3c")

      Input({
        icon: $r("app.media.phone"),
        inputType:InputType.PhoneNumber,
        inputStr:"请输入手机号"
      })
        .margin({ top: 50 })

      Input({
        icon: $r("app.media.password"),
        inputType:InputType.Password,
        inputStr:"请输入密码"
      })
        .margin({ top: 20 })

      Row(){
        Text("快速注册")
          .fontColor("#007aff")
          .fontSize(13)

        Text("忘记密码")
          .fontColor("#007aff")
          .fontSize(13)
      }
      .width("85%")
      .margin({top:30})
      .justifyContent(FlexAlign.SpaceBetween)

      Button("登录")
        .width("85%")
        .padding(13)
        .margin({top:30})

      // 用户协议和隐私政策
      Row(){
        Text("登录即表示您同意")
          .fontSize(11)
          .fontColor(Color.Gray)
        Text(" 《用户服务协议》 ")
          .fontSize(11)
          .fontColor("#007aff")
        Text("和")
          .fontSize(11)
          .fontColor(Color.Gray)
        Text(" 《隐私协议》 ")
          .fontSize(11)
          .fontColor("#007aff")
      }
      .margin({top:20})

      // 其他登录方式 -- 水平线
      Row() {
        Divider()
          .color('#ffd2d2d2')
          .margin({ right: 10 })
          .width("30%")

        Text("其他登录方式")
          .fontSize(13)
          .fontColor("#ff8f8f8f")
          .padding(5)
          .backgroundColor("#fff")

        Divider()
          .color('#ffd2d2d2')
          .margin({ left: 10 })
          .width("30%")
      }
      .width("80%")
      .margin({ top: 40 })
      .justifyContent(FlexAlign.Center)

      // 其他登录方式图标
      Row(){
        Icon()
          .width(80)
        Icon({iconUrl:"app.media.AliPay",str:"支付宝登录"})
          .width(80)
      }
      .width("56%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({top:20})
    }
    // .backgroundColor(Color.Red)
    .width("100%")
    .height("100%")
  }
}

// 输入框组件
@Component
struct Input {
  inputType: InputType = InputType.Normal;
  inputStr: string = "请输入该项内容";
  icon?: Resource;

  build() {
    Row() {
      if (this.icon) {
        Image(this.icon)
          .width(22)
          .height(22)
          .margin({ right: 5 })
      }
      TextInput({ placeholder: this.inputStr })
        .type(this.inputType)
        .backgroundColor("#00000000")
        .layoutWeight(1)
    }
    .width("85%")
    .padding({ left: 5, right: 10, top: 5, bottom: 5 })
    .border({ width: { bottom: 1 }, style: BorderStyle.Solid, color:"#ffd2d2d2" })
  }
}

// 登录方式图标
@Component
struct Icon {
  iconUrl:string = "app.media.WeChatPay";
  str:string = "微信登录"
  build() {
    Column(){
      Image($r(this.iconUrl))
        .width("40%")
      Text(this.str)
        .fontColor("#666666")
        .margin({top:10})
    }
    .width("100%")
  }
}