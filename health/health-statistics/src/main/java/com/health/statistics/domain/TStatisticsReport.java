package com.health.statistics.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.health.common.annotation.Excel;
import com.health.common.core.domain.BaseEntity;

/**
 * 统计报表对象 t_statistics_report
 *
 * @author wjj
 * @date 2026-07-02
 */
public class TStatisticsReport extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 报表名称 */
    @Excel(name = "报表名称")
    private String reportName;

    /** 报表类型 */
    @Excel(name = "报表类型")
    private String reportType;

    /** 开始日期 */
    @Excel(name = "开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 结束日期 */
    @Excel(name = "结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 生成时间 */
    @Excel(name = "生成时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date generateTime;

    /** 数据JSON */
    private String dataJson;

    /** 总数 */
    @Excel(name = "总数")
    private Long totalCount;

    /** 状态（0草稿 1已发布） */
    @Excel(name = "状态", readConverterExp = "0=草稿,1=已发布")
    private String status;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setReportName(String reportName)
    {
        this.reportName = reportName;
    }

    public String getReportName()
    {
        return reportName;
    }

    public void setReportType(String reportType)
    {
        this.reportType = reportType;
    }

    public String getReportType()
    {
        return reportType;
    }

    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }

    public Date getStartDate()
    {
        return startDate;
    }

    public void setEndDate(Date endDate)
    {
        this.endDate = endDate;
    }

    public Date getEndDate()
    {
        return endDate;
    }

    public void setGenerateTime(Date generateTime)
    {
        this.generateTime = generateTime;
    }

    public Date getGenerateTime()
    {
        return generateTime;
    }

    public void setDataJson(String dataJson)
    {
        this.dataJson = dataJson;
    }

    public String getDataJson()
    {
        return dataJson;
    }

    public void setTotalCount(Long totalCount)
    {
        this.totalCount = totalCount;
    }

    public Long getTotalCount()
    {
        return totalCount;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("reportName", getReportName())
            .append("reportType", getReportType())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("generateTime", getGenerateTime())
            .append("dataJson", getDataJson())
            .append("totalCount", getTotalCount())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
