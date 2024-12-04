import { IBannerItem, BannerListDataSource } from "../../models/HomeData";

@Component
export default struct SwiperLayout {
  @ObjectLink bannerList: BannerListDataSource

  build() {
    Swiper() {
      LazyForEach(this.bannerList, (banner: IBannerItem) => {
        Image(banner.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill)
      }, (banner: IBannerItem) => banner.id + '')
    }
    .width('100%')
    .height(211 - 36)
    .loop(true)
    .autoPlay(true)
    .indicator(
      new DotIndicator()
        .color($r('app.color.indicator_color'))
        .selectedColor($r('app.color.indicator_active_color')))
  }
}