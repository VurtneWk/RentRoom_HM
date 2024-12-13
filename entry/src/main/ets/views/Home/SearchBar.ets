import { PADDING } from "../../constants/size"
import { rvp } from "../../utils/responsive"

@Component
export default struct SearchBar {
  @Prop fontColor: string

  build() {
    Row({ space: PADDING }) {
      Text("北京").fontSize(rvp(14)).fontColor(this.fontColor)
      Stack() {
        Row() {

          Image($r('app.media.search')).imageStyles(rvp(18)).margin({ right: rvp(10) })

          TextInput({ placeholder: '公司/地铁/小区，马上搜索' })
            .layoutWeight(1)
            .fontSize(rvp(12))
            .placeholderColor($r('app.color.gray'))
            .placeholderFont({ size: rvp(12) })
            .padding(0)
            .backgroundColor($r('app.color.white'))

          Column() {
          }
          .height(18)
          .width(1)
          .backgroundColor($r('app.color.line'))
          .margin({ left: rvp(10) })

          Image($r('app.media.position')).imageStyles(18).margin({ left: rvp(10) })
        }
      }
      .width(244)
      .height(38)
      .backgroundColor($r('app.color.white'))
      .padding({ left: PADDING, right: PADDING })
      .border({ width: rvp(1), radius: rvp(52), color: $r('app.color.line') })

      Image($r('app.media.message'))
        .imageStyles(rvp(24))
        .fillColor(this.fontColor)
    }
    .width('100%')
    .height(rvp(38))
    .padding({
      left: rvp(PADDING),
      right: rvp(PADDING),
      top: rvp(4),
      bottom: rvp(4)
    })
  }
}

@Extend(Image)
function imageStyles(size: number) {
  .width(size).height(size).objectFit(ImageFit.Fill)
}
