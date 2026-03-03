@Entry
@Component
struct Index {
  @State djs:number = 5;

  build() {
    Column(){
      Row(){
        Row(){
          Text("倒计时 " + this.djs + " 秒  |  ")
            .fontSize(15)
          Button("跳过")
            .backgroundColor("#fff")
            .fontColor(Color.Black)
            .padding(0)
            .margin(0)
            .fontSize(15)
        }
        .padding({
          left:20,right:20,top:0,bottom:0
        })
        .margin({
          top:15,
          right:10
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