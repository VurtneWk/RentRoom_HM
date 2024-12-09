import { IColor } from "../../models/HomeData"

@Component
export default struct Index {
  @Builder
  defaultBuilder() {
  }

  //@BuilderParam 该装饰器用于声明任意UI描述的一个元素，类似 slot 占位符
  @BuilderParam navBuilderParams: ($$: IColor) => void = this.defaultBuilder
  @BuilderParam contentBuilderParams: () => void = this.defaultBuilder
  //y轴滚动距离
  scrollY: number = 0
  @State bgColor: string = 'rgba(0, 0, 0, 0)'
  @State fontColor: string = 'rgb(255, 255, 255)'
  colorOpacity: number = 0
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

  build() {
    Stack() {
      Scroll() {
        Column() {
          this.contentBuilderParams()
        }
        .width('100%')

      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .onDidScroll(this.handleScroll)

      this.navBuilderParams({ bgColor: this.bgColor, fontColor: this.fontColor })

    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.TopStart)
  }
}