import { router } from '@kit.ArkUI';

@Entry
@Component
struct Register {
  @State message: string = 'Hello World';

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
    }
    .width("100%")
    .height("100%")
  }
}