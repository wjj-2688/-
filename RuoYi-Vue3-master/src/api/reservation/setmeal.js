import request from '@/utils/request'

// 查询套餐管理列表
export function listSetmeal(query) {
  return request({
    url: '/reservation/setmeal/list',
    method: 'get',
    params: query
  })
}

// 查询套餐管理详细
export function getSetmeal(id) {
  return request({
    url: '/reservation/setmeal/' + id,
    method: 'get'
  })
}

// 新增套餐管理
export function addSetmeal(data) {
  return request({
    url: '/reservation/setmeal',
    method: 'post',
    data: data
  })
}

// 修改套餐管理
export function updateSetmeal(data) {
  return request({
    url: '/reservation/setmeal',
    method: 'put',
    data: data
  })
}

// 删除套餐管理
export function delSetmeal(id) {
  return request({
    url: '/reservation/setmeal/' + id,
    method: 'delete'
  })
}
