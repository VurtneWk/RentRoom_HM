import { ITileItem, ITileList } from "../../models/HomeData";
import { rvp } from "../../utils/responsive";

@Component
export default struct TileList {
  @Prop tileList: ITileList

  build() {
    Row({ space: rvp(32) }) {
      ForEach(this.tileList, (item: ITileItem) => {
        Column({ space: rvp(8) }) {
          Image(item.imageURL)
            .width('100%')
            .height(rvp(58))
          Row({ space: rvp(4) }) {
            Text(item.title)
              .fontSize(rvp(12))
              .fontColor($r('app.color.black'))
            Text(item.sub_title)
              .fontSize(rvp(10))
              .fontColor($r('app.color.gray'))
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
        }
        .width(rvp(148))
      }, (item: ITileItem) => item.id + '')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({ top: rvp(10) })
  }
}