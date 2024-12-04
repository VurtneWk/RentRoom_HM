import { IPlanItem, IPlanList } from "../../models/HomeData";

@Component
export default struct PlanList {
  @Prop planList: IPlanList

  build() {
    Row({ space: 5 }) {
      ForEach(this.planList, (item: IPlanItem) => {
        Image(item.imageURL)
          .width(78)
          .height(60)
          .objectFit(ImageFit.Fill)
      }, (item: IPlanItem) => item.id + '')
    }
    .width('100%')
    .margin({ top: 18 })
  }
}