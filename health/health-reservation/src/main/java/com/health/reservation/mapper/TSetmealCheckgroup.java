package com.health.reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

/**
 * 濂楅 妫€鏌ョ粍鍏宠仈Mapper鎺ュ彛
 *
 * @author ruoyi
 * @date 2026-07-02
 */
public interface TSetmealCheckgroup
{
    /**
     * 鏌ヨ 濂楅 妫€鏌ョ粍鍏宠仈
     *
     * @param setmealId 濂楅 妫€鏌ョ粍鍏宠仈涓婚敭
     * @return 濂楅 妫€鏌ョ粍鍏宠仈
     */
    public com.health.reservation.domain.TSetmealCheckgroup selectTOrdersettingBySetmealId(Long setmealId);

    /**
     * 鏌ヨ 濂楅 妫€鏌ョ粍鍏宠仈鍒楄〃
     *
     * @param tSetmealCheckgroup 濂楅 妫€鏌ョ粍鍏宠仈
     * @return 濂楅 妫€鏌ョ粍鍏宠仈闆嗗悎
     */
    public List<com.health.reservation.domain.TSetmealCheckgroup> selectTOrdersettingList(com.health.reservation.domain.TSetmealCheckgroup tSetmealCheckgroup);

    /**
     * 鏂板 濂楅 妫€鏌ョ粍鍏宠仈
     *
     * @param tSetmealCheckgroup 濂楅 妫€鏌ョ粍鍏宠仈
     * @return 缁撴灉
     */
    public int insertTOrdersetting(com.health.reservation.domain.TSetmealCheckgroup tSetmealCheckgroup);

    /**
     * 淇 敼濂楅 妫€鏌ョ粍鍏宠仈
     *
     * @param tSetmealCheckgroup 濂楅 妫€鏌ョ粍鍏宠仈
     * @return 缁撴灉
     */
    public int updateTOrdersetting(com.health.reservation.domain.TSetmealCheckgroup tSetmealCheckgroup);

    /**
     * 鍒犻櫎濂楅 妫€鏌ョ粍鍏宠仈
     *
     * @param setmealId 濂楅 妫€鏌ョ粍鍏宠仈涓婚敭
     * @return 缁撴灉
     */
    public int deleteTSetmealCheckgroupBySetmealId(Long setmealId);

    /**
     * 鎵归噺鍒犻櫎濂楅 妫€鏌ョ粍鍏宠仈
     *
     * @param setmealIds 闇€瑕佸垹闄ょ殑鏁版嵁涓婚敭闆嗗悎
     * @return 缁撴灉
     */
    public int deleteTSetmealCheckgroupBySetmealIds(Long[] setmealIds);

    @Select("select count(1) from t_setmeal_checkgroup where checkgroup_id=#{id}")
    int selectCountByCheckgroupId(Long id);
}
