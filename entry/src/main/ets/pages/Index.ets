import { prompt } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State mainBtnSite:number = 55;
  build() {
    Column(){
      Row(){
        Column(){
          Text("LiHuarong")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({bottom:3})
          Text("钟落潭广机电G1-231")
        }
        .alignItems(HorizontalAlign.Start)

        Row()
          .backgroundImage($r('app.media.logo'))
          .width(40)
          .height(40)
          .backgroundImageSize(ImageSize.Cover)
      }
      .width("100%")
      .height(80)
      .backgroundColor(Color.White)
      .padding({left:30,right:30})
      .justifyContent(FlexAlign.SpaceBetween)
      .position({left:0,top:0})

      Scroll(){
        Column(){

          // 四格应用服务入口
          Column(){
            Row(){
              ServerBtn({labelText:"门禁",icon:$r('app.media.menjin')})
                .width(this.mainBtnSite)
                .height(this.mainBtnSite)
              ServerBtn({labelText:"缴费",icon:$r('app.media.money')})
                .width(this.mainBtnSite)
                .height(this.mainBtnSite)
            }
            .justifyContent(FlexAlign.SpaceAround)
            .width("100%")
            .margin({bottom:50})

            Row(){
              ServerBtn({labelText:"保修",icon:$r('app.media.baoxiu')})
                .width(this.mainBtnSite)
                .height(this.mainBtnSite)
              ServerBtn({labelText:"报事",icon:$r('app.media.upload')})
                .width(this.mainBtnSite)
                .height(this.mainBtnSite)
            }
            .justifyContent(FlexAlign.SpaceAround)
            .width("100%")
          }
          .width("90%")
          .backgroundColor("#fff")
          .padding({top:30,bottom:40,left:10,right:10})
          .borderRadius(20)
          .margin({top:15,bottom:8})
        }
        .width("100%")
      }
      .margin({top:80,bottom:80})
      .width("100%")
      .layoutWeight(1)  // 占据剩余空间
      // .backgroundColor(Color.Pink)

      Row(){

      }
      .height(80)
      .width("100%")
      .backgroundColor("#ff54a2f8")
      .position({bottom:0,left:0})
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f5f5f5")

  }
}

// 图标+文字组件（带点击）
@Component
struct ServerBtn{
  icon?: Resource = $r('app.media.logo');
  labelColor:string = "#000";
  radius:string = "10";
  bgColor:string = "#f0f8ff";
  labelSize:string = "13";
  labelText:string = "门禁";
  clickMsgShow:boolean = true;
  build() {
    Column(){
      Image(this.icon)
        .width("100%")
        .height("100%")
      Text(this.labelText)
        .margin({top:20})
        .fontColor(this.labelColor)
        .fontSize(this.labelSize)
    }
    .border({
      radius:this.radius
    })
    .width("100%")
    .height("100%")
    .padding(13)
    .backgroundColor(this.bgColor)
    .onClick(() => {
      if (this.clickMsgShow) {
        prompt.showToast({
          message:"点击了 [" + this.labelText + "]"
        })
      }
    })
  }
}