import { checkToken, removeToken } from '../util/Token'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct Index {
private context:common.UIAbilityContext = getContext() as common.UIAbilityContext;
  build() {
    Column(){
      Text("首页")
      Button("删除token")
        .onClick(() => {
          removeToken(this.context)
        })
    }
    .width("100%")
    .height("100%")

  }
}