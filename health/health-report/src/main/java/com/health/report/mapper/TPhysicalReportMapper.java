package com.health.report.mapper;

import java.util.List;
import com.health.report.domain.TPhysicalReport;

/**
 * 体检报告Mapper接口
 *
 * @author wjj
 * @date 2026-07-02
 */
public interface TPhysicalReportMapper
{
    /**
     * 查询体检报告
     *
     * @param id 体检报告主键
     * @return 体检报告
     */
    public TPhysicalReport selectTPhysicalReportById(Long id);

    /**
     * 查询体检报告列表
     *
     * @param tPhysicalReport 体检报告
     * @return 体检报告集合
     */
    public List<TPhysicalReport> selectTPhysicalReportList(TPhysicalReport tPhysicalReport);

    /**
     * 新增体检报告
     *
     * @param tPhysicalReport 体检报告
     * @return 结果
     */
    public int insertTPhysicalReport(TPhysicalReport tPhysicalReport);

    /**
     * 修改体检报告
     *
     * @param tPhysicalReport 体检报告
     * @return 结果
     */
    public int updateTPhysicalReport(TPhysicalReport tPhysicalReport);

    /**
     * 删除体检报告
     *
     * @param id 体检报告主键
     * @return 结果
     */
    public int deleteTPhysicalReportById(Long id);

    /**
     * 批量删除体检报告
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTPhysicalReportByIds(Long[] ids);

    /**
     * 统计体检报告（用于报表）
     *
     * @param tPhysicalReport 体检报告
     * @return 统计结果
     */
    public List<TPhysicalReport> selectTPhysicalReportStats(TPhysicalReport tPhysicalReport);
}
