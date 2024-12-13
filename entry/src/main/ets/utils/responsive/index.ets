// 获取屏幕宽度，进行缓存
const DESIGN_WIDTH = 360

// 将元素按照原来比例进行转化
export function rvp(val: number) {
  /*
    * 设计稿总宽度：360 (固定值)
    * 设计稿某个元素大小：120 -> val
    * 实际设备屏幕宽度：400 -> 通过 window.getWindowProperties().windowRect.width 方式获取, 得到单位是 px，需要转 vp 计算
    * 元素实际大小：x
    * x / 400 = val / 360
    *
    * 解方程式得出: x = val / 360 * 实际设备屏幕宽度
   */
  return val / DESIGN_WIDTH * (AppStorage.Get('windowWidth') as number)
}