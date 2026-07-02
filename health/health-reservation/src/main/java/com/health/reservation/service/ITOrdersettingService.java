package com.health.reservation.service;

import java.util.List;
import com.health.reservation.domain.TOrdersetting;
import com.health.reservation.vo.OrderSettingVO;

public interface ITOrdersettingService 
{
    // 3.1.3 按月份查询
    public List<OrderSettingVO> getOrderSettingByMonth(String month);

    // 3.1.4 新增
    public int insertTOrdersetting(TOrdersetting tOrdersetting);

    // 3.1.5 修改
    public int updateTOrdersetting(TOrdersetting tOrdersetting);

    // 3.1.7 Excel 批量导入
    public String importTOrdersetting(List<TOrdersetting> list);

    // 公共 CRUD
    public TOrdersetting selectTOrdersettingById(Long id);
    public List<TOrdersetting> selectTOrdersettingList(TOrdersetting tOrdersetting);
    public int deleteTOrdersettingByIds(Long[] ids);
    public int deleteTOrdersettingById(Long id);
}
