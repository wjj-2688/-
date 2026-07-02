package com.health.ai.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import com.health.common.annotation.Log;
import com.health.common.core.controller.BaseController;
import com.health.common.core.domain.AjaxResult;
import com.health.common.enums.BusinessType;
import com.health.common.utils.SecurityUtils;
import com.health.ai.domain.AiConversation;
import com.health.ai.domain.AiMessage;
import com.health.ai.service.IAiChatService;

@RestController
@RequestMapping("/ai/chat")
public class AiChatController extends BaseController
{
    @Autowired
    private IAiChatService aiChatService;

    @GetMapping("/conversations")
    public AjaxResult listConversations()
    {
        Long userId = SecurityUtils.getUserId();
        List<AiConversation> list = aiChatService.listConversations(userId);
        return AjaxResult.success(list);
    }

    @PostMapping("/conversations")
    public AjaxResult createConversation(@RequestParam(required = false) String model)
    {
        Long userId = SecurityUtils.getUserId();
        AiConversation conv = aiChatService.createConversation(userId, model);
        return AjaxResult.success(conv);
    }

    @PutMapping("/conversations/{id}/title")
    public AjaxResult renameConversation(@PathVariable Long id, @RequestParam String title)
    {
        Long userId = SecurityUtils.getUserId();
        aiChatService.renameConversation(id, title, userId);
        return AjaxResult.success();
    }

    @Log(title = "AI对话", businessType = BusinessType.DELETE)
    @DeleteMapping("/conversations/{id}")
    public AjaxResult deleteConversation(@PathVariable Long id)
    {
        Long userId = SecurityUtils.getUserId();
        aiChatService.deleteConversation(id, userId);
        return AjaxResult.success();
    }

    @GetMapping("/conversations/{id}/messages")
    public AjaxResult listMessages(@PathVariable Long id)
    {
        Long userId = SecurityUtils.getUserId();
        List<AiMessage> messages = aiChatService.listMessages(id, userId);
        return AjaxResult.success(messages);
    }

    @GetMapping(value = "/stream", produces = "text/event-stream;charset=UTF-8")
    public SseEmitter stream(@RequestParam Long conversationId, @RequestParam String message)
    {
        SseEmitter emitter = new SseEmitter(0L);
        Long userId = SecurityUtils.getUserId();
        new Thread(() -> aiChatService.chat(conversationId, message, userId, emitter)).start();
        return emitter;
    }
}
