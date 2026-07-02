package com.health.ai.domain;

import com.health.common.core.domain.BaseEntity;

public class AiConversation extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private Long id;
    private String title;
    private Long userId;
    private String model;
    private Integer status;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }
}
