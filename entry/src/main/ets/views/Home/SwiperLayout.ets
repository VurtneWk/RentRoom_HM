import { IBannerItem, BannerListDataSource } from "../../models/HomeData";
import { rvp } from "../../utils/responsive";

@Component
export default struct SwiperLayout {
  @StorageProp('topHeight') topHeight: number = 0
  @ObjectLink bannerList: BannerListDataSource

  build() {
    Swiper() {
      LazyForEach(this.bannerList, (banner: IBannerItem) => {
        Image(banner.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill)
      }, (banner: IBannerItem) => banner.id + '')
    }
    .width('100%')
    .height(rvp(175) + rvp(px2vp(this.topHeight)))
    .loop(true)
    .autoPlay(true)
    .indicator(
      new DotIndicator()
        .color($r('app.color.indicator_color'))
        .selectedColor($r('app.color.indicator_active_color')))
  }
}