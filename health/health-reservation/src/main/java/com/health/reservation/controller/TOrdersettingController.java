package com.health.reservation.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.health.common.annotation.Log;
import com.health.common.core.controller.BaseController;
import com.health.common.core.domain.AjaxResult;
import com.health.common.enums.BusinessType;
import com.health.reservation.domain.TOrdersetting;
import com.health.reservation.service.ITOrdersettingService;
import com.health.reservation.vo.OrderSettingVO;
import com.health.common.utils.poi.ExcelUtil;
import com.health.common.core.page.TableDataInfo;

@RestController
@RequestMapping("/reservation/ordersetting")
public class TOrdersettingController extends BaseController
{
    @Autowired
    private ITOrdersettingService tOrdersettingService;

    // ==================== 3.1.3 查询当前月预约设置数据 ====================

    @GetMapping("/getOrderSettingByMonth")
    public AjaxResult getOrderSettingByMonth(@RequestParam String month)
    {
        try {
            List<OrderSettingVO> list = tOrdersettingService.getOrderSettingByMonth(month);
            return AjaxResult.success(list);
        } catch (Exception e) {
            return AjaxResult.error("获取预约设置失败：" + e.getMessage());
        }
    }

    // ==================== 3.1.4 新增预约设置 ====================

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:add')")
    @Log(title = "预约设置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TOrdersetting tOrdersetting)
    {
        tOrdersettingService.insertTOrdersetting(tOrdersetting);
        return AjaxResult.success();
    }

    // ==================== 3.1.5 修改预约设置 ====================

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:edit')")
    @Log(title = "预约设置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TOrdersetting tOrdersetting)
    {
        tOrdersettingService.updateTOrdersetting(tOrdersetting);
        return AjaxResult.success();
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:edit')")
    @Log(title = "预约设置", businessType = BusinessType.UPDATE)
    @PutMapping("/{id:\\d+}")
    public AjaxResult editById(@PathVariable("id") Long id, @RequestBody TOrdersetting tOrdersetting)
    {
        tOrdersetting.setId(id);
        tOrdersettingService.updateTOrdersetting(tOrdersetting);
        return AjaxResult.success();
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:add')")
    @Log(title = "预约设置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addByPath(@RequestBody TOrdersetting tOrdersetting)
    {
        tOrdersettingService.insertTOrdersetting(tOrdersetting);
        return AjaxResult.success();
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:edit')")
    @Log(title = "预约设置", businessType = BusinessType.UPDATE)
    @PostMapping("/{id:\\d+}")
    public AjaxResult saveById(@PathVariable("id") Long id, @RequestBody TOrdersetting tOrdersetting)
    {
        tOrdersetting.setId(id);
        tOrdersettingService.updateTOrdersetting(tOrdersetting);
        return AjaxResult.success();
    }

    // ==================== 3.1.6 模板下载 ====================

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:list')")
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<TOrdersetting> util = new ExcelUtil<TOrdersetting>(TOrdersetting.class);
        util.importTemplateExcel(response, "预约设置数据");
    }

    // ==================== 3.1.7 文件上传导入 ====================

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:add')")
    @Log(title = "预约设置", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<TOrdersetting> util = new ExcelUtil<TOrdersetting>(TOrdersetting.class);
        List<TOrdersetting> list = util.importExcel(file.getInputStream());
        String message = tOrdersettingService.importTOrdersetting(list);
        return AjaxResult.success(message);
    }

    // ==================== 公共 CRUD ====================

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:list')")
    @GetMapping("/list")
    public TableDataInfo list(TOrdersetting tOrdersetting)
    {
        startPage();
        List<TOrdersetting> list = tOrdersettingService.selectTOrdersettingList(tOrdersetting);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:export')")
    @Log(title = "预约设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TOrdersetting tOrdersetting)
    {
        List<TOrdersetting> list = tOrdersettingService.selectTOrdersettingList(tOrdersetting);
        ExcelUtil<TOrdersetting> util = new ExcelUtil<TOrdersetting>(TOrdersetting.class);
        util.exportExcel(response, list, "预约设置数据");
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:query')")
    @GetMapping("/{id:\\d+}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tOrdersettingService.selectTOrdersettingById(id));
    }

    @PreAuthorize("@ss.hasPermi('reservation:ordersetting:remove')")
    @Log(title = "预约设置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tOrdersettingService.deleteTOrdersettingByIds(ids));
    }
}