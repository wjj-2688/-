package com.health.ai.mapper;

import com.health.ai.domain.AiConversation;
import com.health.ai.domain.AiMessage;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AiChatMapper
{
    int insertConversation(AiConversation conversation);
    int updateConversationTitle(@Param("id") Long id, @Param("title") String title, @Param("userId") Long userId);
    int deleteConversation(@Param("id") Long id, @Param("userId") Long userId);
    List<AiConversation> selectConversationsByUserId(Long userId);
    AiConversation selectConversationById(@Param("id") Long id, @Param("userId") Long userId);
    int insertMessage(AiMessage message);
    List<AiMessage> selectMessagesByConversationId(Long conversationId);
    int deleteMessagesByConversationId(Long conversationId);
}
