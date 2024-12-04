import { PADDING } from "../../constants/size"

@Component
export default struct SearchBar {
  build() {
    Row({ space: PADDING }) {
      Text("北京").fontSize(14).fontColor($r('app.color.white'))
      Stack() {
        Row() {

          Image($r('app.media.search')).imageStyles(18).margin(10)

          TextInput({ placeholder: '公司/地铁/小区，马上搜索' })
            .layoutWeight(1)
            .fontSize(12)
            .placeholderColor($r('app.color.gray'))
            .placeholderFont({ size: 12 })
            .caretColor($r('app.color.gray'))// 光标颜色
            .padding(0)
            .backgroundColor($r('app.color.white'))
            .stateStyles({
              pressed: textInputStyles
            })

          Column() {
          }
          .height(18)
          .width(1)
          .backgroundColor($r('app.color.line'))
          .margin({ left: 10 })

          Image($r('app.media.position')).imageStyles(18).margin(10)
        }
      }
      .width(244)
      .backgroundColor($r('app.color.white'))
      .height(38)
      .padding({ left: PADDING, right: PADDING })
      .border({ width: 1, radius: 52, color: $r('app.color.line') })

      Image($r('app.media.message'))
        .imageStyles(24)
        .fillColor($r('app.color.white'))
    }
    .width('100%')
    .height(38)
    .padding({ left: PADDING, right: PADDING })
    .margin({ top: 4 })
  }
}

@Extend(Image)
function imageStyles(size: number) {
  .width(size).height(size).objectFit(ImageFit.Fill)
}


@Styles
function textInputStyles() {
  .backgroundColor($r("app.color.white"))
}