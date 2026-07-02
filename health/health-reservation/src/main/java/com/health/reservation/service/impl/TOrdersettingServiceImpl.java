package com.health.reservation.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.health.reservation.mapper.TOrdersettingMapper;
import com.health.reservation.domain.TOrdersetting;
import com.health.reservation.service.ITOrdersettingService;
import com.health.reservation.vo.OrderSettingVO;

@Service
public class TOrdersettingServiceImpl implements ITOrdersettingService 
{
    @Autowired
    private TOrdersettingMapper tOrdersettingMapper;

    @Override
    public TOrdersetting selectTOrdersettingById(Long id)
    {
        return tOrdersettingMapper.selectTOrdersettingById(id);
    }

    @Override
    public List<TOrdersetting> selectTOrdersettingList(TOrdersetting tOrdersetting)
    {
        return tOrdersettingMapper.selectTOrdersettingList(tOrdersetting);
    }

    @Override
    public List<OrderSettingVO> getOrderSettingByMonth(String month)
    {
        return tOrdersettingMapper.getOrderSettingByMonth(month);
    }

    @Override
    public int insertTOrdersetting(TOrdersetting tOrdersetting)
    {
        return tOrdersettingMapper.insertTOrdersetting(tOrdersetting);
    }

    @Override
    public int updateTOrdersetting(TOrdersetting tOrdersetting)
    {
        return tOrdersettingMapper.updateTOrdersetting(tOrdersetting);
    }

    @Override
    public String importTOrdersetting(List<TOrdersetting> list)
    {
        int successCount = 0;
        int failCount = 0;
        StringBuilder sb = new StringBuilder();
        for (TOrdersetting setting : list)
        {
            try
            {
                tOrdersettingMapper.insertTOrdersetting(setting);
                successCount++;
            }
            catch (Exception e)
            {
                failCount++;
                sb.append(e.getMessage()).append("<br/>");
            }
        }
        return "成功导入 " + successCount + " 条" + (failCount > 0 ? "，失败 " + failCount + " 条：" + sb.toString() : "");
    }

    @Override
    public int deleteTOrdersettingByIds(Long[] ids)
    {
        return tOrdersettingMapper.deleteTOrdersettingByIds(ids);
    }

    @Override
    public int deleteTOrdersettingById(Long id)
    {
        return tOrdersettingMapper.deleteTOrdersettingById(id);
    }
}
