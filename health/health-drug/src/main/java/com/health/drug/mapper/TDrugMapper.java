package com.health.drug.mapper;

import java.util.List;
import com.health.drug.domain.TDrug;

/**
 * 药品清单Mapper接口
 * 
 * @author wjj
 * @date 2026-07-02
 */
public interface TDrugMapper 
{
    /**
     * 查询药品清单
     * 
     * @param id 药品清单主键
     * @return 药品清单
     */
    public TDrug selectTDrugById(Long id);

    /**
     * 查询药品清单列表
     * 
     * @param tDrug 药品清单
     * @return 药品清单集合
     */
    public List<TDrug> selectTDrugList(TDrug tDrug);

    /**
     * 新增药品清单
     * 
     * @param tDrug 药品清单
     * @return 结果
     */
    public int insertTDrug(TDrug tDrug);

    /**
     * 修改药品清单
     * 
     * @param tDrug 药品清单
     * @return 结果
     */
    public int updateTDrug(TDrug tDrug);

    /**
     * 删除药品清单
     * 
     * @param id 药品清单主键
     * @return 结果
     */
    public int deleteTDrugById(Long id);

    /**
     * 批量删除药品清单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTDrugByIds(Long[] ids);
}
