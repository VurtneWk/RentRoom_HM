import SwiperLayout from "../views/Home/SwiperLayout";
import { getHomeDataApi } from "../api/HomeApi";
import { BannerListDataSource, INavList, IPlanList, ITileList } from "../models/HomeData";
import SearchBar from "../views/Home/SearchBar";
import NavList from "../views/Home/NavList";
import { PADDING } from "../constants/size";
import TileList from "../views/Home/TileList";
import PlanList from "../views/Home/PlanList";

@Component
export default struct Home {
  //轮播图数据
  @State bannerList: BannerListDataSource = new BannerListDataSource()
  @State navList: INavList = []
  @State tileList: ITileList = []
  @State planList: IPlanList = []
  //获取首页数据
  getHomeData = async () => {
    const res = await getHomeDataApi()
    // this.bannerList = res.bannerList
    this.bannerList.setList(res.bannerList)
    this.navList = res.navList
    this.tileList = res.tileList
    this.planList = res.planList
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
          Column() {
            NavList({ navList: this.navList })
            TileList({ tileList: this.tileList })
            PlanList({ planList: this.planList })
          }
          .width('100%')
          .padding({ left: PADDING, right: PADDING })
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