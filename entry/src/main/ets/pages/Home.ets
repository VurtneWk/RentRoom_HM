import SwiperLayout from "../views/Home/SwiperLayout";
import { getHomeDataApi } from "../api/HomeApi";
import { JSON } from "@kit.ArkTS";
import { IBannerList } from "../models/HomeData";

@Component
export default struct Home {
  //轮播图数据
  @State bannerList: IBannerList = []
  //获取首页数据
  getHomeData = async () => {
    const res = await getHomeDataApi()
    this.bannerList = res.bannerList
    console.log('getHomeDataApiRes:' + JSON.stringify(res))
  }

  //页面显示时的生命周期
  aboutToAppear(): void {
    this.getHomeData()
  }

  build() {
    Scroll() {
      Column() {
        SwiperLayout({ bannerList: this.bannerList })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.TopStart)
  }
}