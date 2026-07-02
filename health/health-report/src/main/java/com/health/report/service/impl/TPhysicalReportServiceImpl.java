package com.health.report.service.impl;

import java.util.List;
import com.health.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.health.report.mapper.TPhysicalReportMapper;
import com.health.report.domain.TPhysicalReport;
import com.health.report.service.ITPhysicalReportService;

/**
 * 体检报告Service业务层处理
 *
 * @author wjj
 * @date 2026-07-02
 */
@Service
public class TPhysicalReportServiceImpl implements ITPhysicalReportService
{
    @Autowired
    private TPhysicalReportMapper tPhysicalReportMapper;

    /**
     * 查询体检报告
     *
     * @param id 体检报告主键
     * @return 体检报告
     */
    @Override
    public TPhysicalReport selectTPhysicalReportById(Long id)
    {
        return tPhysicalReportMapper.selectTPhysicalReportById(id);
    }

    /**
     * 查询体检报告列表
     *
     * @param tPhysicalReport 体检报告
     * @return 体检报告
     */
    @Override
    public List<TPhysicalReport> selectTPhysicalReportList(TPhysicalReport tPhysicalReport)
    {
        return tPhysicalReportMapper.selectTPhysicalReportList(tPhysicalReport);
    }

    /**
     * 新增体检报告
     *
     * @param tPhysicalReport 体检报告
     * @return 结果
     */
    @Override
    public int insertTPhysicalReport(TPhysicalReport tPhysicalReport)
    {
        tPhysicalReport.setCreateTime(DateUtils.getNowDate());
        return tPhysicalReportMapper.insertTPhysicalReport(tPhysicalReport);
    }

    /**
     * 修改体检报告
     *
     * @param tPhysicalReport 体检报告
     * @return 结果
     */
    @Override
    public int updateTPhysicalReport(TPhysicalReport tPhysicalReport)
    {
        tPhysicalReport.setUpdateTime(DateUtils.getNowDate());
        return tPhysicalReportMapper.updateTPhysicalReport(tPhysicalReport);
    }

    /**
     * 批量删除体检报告
     *
     * @param ids 需要删除的体检报告主键
     * @return 结果
     */
    @Override
    public int deleteTPhysicalReportByIds(Long[] ids)
    {
        return tPhysicalReportMapper.deleteTPhysicalReportByIds(ids);
    }

    /**
     * 删除体检报告信息
     *
     * @param id 体检报告主键
     * @return 结果
     */
    @Override
    public int deleteTPhysicalReportById(Long id)
    {
        return tPhysicalReportMapper.deleteTPhysicalReportById(id);
    }

    /**
     * 统计体检报告（用于报表）
     *
     * @param tPhysicalReport 体检报告
     * @return 统计结果
     */
    @Override
    public List<TPhysicalReport> selectTPhysicalReportStats(TPhysicalReport tPhysicalReport)
    {
        return tPhysicalReportMapper.selectTPhysicalReportStats(tPhysicalReport);
    }
}
