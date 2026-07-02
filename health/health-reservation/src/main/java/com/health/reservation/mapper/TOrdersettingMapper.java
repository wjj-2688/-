package com.health.reservation.mapper;

import java.util.List;
import com.health.reservation.domain.TOrdersetting;
import com.health.reservation.vo.OrderSettingVO;
import org.apache.ibatis.annotations.Param;

public interface TOrdersettingMapper 
{
    public TOrdersetting selectTOrdersettingById(Long id);
    public List<TOrdersetting> selectTOrdersettingList(TOrdersetting tOrdersetting);
    public List<OrderSettingVO> getOrderSettingByMonth(@Param("month") String month);
    public int insertTOrdersetting(TOrdersetting tOrdersetting);
    public int updateTOrdersetting(TOrdersetting tOrdersetting);
    public int deleteTOrdersettingById(Long id);
    public int deleteTOrdersettingByIds(Long[] ids);
}
