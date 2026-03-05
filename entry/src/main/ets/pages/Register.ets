import { prompt, router } from '@kit.ArkUI';
import { Api } from '../util/Api';
import { JSON } from '@kit.ArkTS';


interface sendData {
  "phone": string;
  "code": string;
  "password": string;
  "name": string;
  "idCard": string;
}

interface data {
  "phone": string;
}

interface resultData {
  "code": number;
  "message": string;
  "data": data;
}

@Entry
@Component
struct Register {
  @State phoneNumber:string = "1339269257";
  @State yzm:string = "";
  @State password:string = "fdsafdsa";
  @State username:string = "LiHuarong";
  @State idCare:string = "111111111111111111";// 18位身份证号码

  build() {
    Column(){
      Row(){
        Text("←")
          .fontWeight(FontWeight.Bold)
          .fontColor("#007aff")
          .onClick(() => {
            router.back()
          })

        Text("用户注册")
          .margin({left:10})
          .fontWeight(FontWeight.Bold)
      }
      .width("85%")
      .margin({top:30})

      Column(){
        Input({
          icon:$r("app.media.phone"),
          inputStr:"请输入手机号",
          inputType:InputType.PhoneNumber,
          onChange:(value) =>{
            this.phoneNumber = value;
          },
          value:this.phoneNumber
        })
          .margin({bottom:20})

        // 验证码
        Row(){
          Input({
            icon:$r("app.media.yzm"),
            inputStr:"请输入验证码",
            inputType:InputType.Number,
            value:this.yzm,
            onChange:(value) => {
              this.yzm = value;
            }
          })
            .width("68%")
          Button("获取验证码")
            .padding({
              top:0,bottom:0,left:10,right:10
            })
            .margin(0)
            .fontSize(15)
            .onClick(() => {
              prompt.showToast({
                message:"验证码：1234"
              })
              this.yzm = "1234";
            })
        }
        .width("100%")
        .margin({bottom:20})

        Input({
          icon:$r("app.media.password"),
          inputStr:"请设置密码",
          inputType:InputType.Password,
          value:this.password,
          onChange:(value) => {
            this.password = value;
          }
        })
          .margin({bottom:20})

        Input({
          icon:$r("app.media.name"),
          inputStr:"请设置名字",
          value:this.username,
          onChange:(value) => {
            this.username = value;
          }
        })
          .margin({bottom:20})

        Input({
          icon:$r("app.media.idCare"),
          inputStr:"请输入身份证号码",
          value:this.idCare,
          inputType:InputType.Number,
          onChange:(value) => {
            this.idCare = value;
          }
        })

        // 用户协议和隐私政策
        Row(){
          Text("注册即表示您同意")
            .fontSize(11)
            .fontColor(Color.Gray)
          Text(" 《用户服务协议》 ")
            .fontSize(11)
            .fontColor("#007aff")
            .onClick(() => {
              prompt.showToast({
                message:"这是用户服务协议"
              })
            })
          Text("和")
            .fontSize(11)
            .fontColor(Color.Gray)
          Text(" 《隐私协议》 ")
            .fontSize(11)
            .fontColor("#007aff")
            .onClick(() => {
              prompt.showToast({
                message:"这是用户隐私协议"
              })
            })
        }
        .margin({top:20})

        Button("注册")
          .width("100%")
          .margin({top:30})
          .onClick(async () => {
            if (!(this.phoneNumber && this.yzm && this.password && this.username && this.idCare)) {
              prompt.showToast({
                message:"手机号/验证码/密码/用户名/身份证号码 不得为空",
                duration:5000
              })
              return;
            }


            const apt = new Api();
            let sendData: sendData = {
              "phone": this.phoneNumber,
              "code": this.yzm,
              "password": this.password,
              "name": this.username,
              "idCard": this.idCare
            };
            let result = JSON.parse(await apt.POST("/api/auth/register",sendData)) as resultData
            console.log(result.code.toString());

          })
      }
      .width("85%")
      .margin({top:50})
    }
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
    .width("100%")
    .padding({ left: 5, right: 10, top: 5, bottom: 5 })
    .border({ width: { bottom: 1 }, style: BorderStyle.Solid, color:"#ffd2d2d2" })
  }
}