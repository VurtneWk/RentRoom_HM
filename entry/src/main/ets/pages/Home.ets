import SwiperLayout from "../views/Home/SwiperLayout";
import { getHomeDataApi } from "../api/HomeApi";
import { BannerListDataSource, INavList, IPlanList, ITileList, IColor } from "../models/HomeData";
import SearchBar from "../views/Home/SearchBar";
import NavList from "../views/Home/NavList";
import { PADDING } from "../constants/size";
import TileList from "../views/Home/TileList";
import PlanList from "../views/Home/PlanList";
import Ad from "../views/Home/Ad";
import RoomRecommend from "../views/Home/RoomRecommend";
import ScrollContainer from "../components/ScrollContainer/Index"

@Component
export default struct Home {
  //轮播图数据
  @State bannerList: BannerListDataSource = new BannerListDataSource()
  @State navList: INavList = []
  @State tileList: ITileList = []
  @State planList: IPlanList = []
  @State adPicture: string = ''
  //获取首页数据
  getHomeData = async () => {
    const res = await getHomeDataApi()
    // this.bannerList = res.bannerList
    this.bannerList.setList(res.bannerList)
    this.navList = res.navList
    this.tileList = res.tileList
    this.planList = res.planList
    this.adPicture = res.adPicture
    // console.log('getHomeDataApiRes:' + JSON.stringify(res))
  }

  //页面显示时的生命周期
  aboutToAppear(): void {
    this.getHomeData()
  }

  @Builder
  navBuilder($$: IColor) {
    SearchBar({ bgColor: $$.bgColor, fontColor: $$.fontColor })
  }

  @Builder
  contentBuilder() {
    SwiperLayout({ bannerList: this.bannerList })

    Column() {
      NavList({ navList: this.navList })
      TileList({ tileList: this.tileList })
      PlanList({ planList: this.planList })
      Ad({ adPicture: this.adPicture })
    }
    .width('100%')
    .padding({ left: PADDING, right: PADDING })

    RoomRecommend()
  }

  build() {

    ScrollContainer({
      navBuilderParams: this.navBuilder,
      //contentBuilder里需要使用this
      //如果不包裹一层 this就是undefined
      contentBuilderParams: () => {
        this.contentBuilder()
      }
    })

  }
}
