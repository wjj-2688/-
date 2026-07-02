package com.health.report.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.health.common.annotation.Excel;
import com.health.common.core.domain.BaseEntity;

/**
 * 体检报告对象 t_physical_report
 *
 * @author wjj
 * @date 2026-07-02
 */
public class TPhysicalReport extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 报告编号 */
    @Excel(name = "报告编号")
    private String reportNo;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别（0女 1男） */
    @Excel(name = "性别", readConverterExp = "0=女,1=男")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer age;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 体检日期 */
    @Excel(name = "体检日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date examDate;

    /** 体检类型 */
    @Excel(name = "体检类型")
    private String examType;

    /** 科室 */
    @Excel(name = "科室")
    private String department;

    /** 体检结论 */
    @Excel(name = "体检结论")
    private String conclusion;

    /** 建议 */
    @Excel(name = "建议")
    private String suggestion;

    /** 医生 */
    @Excel(name = "医生")
    private String doctor;

    /** 状态（0未审核 1已审核） */
    @Excel(name = "状态", readConverterExp = "0=未审核,1=已审核")
    private String status;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setReportNo(String reportNo)
    {
        this.reportNo = reportNo;
    }

    public String getReportNo()
    {
        return reportNo;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getGender()
    {
        return gender;
    }

    public void setAge(Integer age)
    {
        this.age = age;
    }

    public Integer getAge()
    {
        return age;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setExamDate(Date examDate)
    {
        this.examDate = examDate;
    }

    public Date getExamDate()
    {
        return examDate;
    }

    public void setExamType(String examType)
    {
        this.examType = examType;
    }

    public String getExamType()
    {
        return examType;
    }

    public void setDepartment(String department)
    {
        this.department = department;
    }

    public String getDepartment()
    {
        return department;
    }

    public void setConclusion(String conclusion)
    {
        this.conclusion = conclusion;
    }

    public String getConclusion()
    {
        return conclusion;
    }

    public void setSuggestion(String suggestion)
    {
        this.suggestion = suggestion;
    }

    public String getSuggestion()
    {
        return suggestion;
    }

    public void setDoctor(String doctor)
    {
        this.doctor = doctor;
    }

    public String getDoctor()
    {
        return doctor;
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
            .append("reportNo", getReportNo())
            .append("name", getName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("idCard", getIdCard())
            .append("phone", getPhone())
            .append("examDate", getExamDate())
            .append("examType", getExamType())
            .append("department", getDepartment())
            .append("conclusion", getConclusion())
            .append("suggestion", getSuggestion())
            .append("doctor", getDoctor())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
