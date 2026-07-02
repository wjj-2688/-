package com.health.statistics.service.impl;

import java.util.List;
import com.health.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.health.statistics.mapper.TStatisticsReportMapper;
import com.health.statistics.domain.TStatisticsReport;
import com.health.statistics.service.ITStatisticsReportService;

/**
 * 统计报表Service业务层处理
 *
 * @author wjj
 * @date 2026-07-02
 */
@Service
public class TStatisticsReportServiceImpl implements ITStatisticsReportService
{
    @Autowired
    private TStatisticsReportMapper tStatisticsReportMapper;

    /**
     * 查询统计报表
     *
     * @param id 统计报表主键
     * @return 统计报表
     */
    @Override
    public TStatisticsReport selectTStatisticsReportById(Long id)
    {
        return tStatisticsReportMapper.selectTStatisticsReportById(id);
    }

    /**
     * 查询统计报表列表
     *
     * @param tStatisticsReport 统计报表
     * @return 统计报表
     */
    @Override
    public List<TStatisticsReport> selectTStatisticsReportList(TStatisticsReport tStatisticsReport)
    {
        return tStatisticsReportMapper.selectTStatisticsReportList(tStatisticsReport);
    }

    /**
     * 新增统计报表
     *
     * @param tStatisticsReport 统计报表
     * @return 结果
     */
    @Override
    public int insertTStatisticsReport(TStatisticsReport tStatisticsReport)
    {
        tStatisticsReport.setCreateTime(DateUtils.getNowDate());
        return tStatisticsReportMapper.insertTStatisticsReport(tStatisticsReport);
    }

    /**
     * 修改统计报表
     *
     * @param tStatisticsReport 统计报表
     * @return 结果
     */
    @Override
    public int updateTStatisticsReport(TStatisticsReport tStatisticsReport)
    {
        tStatisticsReport.setUpdateTime(DateUtils.getNowDate());
        return tStatisticsReportMapper.updateTStatisticsReport(tStatisticsReport);
    }

    /**
     * 批量删除统计报表
     *
     * @param ids 需要删除的统计报表主键
     * @return 结果
     */
    @Override
    public int deleteTStatisticsReportByIds(Long[] ids)
    {
        return tStatisticsReportMapper.deleteTStatisticsReportByIds(ids);
    }

    /**
     * 删除统计报表信息
     *
     * @param id 统计报表主键
     * @return 结果
     */
    @Override
    public int deleteTStatisticsReportById(Long id)
    {
        return tStatisticsReportMapper.deleteTStatisticsReportById(id);
    }
}
