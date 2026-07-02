package com.health.drug.controller;

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
import com.health.drug.domain.TDrug;
import com.health.drug.service.ITDrugService;
import com.health.common.utils.poi.ExcelUtil;
import com.health.common.core.page.TableDataInfo;

/**
 * 药品清单Controller
 * 
 * @author wjj
 * @date 2026-07-02
 */
@RestController
@RequestMapping("/drug/druglist")
public class TDrugController extends BaseController
{
    @Autowired
    private ITDrugService tDrugService;

    /**
     * 查询药品清单列表
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:list')")
    @GetMapping("/list")
    public TableDataInfo list(TDrug tDrug)
    {
        startPage();
        List<TDrug> list = tDrugService.selectTDrugList(tDrug);
        return getDataTable(list);
    }

    /**
     * 导出药品清单列表
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:export')")
    @Log(title = "药品清单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TDrug tDrug)
    {
        List<TDrug> list = tDrugService.selectTDrugList(tDrug);
        ExcelUtil<TDrug> util = new ExcelUtil<TDrug>(TDrug.class);
        util.exportExcel(response, list, "药品清单数据");
    }

    /**
     * 获取药品清单详细信息
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tDrugService.selectTDrugById(id));
    }

    /**
     * 新增药品清单
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:add')")
    @Log(title = "药品清单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TDrug tDrug)
    {
        return toAjax(tDrugService.insertTDrug(tDrug));
    }

    /**
     * 修改药品清单
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:edit')")
    @Log(title = "药品清单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TDrug tDrug)
    {
        return toAjax(tDrugService.updateTDrug(tDrug));
    }

    /**
     * 删除药品清单
     */
    @PreAuthorize("@ss.hasPermi('drug:druglist:remove')")
    @Log(title = "药品清单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tDrugService.deleteTDrugByIds(ids));
    }
}
