import request from '@/utils/request'

// 查询药品清单列表
export function listDruglist(query) {
  return request({
    url: '/drug/druglist/list',
    method: 'get',
    params: query
  })
}

// 查询药品清单详细
export function getDruglist(id) {
  return request({
    url: '/drug/druglist/' + id,
    method: 'get'
  })
}

// 新增药品清单
export function addDruglist(data) {
  return request({
    url: '/drug/druglist',
    method: 'post',
    data: data
  })
}

// 修改药品清单
export function updateDruglist(data) {
  return request({
    url: '/drug/druglist',
    method: 'put',
    data: data
  })
}

// 删除药品清单
export function delDruglist(id) {
  return request({
    url: '/drug/druglist/' + id,
    method: 'delete'
  })
}
