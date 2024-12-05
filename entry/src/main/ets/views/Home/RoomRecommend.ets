import { getRoomRecommendListApi } from "../../api/HomeApi";
import { RoomRecommendListDataSource } from "../../models/HomeData";

@Component
export default struct RoomRecommend {
  @State roomRecommendDataSource: RoomRecommendListDataSource = new RoomRecommendListDataSource([])

  aboutToAppear(): void {
    this.getRoomRecommendList()
  }

  getRoomRecommendList = async () => {
    const res = await getRoomRecommendListApi()
    this.roomRecommendDataSource = new RoomRecommendListDataSource(res)
  }

  build() {
    Column() {
      Row() {
        Text('周边房源')
          .font({ size: 16, weight: FontWeight.Bold })
          .fontColor($r('app.color.black'))
        Text('推荐')
          .font({ size: 16, weight: FontWeight.Bold })
          .fontColor($r('app.color.primary'))

        Row() {
          Text('更多推荐')
            .fontColor($r('app.color.gray_second'))
            .fontSize(10)
        }

      }
      .width('100%')
    }
    .margin({ top: 24 })
  }
}