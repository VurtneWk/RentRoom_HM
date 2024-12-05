import SwiperLayout from "../views/Home/SwiperLayout";
import { getHomeDataApi } from "../api/HomeApi";
import { BannerListDataSource, INavList, IPlanList, ITileList } from "../models/HomeData";
import SearchBar from "../views/Home/SearchBar";
import NavList from "../views/Home/NavList";
import { PADDING } from "../constants/size";
import TileList from "../views/Home/TileList";
import PlanList from "../views/Home/PlanList";
import Ad from "../views/Home/Ad";
import RoomRecommend from "../views/Home/RoomRecommend";

@Component
export default struct Home {
  //轮播图数据
  @State bannerList: BannerListDataSource = new BannerListDataSource()
  @State navList: INavList = []
  @State tileList: ITileList = []
  @State planList: IPlanList = []
  @State adPicture: string = ''
  //y轴滚动距离
  scrollY: number = 0
  @State bgColor: string = 'rgba(0, 0, 0, 0)'
  @State fontColor: string = 'rgb(255, 255, 255)'
  colorOpacity: number = 0
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

  build() {
    Stack() {
      Scroll() {
        Column() {
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
        .width('100%')

      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .onDidScroll(this.handleScroll)

      SearchBar({ bgColor: this.bgColor, fontColor: this.fontColor })

    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.TopStart)

  }

  handleScroll = (xOffset: number, yOffset: number, scrollState: ScrollState) => {
    this.scrollY += yOffset
    if (this.scrollY < 0) {
      this.scrollY = 0;
    }
    this.calcColor()
    console.log(`this.scrollY => ${this.scrollY}`)
  }
  // 计算颜色
  calcColor = () => {
    // 滚动计算的 scrollY 的值到达顶部可能不是 0，给点误差
    if (this.scrollY < 10) {
      this.bgColor = 'rgba(255, 255, 255, 0)'
      this.fontColor = 'rgba(255, 255, 255,1)'
    } else if (this.scrollY <= 100) {
      this.colorOpacity = (this.scrollY - 10) / (100 - 10)
      this.bgColor = `rgba(255, 255, 255, ${this.colorOpacity})`
      this.fontColor = `rgba(0, 0, 0,${this.colorOpacity})`
    } else {
      this.bgColor = 'rgb(255, 255, 255)'
      this.fontColor = 'rgb(0, 0, 0)'
    }
  }
}