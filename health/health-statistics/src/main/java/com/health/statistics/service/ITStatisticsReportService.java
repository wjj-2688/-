package com.health.statistics.service;

import java.util.List;
import com.health.statistics.domain.TStatisticsReport;

/**
 * 统计报表Service接口
 *
 * @author wjj
 * @date 2026-07-02
 */
public interface ITStatisticsReportService
{
    /**
     * 查询统计报表
     *
     * @param id 统计报表主键
     * @return 统计报表
     */
    public TStatisticsReport selectTStatisticsReportById(Long id);

    /**
     * 查询统计报表列表
     *
     * @param tStatisticsReport 统计报表
     * @return 统计报表集合
     */
    public List<TStatisticsReport> selectTStatisticsReportList(TStatisticsReport tStatisticsReport);

    /**
     * 新增统计报表
     *
     * @param tStatisticsReport 统计报表
     * @return 结果
     */
    public int insertTStatisticsReport(TStatisticsReport tStatisticsReport);

    /**
     * 修改统计报表
     *
     * @param tStatisticsReport 统计报表
     * @return 结果
     */
    public int updateTStatisticsReport(TStatisticsReport tStatisticsReport);

    /**
     * 批量删除统计报表
     *
     * @param ids 需要删除的统计报表主键集合
     * @return 结果
     */
    public int deleteTStatisticsReportByIds(Long[] ids);

    /**
     * 删除统计报表信息
     *
     * @param id 统计报表主键
     * @return 结果
     */
    public int deleteTStatisticsReportById(Long id);
}
