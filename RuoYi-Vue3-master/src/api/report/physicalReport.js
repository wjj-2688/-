import request from '@/utils/request'

// 查询体检报告列表
export function listPhysicalReport(query) {
  return request({
    url: '/report/physical/list',
    method: 'get',
    params: query
  })
}

// 查询体检报告详细
export function getPhysicalReport(id) {
  return request({
    url: '/report/physical/' + id,
    method: 'get'
  })
}

// 新增体检报告
export function addPhysicalReport(data) {
  return request({
    url: '/report/physical',
    method: 'post',
    data: data
  })
}

// 修改体检报告
export function updatePhysicalReport(data) {
  return request({
    url: '/report/physical',
    method: 'put',
    data: data
  })
}

// 删除体检报告
export function delPhysicalReport(id) {
  return request({
    url: '/report/physical/' + id,
    method: 'delete'
  })
}

// 体检报告统计
export function statsPhysicalReport(query) {
  return request({
    url: '/report/physical/stats',
    method: 'get',
    params: query
  })
}
