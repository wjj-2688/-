package com.health.reservation.service.impl;

import java.util.List;
import com.health.common.utils.DateUtils;
import com.health.reservation.dto.TCheckgroupDto;
import com.health.reservation.mapper.TCheckgroupCheckitemMapper;
import com.health.reservation.mapper.TSetmealCheckgroup;
import com.health.reservation.vo.TCheckgroupVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.health.reservation.mapper.TCheckgroupMapper;
import com.health.reservation.domain.TCheckgroup;
import com.health.reservation.service.ITCheckgroupService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 妫€鏌ョ粍绠＄悊Service涓氬姟灞傚 鐞?
 * 
 * @author wjj
 * @date 2026-06-30
 */
@Transactional
@Service
public class TCheckgroupServiceImpl implements ITCheckgroupService 
{
    @Autowired
    private TCheckgroupMapper tCheckgroupMapper;
    @Autowired
    private TCheckgroupCheckitemMapper tCheckgroupCheckitemMapper;
    @Autowired
    private TSetmealCheckgroup tSetmealCheckgroup;

    /**
     * 鏌ヨ 妫€鏌ョ粍绠＄悊
     * 
     * @param id 妫€鏌ョ粍绠＄悊涓婚敭
     * @return 妫€鏌ョ粍绠＄悊
     */
    @Override
    public TCheckgroupVo selectTCheckgroupById(Long id)
    {
        //1.鏌ヨ 妫€鏌ョ粍鍩烘湰淇℃伅
        TCheckgroup tCheckgroup = tCheckgroupMapper.selectTCheckgroupById(id);
        //2.鏍规嵁妫€鏌ョ粍鐨刬d鏌ヨ 妫€鏌ラ」鍏宠仈鏁版嵁
        List<Long> list=tCheckgroupCheckitemMapper.selectCheckitemIds(id);
        //3.灏佽  vo瀵硅薄
        TCheckgroupVo vo=new TCheckgroupVo();
        BeanUtils.copyProperties(tCheckgroup,vo);
        vo.setCheckItemIds(list);
        return vo;
    }

    /**
     * 鏌ヨ 妫€鏌ョ粍绠＄悊鍒楄〃
     * 
     * @param tCheckgroup 妫€鏌ョ粍绠＄悊
     * @return 妫€鏌ョ粍绠＄悊
     */
    @Override
    public List<TCheckgroup> selectTCheckgroupList(TCheckgroup tCheckgroup)
    {
        return tCheckgroupMapper.selectTCheckgroupList(tCheckgroup);
    }

    /**
     * 鏂板 妫€鏌ョ粍绠＄悊
     * 
     * @param dto 检查组DTO
     * @return 缁撴灉
     */
    @Override
    public int insertTCheckgroup(TCheckgroupDto dto)
    {
        dto.setCreateTime(DateUtils.getNowDate());
        int count=tCheckgroupMapper.insertTCheckgroup(dto);
        if (dto.getCheckItemIds()!=null&&dto.getCheckItemIds().size()>0){
            tCheckgroupCheckitemMapper .insertCheckitemIds(dto.getCheckItemIds(),dto.getId());
        }

        return count;
    }


    @Override
    public int updateTCheckgroup(TCheckgroupDto dto)
    {
        try {
            //1.鍒ゆ柇妫€鏌ラ」id闆嗗悎鏄 惁涓虹┖
            if (dto.getCheckItemIds() != null && dto.getCheckItemIds().size() > 0) {
                //2.鍒犻櫎鍘熸湁鐨勬 鏌ョ粍鍜屾 鏌ラ」鍏宠仈鍏崇郴
                tCheckgroupCheckitemMapper.deleteTCheckgroupCheckitemByCheckgroupId(dto.getId());
                //3.鎵归噺淇濆瓨妫€鏌ョ粍鍜屾 鏌ラ」鐨勫叧鑱斿叧绯?
                tCheckgroupCheckitemMapper.insertCheckitemIds(dto.getCheckItemIds(), dto.getId());
            }
            //4.鏇存柊妫€鏌ョ粍鍩烘湰淇℃伅
            dto.setUpdateTime(DateUtils.getNowDate());
            return tCheckgroupMapper.updateTCheckgroup(dto);
        } catch (Exception e) {
            throw new RuntimeException("淇 敼妫€鏌ョ粍淇℃伅澶辫触");
        }
    }

    /**
     * 鎵归噺鍒犻櫎妫€鏌ョ粍绠＄悊
     * 
     * @param ids 闇€瑕佸垹闄ょ殑妫€鏌ョ粍绠＄悊涓婚敭
     * @return 缁撴灉
     */
    @Override
    public int deleteTCheckgroupByIds(Long[] ids)
    {
        return tCheckgroupMapper.deleteTCheckgroupByIds(ids);
    }

    /**
     * 鍒犻櫎妫€鏌ョ粍淇℃伅
     * 
     * @param id 妫€鏌ョ粍涓婚敭
     * @return 缁撴灉
     */
    @Override
    public int deleteTCheckgroupById(Long id)
    {
        //1.鍒ゆ柇妫€鏌ョ粍鏄 惁琚 椁愬叧鑱?
        int count = tSetmealCheckgroup.selectCountByCheckgroupId(id);
        if (count > 0) {
            throw new RuntimeException("褰撳墠妫€鏌ョ粍琚 椁愬叧鑱旓紝涓嶈兘鍒犻櫎");
        }
        //2.鍒犻櫎妫€鏌ョ粍鍜屾 鏌ラ」鐨勫叧鑱斿叧绯?
        tCheckgroupCheckitemMapper.deleteTCheckgroupCheckitemByCheckgroupId(id);
        //3.鍒犻櫎妫€鏌ョ粍淇℃伅
        return tCheckgroupMapper.deleteTCheckgroupById(id);
    }
}
