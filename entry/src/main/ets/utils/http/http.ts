import axios from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'
import type { AnyObject } from '../../models/HttpModels'

const request = axios.create({
  baseURL: 'http://192.168.3.26:6060'
})

request.interceptors.request.use(
  (config) => {
    return config
  }
)

request.interceptors.response.use(
  (response) => {
    if (response.data.code === 200) {
      return response.data.data
    } else {
      promptAction.showToast(response.data.message)
      return Promise.reject(response.data.message)
    }
  },
  (error) => {
    promptAction.showToast(error.message)
    return Promise.reject(error.message)
  }
)

export default class Http {
  get<T>(url: string, params?: AnyObject) {
    return request.get<null, T>(url, {
      params
    })
  }

  post<T>(url: string, data?: AnyObject) {
    return request.post<null, T>(url, data)
  }

  put<T>(url: string, data?: AnyObject) {
    return request.put<null, T>(url, data)
  }

  delete<T>(url: string, params?: AnyObject) {
    return request.delete<null, T>(url, {
      params
    })
  }
}
