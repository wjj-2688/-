package com.health.report.controller;

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
import com.health.report.domain.TPhysicalReport;
import com.health.report.service.ITPhysicalReportService;
import com.health.common.utils.poi.ExcelUtil;
import com.health.common.core.page.TableDataInfo;

/**
 * 体检报告Controller
 *
 * @author wjj
 * @date 2026-07-02
 */
@RestController
@RequestMapping("/report/physical")
public class TPhysicalReportController extends BaseController
{
    @Autowired
    private ITPhysicalReportService tPhysicalReportService;

    /**
     * 查询体检报告列表
     */
    @PreAuthorize("@ss.hasPermi('report:physical:list')")
    @GetMapping("/list")
    public TableDataInfo list(TPhysicalReport tPhysicalReport)
    {
        startPage();
        List<TPhysicalReport> list = tPhysicalReportService.selectTPhysicalReportList(tPhysicalReport);
        return getDataTable(list);
    }

    /**
     * 导出体检报告列表
     */
    @PreAuthorize("@ss.hasPermi('report:physical:export')")
    @Log(title = "体检报告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TPhysicalReport tPhysicalReport)
    {
        List<TPhysicalReport> list = tPhysicalReportService.selectTPhysicalReportList(tPhysicalReport);
        ExcelUtil<TPhysicalReport> util = new ExcelUtil<TPhysicalReport>(TPhysicalReport.class);
        util.exportExcel(response, list, "体检报告数据");
    }

    /**
     * 获取体检报告详细信息
     */
    @PreAuthorize("@ss.hasPermi('report:physical:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tPhysicalReportService.selectTPhysicalReportById(id));
    }

    /**
     * 新增体检报告
     */
    @PreAuthorize("@ss.hasPermi('report:physical:add')")
    @Log(title = "体检报告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TPhysicalReport tPhysicalReport)
    {
        return toAjax(tPhysicalReportService.insertTPhysicalReport(tPhysicalReport));
    }

    /**
     * 修改体检报告
     */
    @PreAuthorize("@ss.hasPermi('report:physical:edit')")
    @Log(title = "体检报告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TPhysicalReport tPhysicalReport)
    {
        return toAjax(tPhysicalReportService.updateTPhysicalReport(tPhysicalReport));
    }

    /**
     * 删除体检报告
     */
    @PreAuthorize("@ss.hasPermi('report:physical:remove')")
    @Log(title = "体检报告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tPhysicalReportService.deleteTPhysicalReportByIds(ids));
    }

    /**
     * 体检报告统计
     */
    @PreAuthorize("@ss.hasPermi('report:physical:stats')")
    @GetMapping("/stats")
    public AjaxResult stats(TPhysicalReport tPhysicalReport)
    {
        List<TPhysicalReport> list = tPhysicalReportService.selectTPhysicalReportStats(tPhysicalReport);
        return success(list);
    }
}
