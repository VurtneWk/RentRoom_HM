import { ITileItem, ITileList } from "../../models/HomeData";

@Component
export default struct TileList {
  @Prop tileList: ITileList

  build() {
    Row({ space: 32 }) {
      ForEach(this.tileList, (item: ITileItem) => {
        Column({ space: 8 }) {
          Image(item.imageURL)
            .width('100%')
            .height(58)
          Row({ space: 4 }) {
            Text(item.title)
              .fontSize(12)
              .fontColor($r('app.color.black'))
            Text(item.sub_title)
              .fontSize(10)
              .fontColor($r('app.color.gray'))
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
        }
        .width(148)
      }, (item: ITileItem) => item.id + '')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({ top: 10 })
  }
}