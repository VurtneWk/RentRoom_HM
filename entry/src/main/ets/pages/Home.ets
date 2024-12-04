import SwiperLayout from "../views/Home/SwiperLayout";
import { getHomeDataApi } from "../api/HomeApi";
import { BannerListDataSource } from "../models/HomeData";
import SearchBar from "../views/Home/SearchBar";

@Component
export default struct Home {
  //轮播图数据
  @State bannerList: BannerListDataSource = new BannerListDataSource()
  //获取首页数据
  getHomeData = async () => {
    const res = await getHomeDataApi()
    // this.bannerList = res.bannerList
    this.bannerList.setList(res.bannerList)
    // console.log('getHomeDataApiRes:' + JSON.stringify(res))
  }

  //页面显示时的生命周期
  aboutToAppear(): void {
    this.getHomeData()
  }

  build() {
    Scroll() {
      Stack() {
        Column() {
          SwiperLayout({ bannerList: this.bannerList })
        }
        .width('100%')

        SearchBar()
      }
      .alignContent(Alignment.Top)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.TopStart)
  }
}