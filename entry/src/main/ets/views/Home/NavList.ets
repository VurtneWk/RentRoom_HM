import { INavItem, INavList } from "../../models/HomeData"

@Component
export default struct NavList {
  @Prop navList: INavList

  build() {
    Grid() {
      ForEach(this.navList, (item: INavItem) => {
        GridItem() {
          Column({ space: 8 }) {
            Image(item.imageURL)
              .width(58)
              .height(56)
              .objectFit(ImageFit.Fill)
              .borderRadius(4)
            Text(item.title)
              .fontSize(12)
              .fontColor($r('app.color.black'))
          }
        }
      }, (item: INavItem) => item.id + '')
    }
    .width('100%')
    .height(170)
    .rowsTemplate('1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(14)
    .columnsGap(32)
    .margin({ top: 24 })

  }
}