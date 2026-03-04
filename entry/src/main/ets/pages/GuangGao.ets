import '@ohos.router';
import router from '@ohos.router';
import { common } from '@kit.AbilityKit';
import { checkToken } from '../util/Token';

@Entry
@Component
struct GuangGao {
  @State djs:number = 5;
  @State develop:boolean = false;
  @State url:string  = "pages/Login"
  @State a:number = 0

  private context:common.UIAbilityContext = getContext() as common.UIAbilityContext
  async  aboutToAppear() {
    if (this.develop){
      this.djs = 0;
    }
    if (await checkToken(this.context)){
      console.log("已登录");
      this.url = "pages/Index"
    }else {
      console.log("未登录");
    }

    this.a = setInterval(() => {
      this.djs = this.djs - 1;
      if (this.djs <= 0) {
        clearInterval(this.a);
        router.replaceUrl({
          url:this.url
        })
      }
    },1000)
  }

  build() {
    Column(){
      Row(){
        Row(){
          Text("倒计时 " + this.djs + " 秒  |  ")
            .fontSize(15)
          Button("跳过")
            .backgroundColor("#fff")
            .fontColor(Color.Black)
            .padding({
              top:0,bottom:0,left:10,right:10
            })
            .margin(0)
            .fontSize(15)
            .onClick(() => {
              // 清除定时器，因为页面跳转了循环还在执行，如果用户在剩余秒数内打开了其他(非主页)页面，倒计时为0同样会跳转回主页
              clearInterval(this.a);
              router.replaceUrl({
                url:this.url
              })
            })
        }
        .padding({
          left:20,right:20,top:0,bottom:0
        })
        .margin({
          top:15,
          right:0
        })
      }

      .width("100%")
      .justifyContent(FlexAlign.End)

      // 广告页大字
      Column(){
        Text("广")
          .fontSize(50)
        Text("告")
          .fontSize(50)
          .padding({
            top:20
          })
        Text("页")
          .fontSize(50)
          .padding({
            top:20
          })
      }
      .padding({top:130})

      Column(){
        Image($r("app.media.foreground"))
          .width(100)
        Text("数字社区")
          .fontSize(20)
          .margin({bottom:10})
        Text("以数字生活提升社区品质")
      }
      .margin({top:190})

    }
    .width("100%")
    .height("100%")

  }
}