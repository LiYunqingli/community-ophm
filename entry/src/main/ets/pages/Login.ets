import { prompt } from '@kit.ArkUI';
import { http } from '@kit.NetworkKit';
import { JSON } from '@kit.ArkTS';
import { setToken, getToken } from '../util/Token'
import { common } from '@kit.AbilityKit';
import { Api } from '../util/Api';


interface loginData { name: string;phone: string;token: string; userId: string; }
interface loginResult{ code:number, message:string, data: loginData; }

interface sendData {
  "phone": string;
  "password": string;
}

@Entry
@Component
struct Login {
  @State phoneNumber:string = "13392692575";
  @State password:string = "fdsafdsa";
  private context:common.UIAbilityContext = getContext() as common.UIAbilityContext;


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
        inputStr:"请输入手机号",
        value:this.phoneNumber,
        onChange:(value) => {
          this.phoneNumber = value;
        }
      })
        .margin({ top: 50 })

      Input({
        icon: $r("app.media.password"),
        inputType:InputType.Password,
        inputStr:"请输入密码",
        value:this.password,
        onChange:(value) => {
          this.password = value
        }
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
        .onClick(async () => {
          if (this.phoneNumber && this.password) {
            // let httpRequest = http.createHttp();
            // try {
            //   let response = await httpRequest.request("http://115.190.244.152:9999/api/auth/login",{
            //     method:http.RequestMethod.POST,
            //     header:{
            //       "Content-Type":"application/json"
            //     },
            //     extraData:{
            //       "phone" : this.phoneNumber,
            //       "password" : this.password
            //     }
            //   });
            //   if (response.responseCode == 200) {
            //     let result = JSON.parse(response.result.toString()) as loginResult
            //     await setToken(this.context, result.data.token);
            //     let token = await getToken(this.context);
            //     console.log(token);
            //     prompt.showToast({
            //       message:"登录成功！，token: " + token,
            //       duration:6000
            //     })
            //
            //   }
            // } catch (err) {
            //   console.error("请求失败：" + JSON.stringify(err))
            // }
            let api = new Api();
            let sendData: sendData = {"phone" : this.phoneNumber,"password" : this.password}
            let result = JSON.parse(await api.POST("/api/auth/login",sendData)) as loginResult;
                await setToken(this.context, result.data.token);
                let token = await getToken(this.context);
                console.log(token);
                prompt.showToast({
                  message:"登录成功！，token: " + token,
                  duration:6000
                })

          }else {
            prompt.showToast({
              message:"手机号密码不得为空",
              duration:3000
            })
          }
        })

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
  @Prop value: string = "";
  onChange? : (value:string) => void;


  build() {
    Row() {
      if (this.icon) {
        Image(this.icon)
          .width(22)
          .height(22)
          .margin({ right: 5 })
      }
      TextInput({ placeholder: this.inputStr,text:this.value})
        .type(this.inputType)
        .backgroundColor("#00000000")
        .layoutWeight(1)
        .onChange(value => {
          this.value = value;
          this.onChange?.(value);
        })


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