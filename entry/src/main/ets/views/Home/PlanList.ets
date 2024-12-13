import { IPlanItem, IPlanList } from "../../models/HomeData";
import { rvp } from "../../utils/responsive";

@Component
export default struct PlanList {
  @Prop planList: IPlanList

  build() {
    Row({ space: rvp(5) }) {
      ForEach(this.planList, (item: IPlanItem) => {
        Image(item.imageURL)
          .width(rvp(78))
          .height(rvp(60))
          .objectFit(ImageFit.Fill)
      }, (item: IPlanItem) => item.id + '')
    }
    .width('100%')
    .margin({ top: rvp(18) })
  }
}