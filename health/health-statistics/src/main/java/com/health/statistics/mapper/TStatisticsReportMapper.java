package com.health.statistics.mapper;

import java.util.List;
import com.health.statistics.domain.TStatisticsReport;

/**
 * 统计报表Mapper接口
 *
 * @author wjj
 * @date 2026-07-02
 */
public interface TStatisticsReportMapper
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
     * 删除统计报表
     *
     * @param id 统计报表主键
     * @return 结果
     */
    public int deleteTStatisticsReportById(Long id);

    /**
     * 批量删除统计报表
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTStatisticsReportByIds(Long[] ids);
}
