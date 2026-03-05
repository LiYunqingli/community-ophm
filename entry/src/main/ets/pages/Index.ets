
@Entry
@Component
struct Index {
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
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f5f5f5")

  }
}