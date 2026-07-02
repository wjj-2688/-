package com.health.ai.service;

import com.health.ai.domain.AiConversation;
import com.health.ai.domain.AiMessage;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import java.util.List;

public interface IAiChatService
{
    AiConversation createConversation(Long userId, String model);
    List<AiConversation> listConversations(Long userId);
    List<AiMessage> listMessages(Long conversationId, Long userId);
    int renameConversation(Long id, String title, Long userId);
    int deleteConversation(Long id, Long userId);
    void chat(Long conversationId, String userMessage, Long userId, SseEmitter emitter);
}
