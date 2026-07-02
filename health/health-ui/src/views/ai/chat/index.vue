<template>
  <div class="ai-chat-container">
    <div class="chat-sidebar">
      <div class="sidebar-header">
        <el-button type="primary" icon="el-icon-edit" :loading="creating" @click="newConversation" size="small" style="width:100%">新建对话</el-button>
      </div>
      <div class="conv-list" v-loading="loadingConvs">
        <div v-if="conversations.length === 0 && !loadingConvs" class="conv-empty">暂无对话</div>
        <div v-for="conv in conversations" :key="conv.id" class="conv-item" :class="{ active: currentId === conv.id }" @click="selectConv(conv.id)">
          <i class="el-icon-chat-dot-round conv-icon"></i>
          <span class="conv-title">{{ conv.title }}</span>
          <div class="conv-actions" @click.stop>
            <el-tooltip content="重命名" placement="top">
              <el-button type="text" icon="el-icon-edit" size="mini" @click="openRename(conv)"></el-button>
            </el-tooltip>
            <el-tooltip content="删除" placement="top">
              <el-button type="text" icon="el-icon-delete" size="mini" style="color:#f56c6c" @click="delConversation(conv.id)"></el-button>
            </el-tooltip>
          </div>
        </div>
      </div>
    </div>
    <div class="chat-main">
      <div v-if="!currentId" class="welcome">
        <div class="welcome-icon">&#x2728;</div>
        <h2>你好，我是 AI 助手</h2>
        <p>选择左侧会话或点击「新建对话」开始</p>
      </div>
      <div v-show="currentId" class="messages-area" ref="msgArea">
        <div v-if="loadingMsgs" style="text-align:center;padding:40px"><i class="el-icon-loading"></i> 加载中...</div>
        <template v-else>
          <div v-for="(msg, i) in messages" :key="i" class="msg-row" :class="msg.role">
            <div class="avatar" :class="msg.role === 'assistant' ? 'ai-av' : 'user-av'">{{ msg.role === 'assistant' ? 'AI' : 'U' }}</div>
            <div class="bubble" :class="msg.role + '-bubble'">
              <div v-if="msg.loading" class="typing-dots"><span></span><span></span><span></span></div>
              <div v-else-if="msg.error" class="error-text"><i class="el-icon-warning"></i> {{ msg.error }}</div>
              <div v-else-if="msg.role === 'assistant'" class="md-content" v-html="renderMd(msg.content)"></div>
              <span v-else>{{ msg.content }}</span>
            </div>
          </div>
        </template>
        <div ref="msgBottom"></div>
      </div>
      <div class="input-area" v-show="currentId">
        <div class="input-box">
          <el-input type="textarea" v-model="inputText" :rows="1" :autosize="{ minRows: 1, maxRows: 5 }" placeholder="输入消息，Enter 发送，Shift+Enter 换行" :disabled="streaming" @keydown.native="handleKey"></el-input>
          <el-button type="primary" icon="el-icon-s-promotion" circle size="small" class="send-btn" :disabled="!inputText.trim() || streaming" @click="send"></el-button>
        </div>
      </div>
    </div>
    <el-dialog title="重命名会话" :visible.sync="renameVisible" width="400px" append-to-body>
      <el-input v-model="renameTitle" placeholder="请输入新标题"></el-input>
      <span slot="footer">
        <el-button @click="renameVisible = false">取消</el-button>
        <el-button type="primary" @click="doRename">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { listConversations, createConversation, renameConversation, deleteConversation, listMessages } from '@/api/ai/chat'
import { getToken } from '@/utils/auth'

export default {
  name: 'AiChat',
  data() {
    return {
      conversations: [],
      currentId: null,
      messages: [],
      inputText: '',
      streaming: false,
      creating: false,
      loadingConvs: false,
      loadingMsgs: false,
      renameVisible: false,
      renameId: null,
      renameTitle: ''
    }
  },
  mounted() {
    this.loadConversations()
  },
  methods: {
    async loadConversations() {
      this.loadingConvs = true
      try {
        var res = await listConversations()
        this.conversations = res.data || []
      } catch (e) {
        console.error(e)
      }
      this.loadingConvs = false
    },
    async newConversation() {
      this.creating = true
      try {
        var res = await createConversation()
        var conv = res.data
        this.conversations.unshift(conv)
        this.selectConv(conv.id)
      } catch (e) {
        this.$message.error('创建失败')
      }
      this.creating = false
    },
    async selectConv(id) {
      this.currentId = id
      this.messages = []
      this.loadingMsgs = true
      try {
        var res = await listMessages(id)
        this.messages = (res.data || []).map(function(m) { return Object.assign({}, m) })
      } catch (e) {
        console.error(e)
      }
      this.loadingMsgs = false
      var self = this
      this.$nextTick(function() { self.scrollBottom() })
    },
    handleKey(e) {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault()
        this.send()
      }
    },
    async send() {
      var text = this.inputText.trim()
      if (!text || this.streaming) return
      this.inputText = ''
      this.messages.push({ role: 'user', content: text })
      var aiMsg = { role: 'assistant', content: '', loading: true }
      this.messages.push(aiMsg)
      this.streaming = true
      var self = this
      this.$nextTick(function() { self.scrollBottom() })
      var token = getToken()
      var baseApi = process.env.VUE_APP_BASE_API || ''
      var url = baseApi + '/ai/chat/stream?conversationId=' + this.currentId + '&message=' + encodeURIComponent(text)
      try {
        var response = await fetch(url, { headers: { 'Authorization': 'Bearer ' + token } })
        var reader = response.body.getReader()
        var decoder = new TextDecoder()
        var buffer = ''
        while (true) {
          var result = await reader.read()
          if (result.done) break
          buffer += decoder.decode(result.value, { stream: true })
          var lines = buffer.split('\n')
          buffer = lines.pop() || ''
          for (var j = 0; j < lines.length; j++) {
            var line = lines[j]
            if (line.indexOf('event:') === 0) {
              var evt = line.substring(6).trim()
              if (evt === 'done') { aiMsg.loading = false; self.streaming = false }
              else if (evt === 'error') { aiMsg.loading = false; aiMsg.error = '服务异常'; self.streaming = false }
            } else if (line.indexOf('data:') === 0) {
              var data = line.substring(5).trim()
              if (data && data !== '[DONE]') {
                aiMsg.content += data
                self.$nextTick(function() { self.scrollBottom() })
              }
            }
          }
        }
      } catch (e) {
        aiMsg.loading = false
        aiMsg.error = '连接失败: ' + e.message
        self.streaming = false
      }
    },
    scrollBottom() {
      var el = this.$refs.msgBottom
      if (el) el.scrollIntoView({ behavior: 'smooth' })
    },
    openRename(conv) {
      this.renameId = conv.id
      this.renameTitle = conv.title
      this.renameVisible = true
    },
    async doRename() {
      if (!this.renameTitle.trim()) return
      try {
        await renameConversation(this.renameId, this.renameTitle)
        for (var i = 0; i < this.conversations.length; i++) {
          if (this.conversations[i].id === this.renameId) { this.conversations[i].title = this.renameTitle; break }
        }
        this.renameVisible = false
        this.$message.success('重命名成功')
      } catch (e) {
        this.$message.error('重命名失败')
      }
    },
    async delConversation(id) {
      try {
        await this.$confirm('确定删除该会话?', '提示', { type: 'warning' })
        await deleteConversation(id)
        this.conversations = this.conversations.filter(function(c) { return c.id !== id })
        if (this.currentId === id) { this.currentId = null; this.messages = [] }
        this.$message.success('删除成功')
      } catch (e) {
        if (e !== 'cancel') this.$message.error('删除失败')
      }
    },
    renderMd(text) {
      if (!text) return ''
      return text
        .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
        .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
        .replace(/\*(.+?)\*/g, '<em>$1</em>')
        .replace(/\n\n/g, '</p><p>')
        .replace(/\n/g, '<br/>')
        .replace(/`{3}(\w*)\n?([\s\S]*?)`{3}/g, '<pre class="code-block"><code>$2</code></pre>')
        .replace(/`(.+?)`/g, '<code class="inline-code">$1</code>')
        .replace(/^### (.+)/gm, '<h4>$1</h4>')
        .replace(/^## (.+)/gm, '<h3>$1</h3>')
        .replace(/^# (.+)/gm, '<h2>$1</h2>')
        .replace(/^- (.+)/gm, '<li>$1</li>')
        .replace(/(<li>.*<\/li>)/s, '<ul>$1</ul>')
    }
  }
}
</script>

<style scoped>
.ai-chat-container { display: flex; height: calc(100vh - 86px); background: #f5f7fa; }
.chat-sidebar { width: 260px; min-width: 260px; background: #fff; border-right: 1px solid #e8e8e8; display: flex; flex-direction: column; }
.sidebar-header { padding: 14px; border-bottom: 1px solid #f0f0f0; }
.conv-list { flex: 1; overflow-y: auto; padding: 6px 0; }
.conv-empty { text-align: center; color: #bbb; padding: 40px 0; font-size: 13px; }
.conv-item { display: flex; align-items: center; padding: 10px 14px; cursor: pointer; transition: background 0.15s; font-size: 13px; }
.conv-item:hover { background: #f5f7fa; }
.conv-item.active { background: #e6f0ff; }
.conv-icon { color: #6c3be4; margin-right: 8px; font-size: 15px; flex-shrink: 0; }
.conv-title { flex: 1; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.conv-actions { display: none; gap: 2px; }
.conv-item:hover .conv-actions { display: flex; }
.chat-main { flex: 1; display: flex; flex-direction: column; min-width: 0; }
.welcome { flex: 1; display: flex; flex-direction: column; align-items: center; justify-content: center; color: #909399; }
.welcome-icon { font-size: 48px; margin-bottom: 16px; }
.welcome h2 { margin: 0 0 8px; color: #303133; }
.welcome p { margin: 0; font-size: 14px; }
.messages-area { flex: 1; overflow-y: auto; padding: 20px 40px; }
.msg-row { display: flex; margin-bottom: 18px; gap: 10px; }
.msg-row.user { flex-direction: row-reverse; }
.msg-row.assistant { flex-direction: row; }
.avatar { width: 34px; height: 34px; border-radius: 50%; flex-shrink: 0; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: 600; color: #fff; }
.user-av { background: #409eff; }
.ai-av { background: linear-gradient(135deg, #6c3be4, #409eff); }
.bubble { max-width: 72%; padding: 10px 16px; border-radius: 12px; font-size: 14px; line-height: 1.7; word-break: break-word; }
.user-bubble { background: #409eff; color: #fff; border-bottom-right-radius: 4px; }
.assistant-bubble { background: #fff; color: #303133; border-bottom-left-radius: 4px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); }
.typing-dots { display: flex; gap: 5px; padding: 4px 0; }
.typing-dots span { width: 7px; height: 7px; background: #c0c4cc; border-radius: 50%; animation: bounce 1.2s infinite; }
.typing-dots span:nth-child(2) { animation-delay: 0.2s; }
.typing-dots span:nth-child(3) { animation-delay: 0.4s; }
@keyframes bounce { 0%,60%,100% { transform: translateY(0); } 30% { transform: translateY(-6px); } }
.error-text { color: #f56c6c; display: flex; align-items: center; gap: 6px; }
.md-content >>> pre.code-block { background: #1e1e2e; color: #cdd6f4; padding: 12px 16px; border-radius: 6px; overflow-x: auto; font-size: 13px; margin: 6px 0; }
.md-content >>> code.inline-code { background: #f0f2f5; color: #e83e8c; padding: 1px 5px; border-radius: 3px; font-size: 13px; }
.md-content >>> h2, .md-content >>> h3, .md-content >>> h4 { margin: 8px 0 4px; }
.md-content >>> ul { margin: 4px 0; padding-left: 20px; }
.md-content >>> li { margin: 2px 0; }
.input-area { padding: 12px 40px 16px; background: #f5f7fa; flex-shrink: 0; }
.input-box { display: flex; align-items: flex-end; gap: 8px; max-width: 800px; margin: 0 auto; background: #fff; border: 1px solid #dcdfe6; border-radius: 10px; padding: 6px 8px 6px 14px; }
.input-box >>> .el-textarea__inner { border: none !important; resize: none !important; padding: 4px 0 !important; background: transparent !important; }
.send-btn { flex-shrink: 0; margin-bottom: 2px; }
</style>