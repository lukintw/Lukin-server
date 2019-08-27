class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_messages_channel'
  end

  def send_text(data)
    ChatLog.create(chat_box_id: data['chat_box_id'], content: data['content'], speaker_id: data['speaker_id'])
    ActionCable.server.broadcast('chat_messages_channel', content: data['content'], speaker_id: data['speaker_id'], chat_box_id: data['chat_box_id'])
  end
end
