@Observed
export class BannerListDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []
  bannerList: IBannerList = []

  getData(index: number): IBannerItem {
    return this.bannerList[index]
  }

  totalCount(): number {
    return this.bannerList.length
  }

  setData(item: IBannerItem) {
    this.bannerList.push(item)
    this.notifyDataAdd(this.bannerList.length - 1)
  }

  setList(list: IBannerList) {
    this.bannerList = list
    this.notifyDataReload()
  }

  //下面的类容直接复制即可
  //https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-rendering-control-lazyforeach-V5#stringdata%E7%B1%BB%E5%9E%8B%E6%95%B0%E7%BB%84%E7%9A%84basicdatasource%E4%BB%A3%E7%A0%81
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}


export interface IHomeData {
  "bannerList": IBannerList
  "navList": INavList
  "tileList": ITileList
  "planList": IPlanList
  "adPicture": string
}

// 计划列表类型
export interface IPlanItem {
  "id": number
  "imageURL": string
}

export type IPlanList = IPlanItem[]

// 瓷片列表类型
export interface ITileItem {
  "id": number
  "imageURL": string
  "title": string
  "sub_title": string
}

export type ITileList = ITileItem[]

// 导航列表类型
export interface INavItem {
  "id": number
  "title": string
  "imageURL": string
}

export type INavList = INavItem[]

// 轮播图类型
export interface IBannerItem {
  "id": number
  "name": string
  "imageURL": string
}

export type IBannerList = IBannerItem[]

//首页房源推荐数据
export interface IRoomRecommendItem {
  "id": string,
  "housePicture": string,
  "tags": ITagList,
  "houseTitle": string,
  "address": string,
  "rentPriceUnit": string,
  "rentPriceListing": string,
  "rentArea": string
}

export interface ITagItem {
  "name": string
}

export type ITagList = ITagItem[]

export type IRoomRecommendList = IRoomRecommendItem[]

export class RoomRecommendListDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []
  roomRecommendList: IRoomRecommendList = []

  constructor(roomRecommendList: IRoomRecommendList) {
    this.roomRecommendList = roomRecommendList
  }

  getData(index: number): IRoomRecommendItem {
    return this.roomRecommendList[index]
  }

  totalCount(): number {
    return this.roomRecommendList.length
  }

  setData(item: IRoomRecommendItem) {
    this.roomRecommendList.push(item)
    this.notifyDataAdd(this.roomRecommendList.length - 1)
  }

  setList(list: IRoomRecommendList) {
    this.roomRecommendList = list
    this.notifyDataReload()
  }

  //下面的类容直接复制即可
  //https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-rendering-control-lazyforeach-V5#stringdata%E7%B1%BB%E5%9E%8B%E6%95%B0%E7%BB%84%E7%9A%84basicdatasource%E4%BB%A3%E7%A0%81
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}