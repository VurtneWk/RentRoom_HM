import { PADDING } from "../../constants/size"

@Component
export default struct SearchBar {
  @Prop fontColor: string

  build() {
    Row({ space: PADDING }) {
      Text("北京").fontSize(14).fontColor(this.fontColor)
      Stack() {
        Row() {

          Image($r('app.media.search')).imageStyles(18).margin({ right: 10 })

          TextInput({ placeholder: '公司/地铁/小区，马上搜索' })
            .layoutWeight(1)
            .fontSize(12)
            .placeholderColor($r('app.color.gray'))
            .placeholderFont({ size: 12 })
            .padding(0)
            .backgroundColor($r('app.color.white'))

          Column() {
          }
          .height(18)
          .width(1)
          .backgroundColor($r('app.color.line'))
          .margin({ left: 10 })

          Image($r('app.media.position')).imageStyles(18).margin({ left: 10 })
        }
      }
      .width(244)
      .height(38)
      .backgroundColor($r('app.color.white'))
      .padding({ left: PADDING, right: PADDING })
      .border({ width: 1, radius: 52, color: $r('app.color.line') })

      Image($r('app.media.message'))
        .imageStyles(24)
        .fillColor(this.fontColor)
    }
    .width('100%')
    .height(38)
    .padding({
      left: PADDING,
      right: PADDING,
      top: 4,
      bottom: 4
    })
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