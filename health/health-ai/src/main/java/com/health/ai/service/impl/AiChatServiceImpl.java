package com.health.ai.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import com.health.common.utils.SecurityUtils;
import com.health.ai.config.AiModelProperties;
import com.health.ai.domain.AiConversation;
import com.health.ai.mapper.AiChatMapper;
import com.health.ai.service.IAiChatService;
import dev.langchain4j.data.message.ChatMessage;
import dev.langchain4j.data.message.SystemMessage;
import dev.langchain4j.data.message.UserMessage;
import dev.langchain4j.model.StreamingResponseHandler;
import dev.langchain4j.model.chat.StreamingChatLanguageModel;
import dev.langchain4j.model.output.Response;

@Service
public class AiChatServiceImpl implements IAiChatService
{
    private static final Logger log = LoggerFactory.getLogger(AiChatServiceImpl.class);

    @Autowired
    private StreamingChatLanguageModel streamingModel;

    @Autowired
    private AiModelProperties modelProps;

    @Autowired
    private AiChatMapper aiChatMapper;

    @Override
    public AiConversation createConversation(Long userId, String model)
    {
        AiConversation conv = new AiConversation();
        conv.setUserId(userId);
        conv.setTitle("New Chat");
        conv.setModel(model == null ? modelProps.getModelName() : model);
        conv.setCreateBy(SecurityUtils.getUsername());
        aiChatMapper.insertConversation(conv);
        return conv;
    }

    @Override
    public List<AiConversation> listConversations(Long userId)
    {
        List<AiConversation> list = aiChatMapper.selectConversationsByUserId(userId);
        return list != null ? list : new ArrayList<>();
    }

    @Override
    public List<com.health.ai.domain.AiMessage> listMessages(Long conversationId, Long userId)
    {
        AiConversation conv = aiChatMapper.selectConversationById(conversationId, userId);
        if (conv == null)
        {
            return new ArrayList<>();
        }
        return aiChatMapper.selectMessagesByConversationId(conversationId);
    }

    @Override
    public int renameConversation(Long id, String title, Long userId)
    {
        return aiChatMapper.updateConversationTitle(id, title, userId);
    }

    @Override
    public int deleteConversation(Long id, Long userId)
    {
        aiChatMapper.deleteMessagesByConversationId(id);
        return aiChatMapper.deleteConversation(id, userId);
    }

    @Override
    public void chat(Long conversationId, String userMessage, Long userId, SseEmitter emitter)
    {
        try
        {
            AiConversation conv = aiChatMapper.selectConversationById(conversationId, userId);
            if (conv == null)
            {
                sendSse(emitter, "error", "Unauthorized access");
                emitter.complete();
                return;
            }
            // Save user message
            if (userMessage != null && !userMessage.isEmpty())
            {
                com.health.ai.domain.AiMessage msg = new com.health.ai.domain.AiMessage();
                msg.setConversationId(conversationId);
                msg.setRole("user");
                msg.setContent(userMessage);
                aiChatMapper.insertMessage(msg);
            }
            StringBuilder fullReply = new StringBuilder();
            streamingModel.generate(buildMessages(conversationId), new StreamingResponseHandler<dev.langchain4j.data.message.AiMessage>()
            {
                @Override
                public void onNext(String token)
                {
                    fullReply.append(token);
                    sendSse(emitter, "message", token);
                }

                @Override
                public void onComplete(Response<dev.langchain4j.data.message.AiMessage> response)
                {
                    if (fullReply.length() > 0)
                    {
                        com.health.ai.domain.AiMessage aiMsg = new com.health.ai.domain.AiMessage();
                        aiMsg.setConversationId(conversationId);
                        aiMsg.setRole("assistant");
                        aiMsg.setContent(fullReply.toString());
                        if (response.tokenUsage() != null)
                        {
                            aiMsg.setTokens(response.tokenUsage().totalTokenCount());
                        }
                        aiChatMapper.insertMessage(aiMsg);
                    }
                    sendSse(emitter, "done", "[DONE]");
                    emitter.complete();
                }

                @Override
                public void onError(Throwable error)
                {
                    log.error("LangChain4j Stream Error", error);
                    sendSse(emitter, "error", "AI Error: " + error.getMessage());
                    emitter.completeWithError(error);
                }
            });
        }
        catch (Exception e)
        {
            log.error("Chat Error", e);
            sendSse(emitter, "error", "System Error: " + e.getMessage());
            emitter.completeWithError(e);
        }
    }

    private List<ChatMessage> buildMessages(Long conversationId)
    {
        List<com.health.ai.domain.AiMessage> history = aiChatMapper.selectMessagesByConversationId(conversationId);
        List<ChatMessage> list = new ArrayList<>();
        String system = modelProps.getSystemPrompt();
        if (system != null && !system.isEmpty())
        {
            list.add(SystemMessage.from(system));
        }
        int max = modelProps.getMaxHistoryMessages();
        int start = Math.max(0, history.size() - max);
        for (int i = start; i < history.size(); i++)
        {
            com.health.ai.domain.AiMessage m = history.get(i);
            if ("user".equals(m.getRole()))
            {
                list.add(UserMessage.from(m.getContent()));
            }
            else
            {
                list.add(dev.langchain4j.data.message.AiMessage.from(m.getContent()));
            }
        }
        return list;
    }

    private void sendSse(SseEmitter emitter, String event, String data)
    {
        try
        {
            emitter.send(SseEmitter.event().name(event).data(data));
        }
        catch (Exception e)
        {
            log.warn("SSE Push Failed: event={}", event);
        }
    }
}
