import request from '@/utils/request'

// 查询统计报表列表
export function listStatisticsReport(query) {
  return request({
    url: '/statistics/report/list',
    method: 'get',
    params: query
  })
}

// 查询统计报表详细
export function getStatisticsReport(id) {
  return request({
    url: '/statistics/report/' + id,
    method: 'get'
  })
}

// 新增统计报表
export function addStatisticsReport(data) {
  return request({
    url: '/statistics/report',
    method: 'post',
    data: data
  })
}

// 修改统计报表
export function updateStatisticsReport(data) {
  return request({
    url: '/statistics/report',
    method: 'put',
    data: data
  })
}

// 删除统计报表
export function delStatisticsReport(id) {
  return request({
    url: '/statistics/report/' + id,
    method: 'delete'
  })
}
