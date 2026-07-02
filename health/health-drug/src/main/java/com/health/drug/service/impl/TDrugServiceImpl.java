package com.health.drug.service.impl;

import java.util.List;
import com.health.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.health.drug.mapper.TDrugMapper;
import com.health.drug.domain.TDrug;
import com.health.drug.service.ITDrugService;

/**
 * 药品清单Service业务层处理
 * 
 * @author wjj
 * @date 2026-07-02
 */
@Service
public class TDrugServiceImpl implements ITDrugService 
{
    @Autowired
    private TDrugMapper tDrugMapper;

    /**
     * 查询药品清单
     * 
     * @param id 药品清单主键
     * @return 药品清单
     */
    @Override
    public TDrug selectTDrugById(Long id)
    {
        return tDrugMapper.selectTDrugById(id);
    }

    /**
     * 查询药品清单列表
     * 
     * @param tDrug 药品清单
     * @return 药品清单
     */
    @Override
    public List<TDrug> selectTDrugList(TDrug tDrug)
    {
        return tDrugMapper.selectTDrugList(tDrug);
    }

    /**
     * 新增药品清单
     * 
     * @param tDrug 药品清单
     * @return 结果
     */
    @Override
    public int insertTDrug(TDrug tDrug)
    {
        tDrug.setCreateTime(DateUtils.getNowDate());
        return tDrugMapper.insertTDrug(tDrug);
    }

    /**
     * 修改药品清单
     * 
     * @param tDrug 药品清单
     * @return 结果
     */
    @Override
    public int updateTDrug(TDrug tDrug)
    {
        tDrug.setUpdateTime(DateUtils.getNowDate());
        return tDrugMapper.updateTDrug(tDrug);
    }

    /**
     * 批量删除药品清单
     * 
     * @param ids 需要删除的药品清单主键
     * @return 结果
     */
    @Override
    public int deleteTDrugByIds(Long[] ids)
    {
        return tDrugMapper.deleteTDrugByIds(ids);
    }

    /**
     * 删除药品清单信息
     * 
     * @param id 药品清单主键
     * @return 结果
     */
    @Override
    public int deleteTDrugById(Long id)
    {
        return tDrugMapper.deleteTDrugById(id);
    }
}
