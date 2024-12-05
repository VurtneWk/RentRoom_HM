import { getRoomRecommendListApi } from "../../api/HomeApi";
import { BORDER_RADIUS, PADDING, PADDING_S } from "../../constants/size";
import { IRoomRecommendItem, ITagItem, RoomRecommendListDataSource } from "../../models/HomeData";

@Component
export default struct RoomRecommend {
  @State roomRecommendDataSource: RoomRecommendListDataSource = new RoomRecommendListDataSource([])

  aboutToAppear(): void {
    this.getRoomRecommendList()
  }

  getRoomRecommendList = async () => {
    const res = await getRoomRecommendListApi()
    this.roomRecommendDataSource.setList(res)
    // this.roomRecommendDataSource = new RoomRecommendListDataSource(res)
    console.log('roomRecommendDataSource==>', this.roomRecommendDataSource.totalCount(), JSON.stringify(res))
  }

  build() {
    Column() {
      this.RoomRecommendNav()
      this.RoomRecommendList()
    }
    .margin({ top: 32 })
  }

  @Builder
  RoomRecommendNav() {
    Row() {
      Text() {
        Span('周边房源').fontColor($r('app.color.black'))
        Span('推荐').fontColor($r('app.color.primary'))
      }
      .fontSize(16)
      .fontWeight(700)

      Row({ space: 6 }) {
        Text('更多推荐')
          .fontColor($r('app.color.gray_second'))
          .fontSize(10)
        Image($r('app.media.arrow_right'))
          .width(4)
          .height(8)
      }
    }
    .width('100%')
    .padding({ left: PADDING, right: PADDING, bottom: PADDING_S })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  RoomRecommendList() {
    Grid() {
      LazyForEach(this.roomRecommendDataSource, (item: IRoomRecommendItem) => {
        GridItem() {
          Column() {
            //图片
            Stack() {
              Image(item.housePicture)
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Fill)
                .borderRadius({ topLeft: BORDER_RADIUS, topRight: BORDER_RADIUS })
              Image($r('app.media.room_text_bg'))
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Fill)
                .borderRadius({ topLeft: BORDER_RADIUS, topRight: BORDER_RADIUS })
              Row({ space: 6 }) {
                Image($r('app.media.location'))
                  .width(12).height(14)
                Text(item.address)
                  .fontSize(10)
                  .fontColor($r('app.color.white'))
              }
              .margin({ left: 8, bottom: 8 })
            }
            .width('100%')
            .height(120)
            .alignContent(Alignment.BottomStart)

            //文本区域
            Column() {
              Row() {
                Text() {
                  Span(item.rentPriceListing)
                    .fontSize(14)
                  Span(item.rentPriceUnit)
                    .fontSize(12)
                }
                .fontColor($r('app.color.price'))

                Text(item.rentArea + '㎡')
                  .fontSize(10)
                  .fontColor($r('app.color.gray'))
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)


              Text(item.houseTitle)
                .fontSize(12)
                .fontColor($r('app.color.black'))
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .margin({ top: 2 })

              Row() {
                ForEach(item.tags.slice(0, 2), (tag: ITagItem, index) => {
                  Text(tag.name)
                    .fontSize(10)
                    .fontColor(index === 0 ? $r('app.color.white') : '#B3B3B3')
                    .backgroundColor(index === 0 ? $r('app.color.primary') : $r('app.color.bg_gray'))
                    .borderRadius(2)
                    .height(16)
                    .padding({ left: 6, right: 6 })
                    .margin({ right: 6 })
                }, (tag: ITagItem) => tag.name)
              }
              .width('100%')
              .margin({ top: 10 })
            }
            .padding(PADDING_S)
            .width('100%')
          }
          .width('100%')
          .borderRadius(BORDER_RADIUS)
          .backgroundColor($r('app.color.white'))
        }

      }, (item: IRoomRecommendItem) => item.id)
    }
    .width('100%')
    .columnsGap(8)
    .rowsGap(8)
    .padding(PADDING)
    .backgroundColor($r('app.color.bg_gray'))
    .columnsTemplate('1fr 1fr')
  }
}