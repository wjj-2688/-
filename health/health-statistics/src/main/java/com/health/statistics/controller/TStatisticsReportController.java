package com.health.statistics.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.health.common.annotation.Log;
import com.health.common.core.controller.BaseController;
import com.health.common.core.domain.AjaxResult;
import com.health.common.enums.BusinessType;
import com.health.statistics.domain.TStatisticsReport;
import com.health.statistics.service.ITStatisticsReportService;
import com.health.common.utils.poi.ExcelUtil;
import com.health.common.core.page.TableDataInfo;

/**
 * 统计报表Controller
 *
 * @author wjj
 * @date 2026-07-02
 */
@RestController
@RequestMapping("/statistics/report")
public class TStatisticsReportController extends BaseController
{
    @Autowired
    private ITStatisticsReportService tStatisticsReportService;

    /**
     * 查询统计报表列表
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:list')")
    @GetMapping("/list")
    public TableDataInfo list(TStatisticsReport tStatisticsReport)
    {
        startPage();
        List<TStatisticsReport> list = tStatisticsReportService.selectTStatisticsReportList(tStatisticsReport);
        return getDataTable(list);
    }

    /**
     * 导出统计报表列表
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:export')")
    @Log(title = "统计报表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TStatisticsReport tStatisticsReport)
    {
        List<TStatisticsReport> list = tStatisticsReportService.selectTStatisticsReportList(tStatisticsReport);
        ExcelUtil<TStatisticsReport> util = new ExcelUtil<TStatisticsReport>(TStatisticsReport.class);
        util.exportExcel(response, list, "统计报表数据");
    }

    /**
     * 获取统计报表详细信息
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tStatisticsReportService.selectTStatisticsReportById(id));
    }

    /**
     * 新增统计报表
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:add')")
    @Log(title = "统计报表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TStatisticsReport tStatisticsReport)
    {
        return toAjax(tStatisticsReportService.insertTStatisticsReport(tStatisticsReport));
    }

    /**
     * 修改统计报表
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:edit')")
    @Log(title = "统计报表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TStatisticsReport tStatisticsReport)
    {
        return toAjax(tStatisticsReportService.updateTStatisticsReport(tStatisticsReport));
    }

    /**
     * 删除统计报表
     */
    @PreAuthorize("@ss.hasPermi('statistics:report:remove')")
    @Log(title = "统计报表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tStatisticsReportService.deleteTStatisticsReportByIds(ids));
    }
}
