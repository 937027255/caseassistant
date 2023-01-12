package com.ruoyi.demo.mapper;


import com.ruoyi.demo.domain.DemoNotice;
import com.ruoyi.system.domain.SysNotice;

import java.util.List;

/**
 * 公告 数据层
 * 
 * @author ruoyi
 */
public interface DemoNoticeMapper
{
    /**
     * 查询公告信息
     * 
     * @param noticeId 公告ID
     * @return 公告信息
     */
    public DemoNotice selectNoticeById(Long noticeId);

    /**
     * 查询公告列表
     * 
     * @param notice 公告信息
     * @return 公告集合
     */
    public List<DemoNotice> selectNoticeList(DemoNotice notice);

    /**
     * 新增公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    public int insertNotice(DemoNotice notice);

    /**
     * 修改公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    public int updateNotice(DemoNotice notice);

    /**
     * 批量删除公告
     *
     * @param noticeIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteNoticeByIds(String[] noticeIds);
}